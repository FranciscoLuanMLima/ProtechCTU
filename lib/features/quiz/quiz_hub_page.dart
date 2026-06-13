import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/widgets/app_card.dart';
import '../user/domain/entities/user_profile.dart';
import '../user/providers/user_providers.dart';
import 'domain/entities/programming_quiz.dart';
import 'providers/quiz_providers.dart';

class QuizHubPage extends ConsumerWidget {
  const QuizHubPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeUser = ref.watch(activeUserSessionProvider);
    final session = activeUser.asData?.value;
    if (activeUser.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    if (session == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: const Center(child: Text('Entre para acessar os quizzes.')),
      );
    }
    final authUser = session.authUser;
    final learner = QuizLearner(
      userId: session.learnerId,
      name: authUser.name,
      gender: authUser.gender,
      entryYear: authUser.entryYear,
    );
    final quizzes = ref.watch(programmingQuizzesProvider);
    final profile = ref.watch(quizLearnerProfileProvider(learner));
    final attempts = ref.watch(quizAttemptsProvider(learner.userId));

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz de Programação')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          profile.when(
            data: (data) => _GamificationHeader(profile: data),
            loading: () => const LinearProgressIndicator(),
            error: (_, _) =>
                const Text('Não foi possível carregar suas recompensas.'),
          ),
          const SizedBox(height: 20),
          Text(
            'Escolha um desafio',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          quizzes.when(
            data: (items) => Column(
              children: [
                for (final quiz in items) ...[
                  _QuizCard(
                    quiz: quiz,
                    attempts: attempts.when(
                      data: (items) => items
                          .where((item) => item.quizId == quiz.quizId)
                          .length,
                      loading: () => 0,
                      error: (_, _) => 0,
                    ),
                    onStart: () => context.pushNamed(
                      AppRoute.quizPlay.name,
                      pathParameters: <String, String>{'id': quiz.quizId},
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Text('Erro ao carregar quizzes: $error'),
          ),
        ],
      ),
    );
  }
}

class _GamificationHeader extends StatelessWidget {
  const _GamificationHeader({required this.profile});

  final UserProfile? profile;

  @override
  Widget build(BuildContext context) {
    final data = profile;
    if (data == null) {
      return const AppCard(child: Text('Preparando seu perfil gamificado...'));
    }
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nível ${data.progression.level} - ${data.progression.title}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: data.progression.nextLevelXp == 0
                ? 0
                : data.progression.currentXp / data.progression.nextLevelXp,
          ),
          const SizedBox(height: 12),
          Text(
            'XP: ${data.progression.totalXp}  |  Moedas: ${data.economy.coins}  |  Sequência: ${data.streak.currentOffenseDays} dia(s)',
          ),
        ],
      ),
    );
  }
}

class _QuizCard extends StatelessWidget {
  const _QuizCard({
    required this.quiz,
    required this.attempts,
    required this.onStart,
  });

  final ProgrammingQuiz quiz;
  final int attempts;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  quiz.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Chip(label: Text(quiz.difficulty.name)),
            ],
          ),
          const SizedBox(height: 8),
          Text(quiz.description),
          const SizedBox(height: 10),
          Text(
            '${quiz.questions.length} perguntas | até ${quiz.questions.length * quiz.xpRewardPerCorrectAnswer + quiz.perfectBonusXp} XP | $attempts tentativa(s)',
          ),
          const SizedBox(height: 14),
          FilledButton.icon(
            onPressed: onStart,
            icon: const Icon(Icons.quiz_outlined),
            label: const Text('Começar quiz'),
          ),
        ],
      ),
    );
  }
}
