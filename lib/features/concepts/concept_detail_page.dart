import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/services/logger.dart';
import '../../core/services/quiz_gamification_service.dart';
import '../../core/constants/study_requirements.dart';
import '../../core/widgets/app_card.dart';
import '../auth/auth_repository.dart';
import '../quiz/domain/entities/programming_quiz.dart';
import '../user/data/datasources/learning_topic_catalog_datasource.dart';
import '../user/domain/entities/learning_dashboard.dart';
import '../user/domain/entities/user_profile.dart';
import '../user/providers/user_providers.dart';
import 'concept_model.dart';
import 'concepts_repository.dart';

class ConceptDetailPage extends StatelessWidget {
  const ConceptDetailPage({required this.conceptId, super.key});

  final String conceptId;

  @override
  Widget build(BuildContext context) {
    final concept = ConceptsRepository.instance.findById(conceptId);
    if (concept == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Assunto')),
        body: const Center(child: Text('Assunto não encontrado.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(concept.title)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text(concept.difficulty)),
              Chip(
                label: Text(
                  '${StudyRequirements.minimumStudyDuration.inMinutes} minutos obrigatórios',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _SectionCard(
            title: 'O que você vai aprender',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final objective in concept.objectives)
                  _Bullet(text: objective),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _SectionCard(title: 'Explicação', child: Text(concept.explanation)),
          const SizedBox(height: 12),
          _SectionCard(
            title: 'Exemplo em Python',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CodeBlock(code: concept.exampleCode),
                const SizedBox(height: 12),
                Text(concept.exampleExplanation),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _SectionCard(
            title: 'Pratique passo a passo',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var index = 0; index < concept.guidedSteps.length; index++)
                  _NumberedStep(
                    number: index + 1,
                    text: concept.guidedSteps[index],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _Checkpoint(concept: concept),
          if (concept.nextTopic != null) ...[
            const SizedBox(height: 12),
            AppCard(
              child: Text(
                'Próximo assunto recomendado: ${concept.nextTopic}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('-  '),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class _NumberedStep extends StatelessWidget {
  const _NumberedStep({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 12, child: Text(number.toString())),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class _CodeBlock extends StatelessWidget {
  const _CodeBlock({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SelectableText(
        code,
        style: const TextStyle(fontFamily: 'monospace', height: 1.5),
      ),
    );
  }
}

class _Checkpoint extends ConsumerStatefulWidget {
  const _Checkpoint({required this.concept});

  final ConceptModel concept;

  @override
  ConsumerState<_Checkpoint> createState() => _CheckpointState();
}

class _CheckpointState extends ConsumerState<_Checkpoint> {
  bool _showAnswer = false;
  bool _completed = false;
  bool _submitting = false;
  String? _error;
  late int _remainingSeconds;
  late final DateTime _startedAt;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startedAt = DateTime.now().toUtc();
    _remainingSeconds = StudyRequirements.minimumStudyDuration.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 1) {
        timer.cancel();
        if (mounted) {
          setState(() => _remainingSeconds = 0);
        }
        return;
      }
      if (mounted) {
        setState(() => _remainingSeconds--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canConfirm = _remainingSeconds == 0;
    return _SectionCard(
      title: 'Cheque seu entendimento',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StudyTimer(remainingSeconds: _remainingSeconds),
          const SizedBox(height: 16),
          Text(widget.concept.checkpointQuestion),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: canConfirm && !_submitting && !_completed
                ? _completeTopic
                : null,
            icon: Icon(
              _completed ? Icons.check_circle_outline : Icons.task_alt_outlined,
            ),
            label: Text(
              _completed
                  ? 'Assunto concluido'
                  : _submitting
                  ? 'Registrando...'
                  : canConfirm
                  ? 'Concluir assunto'
                  : 'Aguarde ${_formatCountdown(_remainingSeconds)}',
            ),
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          if (_showAnswer) ...[
            const SizedBox(height: 12),
            Text(widget.concept.checkpointAnswer),
          ],
        ],
      ),
    );
  }

  Future<void> _completeTopic() async {
    final authUser = AuthRepository.instance.currentUser;
    if (authUser == null) {
      setState(() => _error = 'Entre novamente para concluir o assunto.');
      return;
    }
    final topic = _topicForConcept(widget.concept.id);
    if (topic == null) {
      setState(() => _error = 'Assunto sem trilha de aprendizagem vinculada.');
      return;
    }

    setState(() {
      _submitting = true;
      _error = null;
    });

    try {
      final query = DashboardQuery(userId: authUser.registration);
      final getDashboard = await ref.read(getLearningDashboardProvider.future);
      final before = await getDashboard(authUser.registration);
      final wasCompleted =
          _topicItem(before, topic.topicId)?.progress.status ==
          TopicStatus.completed;
      final completedAt = DateTime.now().toUtc();

      if (!wasCompleted) {
        final recordActivity = await ref.read(
          recordStudyActivityProvider.future,
        );
        await recordActivity(
          StudyActivity(
            activityId:
                'concept-${topic.topicId}-${completedAt.microsecondsSinceEpoch}',
            userId: authUser.registration,
            topicId: topic.topicId,
            type: StudyEventType.contentViewed,
            occurredAt: completedAt,
            duration: completedAt.difference(_startedAt),
            responseTime: completedAt.difference(_startedAt),
            wasCorrect: true,
            wasFirstAttempt:
                _topicItem(before, topic.topicId)?.progress.totalAttempts == 0,
            masteryAfterEvent: 1,
          ),
        );
        await _applyRewards(
          userId: authUser.registration,
          userName: authUser.name,
          gender: authUser.gender,
          entryYear: authUser.entryYear,
          topic: topic,
          completedAt: completedAt,
        );
      }

      ref.invalidate(getLearningDashboardProvider);
      ref.invalidate(learningDashboardProvider(query));
      ref.invalidate(activeUserProfileProvider);

      final after = await getDashboard(authUser.registration);
      final unlocked = _newlyUnlocked(after, topic.topicId);
      final analysis = _topicAnalysis(after, topic.topicId);

      if (!mounted) return;
      setState(() {
        _completed = true;
        _showAnswer = true;
      });
      await _showCompletionFeedback(
        context: context,
        topic: topic,
        unlocked: unlocked,
        analysis: analysis,
        xp: wasCompleted ? 0 : topic.xpReward,
        coins: wasCompleted ? 0 : topic.coinReward,
      );
    } catch (error, stackTrace) {
      AppLogger.info(
        '[CONCEPT] falha ao concluir assunto',
        error: error,
        stackTrace: stackTrace,
      );
      if (mounted) {
        setState(
          () => _error =
              'Nao foi possivel registrar a conclusao. Tente novamente.',
        );
      }
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  Future<void> _applyRewards({
    required String userId,
    required String userName,
    required String gender,
    required int entryYear,
    required LearningTopic topic,
    required DateTime completedAt,
  }) async {
    final repository = await ref.read(userRepositoryProvider.future);
    var profile = await repository.getProfile(userId);
    profile ??= const QuizGamificationService().initialProfile(
      QuizLearner(
        userId: userId,
        name: userName,
        gender: gender,
        entryYear: entryYear,
      ),
      completedAt,
    );
    await repository.saveProfile(_rewardedProfile(profile, topic, completedAt));
  }
}

class _StudyTimer extends StatelessWidget {
  const _StudyTimer({required this.remainingSeconds});

  final int remainingSeconds;

  @override
  Widget build(BuildContext context) {
    final total = StudyRequirements.minimumStudyDuration.inSeconds;
    final completed = (1 - (remainingSeconds / total)).clamp(0, 1).toDouble();
    final done = remainingSeconds == 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(done ? Icons.check_circle_outline : Icons.timer_outlined),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                done
                    ? 'Tempo mínimo concluído'
                    : 'Cronômetro obrigatório de estudo',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Text(_formatCountdown(remainingSeconds)),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(value: completed),
        const SizedBox(height: 8),
        const Text(
          'O conteúdo permanece disponível durante a contagem. A confirmação será liberada automaticamente ao final.',
        ),
      ],
    );
  }
}

String _formatCountdown(int seconds) {
  final minutes = seconds ~/ 60;
  final remainder = seconds.remainder(60);
  return '$minutes:${remainder.toString().padLeft(2, '0')}';
}

LearningTopic? _topicForConcept(String conceptId) {
  final topicId = switch (conceptId) {
    'input-output' => 'variables',
    'functions' => 'loops',
    _ => conceptId,
  };
  for (final topic in const LearningTopicCatalogDataSource().load()) {
    if (topic.topicId == topicId) return topic;
  }
  return null;
}

TopicDashboardItem? _topicItem(
  LearningDashboardSnapshot snapshot,
  String topicId,
) {
  for (final item in snapshot.topics) {
    if (item.topic.topicId == topicId) return item;
  }
  return null;
}

TopicLearningAnalysis? _topicAnalysis(
  LearningDashboardSnapshot snapshot,
  String topicId,
) {
  for (final analysis in snapshot.topicAnalyses) {
    if (analysis.topicId == topicId) return analysis;
  }
  return null;
}

List<TopicDashboardItem> _newlyUnlocked(
  LearningDashboardSnapshot snapshot,
  String completedTopicId,
) {
  return snapshot.topics
      .where(
        (item) =>
            item.isUnlocked &&
            item.topic.prerequisiteTopicIds.contains(completedTopicId) &&
            item.progress.status != TopicStatus.completed,
      )
      .toList(growable: false);
}

UserProfile _rewardedProfile(
  UserProfile profile,
  LearningTopic topic,
  DateTime completedAt,
) {
  final progression = _progression(profile.progression, topic.xpReward);
  final topicProgress = TopicProgress(
    topicId: topic.topicId,
    progress: 1,
    masteryLevel: MasteryLevel.mastered,
    updatedAt: completedAt.toUtc(),
  );
  final progress =
      profile.adaptivity.topicProgress
          .where((item) => item.topicId != topic.topicId)
          .toList(growable: true)
        ..add(topicProgress);
  final completedIds = progress
      .where((item) => item.progress >= 1)
      .map((item) => item.topicId)
      .toSet();
  final catalog = const LearningTopicCatalogDataSource().load();
  final unlockedIds = <String>{
    ...profile.adaptivity.unlockedTopicIds,
    for (final item in catalog)
      if (item.prerequisiteTopicIds.every(completedIds.contains)) item.topicId,
  };
  final blockedIds = <String>{
    for (final item in catalog)
      if (!unlockedIds.contains(item.topicId)) item.topicId,
  };
  final totalExercises = profile.statistics.totalExercises + 1;
  final totalCorrect = profile.statistics.totalCorrectAnswers + 1;
  final totalDuration =
      profile.statistics.totalDuration + StudyRequirements.minimumStudyDuration;

  return profile.copyWith(
    progression: progression,
    economy: Economy(
      coins: profile.economy.coins + topic.coinReward,
      totalCoinsEarned: profile.economy.totalCoinsEarned + topic.coinReward,
      gems: profile.economy.gems,
      purchasedItemIds: profile.economy.purchasedItemIds,
      remainingHints: profile.economy.remainingHints,
    ),
    adaptivity: Adaptivity(
      topicProgress: List<TopicProgress>.unmodifiable(progress),
      masteryLevel: MasteryLevel.mastered,
      unlockedTopicIds: unlockedIds.toList(growable: false),
      blockedTopicIds: blockedIds.toList(growable: false),
    ),
    statistics: UserStatistics(
      totalExercises: totalExercises,
      totalCorrectAnswers: totalCorrect,
      totalErrors: profile.statistics.totalErrors,
      accuracyRate: totalCorrect / totalExercises,
      averageResponseTime: Duration(
        milliseconds: totalDuration.inMilliseconds ~/ totalExercises,
      ),
      totalSessions: profile.statistics.totalSessions + 1,
      totalDuration: totalDuration,
    ),
    synchronization: profile.synchronization.copyWith(hasPendingData: true),
    updatedAt: completedAt.toUtc(),
  );
}

Progression _progression(Progression current, int earnedXp) {
  final total = current.totalXp + earnedXp;
  var remaining = total;
  var level = 1;
  var requirement = 100;
  while (remaining >= requirement) {
    remaining -= requirement;
    level++;
    requirement = 100 + ((level - 1) * 50);
  }
  return Progression(
    level: level,
    currentXp: remaining,
    totalXp: total,
    nextLevelXp: requirement,
    title: level >= 8
        ? 'Especialista'
        : level >= 5
        ? 'Programador'
        : level >= 3
        ? 'Aprendiz Avancado'
        : 'Aprendiz',
  );
}

Future<void> _showCompletionFeedback({
  required BuildContext context,
  required LearningTopic topic,
  required List<TopicDashboardItem> unlocked,
  required TopicLearningAnalysis? analysis,
  required int xp,
  required int coins,
}) {
  final next = unlocked.isEmpty ? null : unlocked.first;
  final shouldReview =
      analysis?.indicator == LearningIndicatorStatus.needsReview ||
      analysis?.indicator == LearningIndicatorStatus.criticalTopic ||
      (analysis?.attempts ?? 0) > 3 ||
      (analysis?.accuracyRate ?? 1) < 0.7;

  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Parabens!'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Voce concluiu:\n${topic.name}'),
              if (next != null) ...[
                const SizedBox(height: 16),
                Text('Agora voce ja possui a base necessaria para aprender:'),
                const SizedBox(height: 8),
                Text(
                  next.topic.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(next.topic.description),
              ],
              const SizedBox(height: 16),
              Text('Recompensas:\n+$xp XP\n+$coins moedas'),
              if (unlocked.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text('Novo conteudo desbloqueado:'),
                const SizedBox(height: 8),
                for (final item in unlocked.take(3))
                  _RoadmapLine(
                    icon: Icons.lock_open_outlined,
                    text: item.topic.name,
                    badge: 'NOVO CONTEUDO DESBLOQUEADO',
                  ),
              ],
              if (shouldReview) ...[
                const SizedBox(height: 16),
                const Text(
                  'Antes de avancar, recomendamos revisar 2 exercicios deste assunto para fortalecer sua base.',
                ),
              ],
              const SizedBox(height: 16),
              _RoadmapLine(
                icon: Icons.check_circle_outline,
                text: topic.name,
                badge: 'CONCLUIDO',
              ),
              if (next != null)
                _RoadmapLine(
                  icon: Icons.arrow_downward,
                  text: next.topic.name,
                  badge: 'LIBERADO',
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Continuar'),
          ),
        ],
      );
    },
  );
}

class _RoadmapLine extends StatelessWidget {
  const _RoadmapLine({
    required this.icon,
    required this.text,
    required this.badge,
  });

  final IconData icon;
  final String text;
  final String badge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text),
                Text(badge, style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
