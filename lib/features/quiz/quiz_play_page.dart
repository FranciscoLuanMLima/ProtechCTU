import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/services/push_notification_service.dart';
import '../../core/widgets/app_card.dart';
import '../auth/auth_repository.dart';
import '../user/domain/entities/learning_dashboard.dart';
import '../user/providers/user_providers.dart';
import 'domain/entities/programming_quiz.dart';
import 'providers/quiz_providers.dart';

class QuizPlayPage extends ConsumerStatefulWidget {
  const QuizPlayPage({required this.quizId, super.key});

  final String quizId;

  @override
  ConsumerState<QuizPlayPage> createState() => _QuizPlayPageState();
}

class _QuizPlayPageState extends ConsumerState<QuizPlayPage> {
  final Map<int, int> _answers = <int, int>{};
  final DateTime _startedAt = DateTime.now().toUtc();
  QuizCompletion? _completion;
  bool _submitting = false;
  String? _error;

  QuizLearner? get _learner {
    final user = AuthRepository.instance.currentUser;
    if (user == null) {
      return null;
    }
    return QuizLearner(
      userId: user.registration,
      name: user.name,
      gender: user.gender,
      entryYear: user.entryYear,
    );
  }

  Future<void> _finish(ProgrammingQuiz quiz) async {
    final learner = _learner;
    if (learner == null) {
      setState(() => _error = 'Entre novamente para concluir o quiz.');
      return;
    }
    if (_answers.length != quiz.questions.length) {
      setState(() => _error = 'Responda todas as perguntas antes de concluir.');
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      final repository = await ref.read(quizRepositoryProvider.future);
      final completion = await repository.submit(
        learner: learner,
        quiz: quiz,
        selectedOptionIndexes: List<int>.generate(
          quiz.questions.length,
          (index) => _answers[index]!,
        ),
        startedAt: _startedAt,
      );
      try {
        final recordActivity = await ref.read(
          recordStudyActivityProvider.future,
        );
        final duration = completion.attempt.completedAt.difference(
          completion.attempt.startedAt,
        );
        await recordActivity(
          StudyActivity(
            activityId: '${completion.attempt.attemptId}-learning',
            userId: learner.userId,
            topicId: quiz.topicId,
            type: StudyEventType.quizCompleted,
            occurredAt: completion.attempt.completedAt,
            duration: duration,
            responseTime: completion.attempt.totalQuestions == 0
                ? null
                : Duration(
                    milliseconds:
                        duration.inMilliseconds ~/
                        completion.attempt.totalQuestions,
                  ),
            wasCorrect: completion.attempt.accuracyRate >= 0.7,
            wasFirstAttempt: true,
            masteryAfterEvent: completion.attempt.accuracyRate,
          ),
        );
      } catch (_) {
        // A tentativa e a recompensa ja foram salvas; a analise sera atualizada
        // na proxima atividade valida do mesmo assunto.
      }
      ref.invalidate(quizAttemptsProvider(learner.userId));
      unawaited(
        PushNotificationService.recordNotification(
          title: 'Quiz concluido',
          body:
              'Voce recebeu ${completion.attempt.xpEarned} XP em ${quiz.title}.',
          source: 'achievement',
        ),
      );
      setState(() => _completion = completion);
    } catch (error) {
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizAsync = ref.watch(programmingQuizProvider(widget.quizId));
    return Scaffold(
      appBar: AppBar(title: const Text('Resolver Quiz')),
      body: quizAsync.when(
        data: (quiz) {
          if (quiz == null) {
            return const Center(child: Text('Quiz não encontrado.'));
          }
          if (_completion != null) {
            return _ResultView(quiz: quiz, completion: _completion!);
          }
          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                quiz.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(quiz.description),
              const SizedBox(height: 20),
              for (var index = 0; index < quiz.questions.length; index++) ...[
                _QuestionCard(
                  number: index + 1,
                  question: quiz.questions[index],
                  selectedIndex: _answers[index],
                  onChanged: (value) => setState(() => _answers[index] = value),
                ),
                const SizedBox(height: 12),
              ],
              if (_error != null) ...[
                Text(
                  _error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                const SizedBox(height: 12),
              ],
              FilledButton.icon(
                onPressed: _submitting ? null : () => _finish(quiz),
                icon: const Icon(Icons.check_circle_outline),
                label: Text(
                  _submitting ? 'Salvando...' : 'Concluir e receber recompensa',
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            Center(child: Text('Erro ao carregar quiz: $error')),
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.number,
    required this.question,
    required this.selectedIndex,
    required this.onChanged,
  });

  final int number;
  final QuizQuestion question;
  final int? selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ${question.prompt}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 10),
          RadioGroup<int>(
            groupValue: selectedIndex,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
            child: Column(
              children: [
                for (var index = 0; index < question.options.length; index++)
                  RadioListTile<int>(
                    contentPadding: EdgeInsets.zero,
                    value: index,
                    title: Text(question.options[index]),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultView extends StatelessWidget {
  const _ResultView({required this.quiz, required this.completion});

  final ProgrammingQuiz quiz;
  final QuizCompletion completion;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Resultado', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${completion.attempt.correctAnswers}/${completion.attempt.totalQuestions} respostas corretas',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Text(
                '+${completion.attempt.xpEarned} XP  |  +${completion.attempt.coinsEarned} moedas',
              ),
              Text(
                'Nível ${completion.newLevel}  |  XP total: ${completion.totalXp}',
              ),
              Text(
                'Saldo: ${completion.coinsBalance} moedas  |  Sequência: ${completion.streakDays} dia(s)',
              ),
              if (completion.didLevelUp) ...[
                const SizedBox(height: 10),
                const Text('Novo nível alcançado!'),
              ],
              if (completion.attempt.isPerfect) ...[
                const SizedBox(height: 10),
                const Text('Badge desbloqueado: Quiz Perfeito'),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text('Correções', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        for (var index = 0; index < quiz.questions.length; index++) ...[
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(quiz.questions[index].prompt),
                const SizedBox(height: 8),
                Text(
                  completion.attempt.selectedOptionIndexes[index] ==
                          quiz.questions[index].correctOptionIndex
                      ? 'Resposta correta.'
                      : 'Resposta correta: ${quiz.questions[index].options[quiz.questions[index].correctOptionIndex]}',
                ),
                const SizedBox(height: 6),
                Text(quiz.questions[index].explanation),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
