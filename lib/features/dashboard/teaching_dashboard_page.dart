import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/services/logger.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/loading.dart';
import '../auth/auth_repository.dart';
import '../user/domain/entities/learning_dashboard.dart';
import '../user/providers/user_providers.dart';

final _dashboardSnapshotProvider =
    FutureProvider.family<LearningDashboardSnapshot, DashboardQuery>((
      ref,
      query,
    ) async {
      AppLogger.info('[DASHBOARD] carregando use case');
      final getDashboard = await ref.watch(getLearningDashboardProvider.future);
      AppLogger.info('[DASHBOARD] carregando snapshot');
      final snapshot = await getDashboard(query.userId, filters: query.filters);
      AppLogger.info('[DASHBOARD] concluido');
      return snapshot;
    });

class TeachingDashboardPage extends ConsumerWidget {
  const TeachingDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = AuthRepository.instance.currentUser;
    if (authUser == null) {
      AppLogger.info('[DASHBOARD] usuario ausente');
      return Scaffold(
        appBar: AppBar(title: const Text('ProTech')),
        body: const Center(child: Text('Entre para acessar o dashboard.')),
      );
    }

    final dashboard = ref.watch(
      _dashboardSnapshotProvider(DashboardQuery(userId: authUser.registration)),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ProTech'),
        actions: [
          IconButton(
            tooltip: 'Perfil',
            onPressed: () => context.push(AppRoute.profile.path),
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: dashboard.when(
        data: (snapshot) =>
            _DashboardContent(snapshot: snapshot, fallbackName: authUser.name),
        loading: () => const Loading(),
        error: (error, _) => ListView(
          padding: const EdgeInsets.all(24),
          children: [
            AppCard(
              child: Text('Nao foi possivel carregar o dashboard: $error'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({required this.snapshot, required this.fallbackName});

  final LearningDashboardSnapshot snapshot;
  final String fallbackName;

  @override
  Widget build(BuildContext context) {
    final user = snapshot.user;
    final topics = snapshot.topics;
    final completedExercises = topics.fold<int>(
      0,
      (sum, item) => sum + item.progress.completedExercises,
    );
    final totalExercises = topics.fold<int>(
      0,
      (sum, item) => sum + item.topic.totalExercises,
    );
    final attempts = topics.fold<int>(
      0,
      (sum, item) => sum + item.progress.totalAttempts,
    );
    final correct = topics.fold<int>(
      0,
      (sum, item) => sum + item.progress.correctAttempts,
    );
    final studyTime = topics.fold<Duration>(
      Duration.zero,
      (sum, item) => sum + item.progress.totalStudyTime,
    );
    final accuracy =
        user?.statistics.accuracyRate ??
        (attempts == 0 ? 0 : correct / attempts);
    final totalStudyTime = user?.statistics.totalDuration == Duration.zero
        ? studyTime
        : user?.statistics.totalDuration ?? studyTime;
    final currentTopic = _currentTopic(topics, snapshot.recommendations);

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _Header(snapshot: snapshot, fallbackName: fallbackName),
        const SizedBox(height: 20),
        const _SectionTitle(title: 'Resumo do aluno'),
        const SizedBox(height: 12),
        _SummaryGrid(
          items: [
            _MetricData(
              icon: Icons.military_tech_outlined,
              label: 'Nivel atual',
              value: '${user?.progression.level ?? 1}',
            ),
            _MetricData(
              icon: Icons.bolt_outlined,
              label: 'XP atual',
              value: '${user?.progression.totalXp ?? 0}',
            ),
            _MetricData(
              icon: Icons.toll_outlined,
              label: 'Moedas',
              value: '${user?.economy.coins ?? 0}',
            ),
            _MetricData(
              icon: Icons.local_fire_department_outlined,
              label: 'Streak',
              value: '${user?.streak.currentOffenseDays ?? 0} dias',
            ),
          ],
        ),
        const SizedBox(height: 24),
        const _SectionTitle(title: 'Atividades e assuntos'),
        const SizedBox(height: 12),
        for (final item in topics) ...[
          _TopicCard(item: item),
          const SizedBox(height: 12),
        ],
        const SizedBox(height: 12),
        const _SectionTitle(title: 'Desempenho geral'),
        const SizedBox(height: 12),
        _PerformanceCard(
          completedExercises: completedExercises,
          totalExercises: totalExercises,
          accuracy: accuracy,
          studyTime: totalStudyTime,
        ),
        const SizedBox(height: 24),
        const _SectionTitle(title: 'Continuar estudando'),
        const SizedBox(height: 12),
        _ContinueCard(item: currentTopic),
        const SizedBox(height: 24),
        const _SectionTitle(title: 'Progresso geral'),
        const SizedBox(height: 12),
        _OverallProgressCard(progress: snapshot.overallProgress),
        const SizedBox(height: 24),
        const _QuickActions(),
      ],
    );
  }

  TopicDashboardItem? _currentTopic(
    List<TopicDashboardItem> topics,
    List<PersonalizedRecommendation> recommendations,
  ) {
    if (recommendations.isNotEmpty) {
      final recommendedId = recommendations.first.topicId;
      for (final item in topics) {
        if (item.topic.topicId == recommendedId) {
          return item;
        }
      }
    }
    final accessed =
        topics.where((item) => item.progress.lastAccess != null).toList()..sort(
          (a, b) => b.progress.lastAccess!.compareTo(a.progress.lastAccess!),
        );
    if (accessed.isNotEmpty) {
      return accessed.first;
    }
    for (final item in topics) {
      if (item.isUnlocked && item.progress.status != TopicStatus.completed) {
        return item;
      }
    }
    return topics.isEmpty ? null : topics.first;
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.snapshot, required this.fallbackName});

  final LearningDashboardSnapshot snapshot;
  final String fallbackName;

  @override
  Widget build(BuildContext context) {
    final user = snapshot.user;
    final name = user?.identification.nickname.isNotEmpty == true
        ? user!.identification.nickname
        : fallbackName;
    final level = user?.progression.level ?? 1;
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: colorScheme.primaryContainer,
            child: Text(
              name.trim().isEmpty ? 'P' : name.trim()[0].toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ProTech', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text('Nivel $level'),
              ],
            ),
          ),
          Icon(
            user?.settings.notifications == true
                ? Icons.notifications_active_outlined
                : Icons.notifications_none_outlined,
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleLarge);
  }
}

class _SummaryGrid extends StatelessWidget {
  const _SummaryGrid({required this.items});

  final List<_MetricData> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 720 ? 4 : 2;
        final spacing = 12.0;
        final width =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final item in items)
              SizedBox(
                width: width,
                child: _MetricCard(data: item),
              ),
          ],
        );
      },
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.data});

  final _MetricData data;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(data.icon, color: colorScheme.primary),
          const SizedBox(height: 12),
          Text(
            data.value,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(data.label, maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class _MetricData {
  const _MetricData({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;
}

class _TopicCard extends StatelessWidget {
  const _TopicCard({required this.item});

  final TopicDashboardItem item;

  @override
  Widget build(BuildContext context) {
    final percent = _formatPercent(item.progress.completionRate);
    final status = _statusLabel(item.progress.status);
    final canOpen = item.isUnlocked;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.topic.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text('${item.topic.totalExercises} exercicios cadastrados'),
                  ],
                ),
              ),
              Chip(label: Text(status)),
            ],
          ),
          const SizedBox(height: 14),
          LinearProgressIndicator(value: item.progress.completionRate),
          const SizedBox(height: 8),
          Text('$percent concluido'),
          const SizedBox(height: 14),
          FilledButton.icon(
            onPressed: canOpen
                ? () => context.pushNamed(
                    AppRoute.conceptDetail.name,
                    pathParameters: <String, String>{'id': item.topic.topicId},
                  )
                : null,
            icon: Icon(
              item.progress.status == TopicStatus.completed
                  ? Icons.replay_outlined
                  : Icons.play_arrow_outlined,
            ),
            label: Text(
              item.progress.status == TopicStatus.completed
                  ? 'Revisar'
                  : canOpen
                  ? 'Continuar'
                  : 'Bloqueado',
            ),
          ),
        ],
      ),
    );
  }
}

class _PerformanceCard extends StatelessWidget {
  const _PerformanceCard({
    required this.completedExercises,
    required this.totalExercises,
    required this.accuracy,
    required this.studyTime,
  });

  final int completedExercises;
  final int totalExercises;
  final double accuracy;
  final Duration studyTime;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          _InfoRow(
            icon: Icons.task_alt_outlined,
            label: 'Exercicios concluidos',
            value: '$completedExercises',
          ),
          const Divider(height: 24),
          _InfoRow(
            icon: Icons.percent_outlined,
            label: 'Taxa de acerto',
            value: _formatPercent(accuracy),
          ),
          const Divider(height: 24),
          _InfoRow(
            icon: Icons.format_list_numbered_outlined,
            label: 'Total de exercicios',
            value: '$totalExercises',
          ),
          const Divider(height: 24),
          _InfoRow(
            icon: Icons.schedule_outlined,
            label: 'Tempo estudado',
            value: _formatDuration(studyTime),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 12),
        Expanded(child: Text(label)),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}

class _ContinueCard extends StatelessWidget {
  const _ContinueCard({required this.item});

  final TopicDashboardItem? item;

  @override
  Widget build(BuildContext context) {
    final topic = item;
    if (topic == null) {
      return const AppCard(child: Text('Nenhum assunto disponivel.'));
    }

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topic.topic.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text('${_formatPercent(topic.progress.completionRate)} concluido'),
          const SizedBox(height: 14),
          FilledButton.icon(
            onPressed: topic.isUnlocked
                ? () => context.pushNamed(
                    AppRoute.conceptDetail.name,
                    pathParameters: <String, String>{'id': topic.topic.topicId},
                  )
                : null,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Continuar Estudo'),
          ),
        ],
      ),
    );
  }
}

class _OverallProgressCard extends StatelessWidget {
  const _OverallProgressCard({required this.progress});

  final double progress;

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
                  'Curso concluido',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(_formatPercent(progress)),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(value: progress),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _QuickActionButton(
          icon: Icons.code_outlined,
          label: 'Atividades',
          onPressed: () => context.push(AppRoute.activities.path),
        ),
        _QuickActionButton(
          icon: Icons.quiz_outlined,
          label: 'Quiz',
          onPressed: () => context.push(AppRoute.quiz.path),
        ),
        _QuickActionButton(
          icon: Icons.groups_outlined,
          label: 'Turmas',
          onPressed: () => context.push(AppRoute.classes.path),
        ),
      ],
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}

String _statusLabel(TopicStatus status) {
  switch (status) {
    case TopicStatus.notStarted:
      return 'Nao iniciado';
    case TopicStatus.inProgress:
      return 'Em andamento';
    case TopicStatus.completed:
      return 'Concluido';
    case TopicStatus.blocked:
      return 'Bloqueado';
    case TopicStatus.reviewRecommended:
      return 'Revisar';
  }
}

String _formatPercent(double value) {
  final normalized = value.clamp(0, 1);
  return '${(normalized * 100).round()}%';
}

String _formatDuration(Duration value) {
  if (value.inHours > 0) {
    final minutes = value.inMinutes.remainder(60);
    return '${value.inHours}h ${minutes}min';
  }
  return '${value.inMinutes}min';
}
