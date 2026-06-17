import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/services/motivational_notification_service.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/loading.dart';
import '../auth/auth_repository.dart';
import '../user/domain/entities/learning_dashboard.dart';
import '../user/providers/user_providers.dart';

class TeachingDashboardPage extends ConsumerStatefulWidget {
  const TeachingDashboardPage({super.key});

  @override
  ConsumerState<TeachingDashboardPage> createState() =>
      _TeachingDashboardPageState();
}

class _TeachingDashboardPageState extends ConsumerState<TeachingDashboardPage> {
  final Set<String> _readNotificationIds = <String>{};
  final MotivationalNotificationService _notificationService =
      const MotivationalNotificationService();

  @override
  Widget build(BuildContext context) {
    final authUser = AuthRepository.instance.currentUser;
    if (authUser == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('ProTech')),
        body: const Center(child: Text('Entre para acessar o dashboard.')),
      );
    }

    final dashboard = ref.watch(
      learningDashboardProvider(DashboardQuery(userId: authUser.registration)),
    );
    final notifications = dashboard.maybeWhen(
      data: _notificationService.buildForDashboard,
      orElse: () => const <MotivationalNotification>[],
    );
    final unreadNotifications = notifications
        .where((item) => !_readNotificationIds.contains(item.id))
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ProTech'),
        actions: [
          _NotificationBell(
            unreadCount: unreadNotifications.length,
            onPressed: notifications.isEmpty
                ? null
                : () => _showNotifications(context, notifications),
          ),
          IconButton(
            tooltip: 'Perfil',
            onPressed: () => context.push(AppRoute.profile.path),
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: dashboard.when(
        data: (snapshot) => _DashboardContent(
          snapshot: snapshot,
          fallbackName: authUser.name,
          notifications: notifications,
          readNotificationIds: _readNotificationIds,
          onMarkNotificationRead: _markNotificationRead,
        ),
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

  void _markNotificationRead(String id) {
    setState(() => _readNotificationIds.add(id));
  }

  void _showNotifications(
    BuildContext context,
    List<MotivationalNotification> notifications,
  ) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            shrinkWrap: true,
            children: [
              Text(
                'Notificações',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              for (final notification in notifications) ...[
                _NotificationTile(
                  notification: notification,
                  isRead: _readNotificationIds.contains(notification.id),
                  onMarkRead: () {
                    _markNotificationRead(notification.id);
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 8),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({
    required this.snapshot,
    required this.fallbackName,
    required this.notifications,
    required this.readNotificationIds,
    required this.onMarkNotificationRead,
  });

  final LearningDashboardSnapshot snapshot;
  final String fallbackName;
  final List<MotivationalNotification> notifications;
  final Set<String> readNotificationIds;
  final ValueChanged<String> onMarkNotificationRead;

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
        _NotificationSummary(
          notifications: notifications,
          readNotificationIds: readNotificationIds,
          onMarkRead: onMarkNotificationRead,
        ),
        const SizedBox(height: 24),
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
        const _SectionTitle(title: 'Analise de aprendizagem'),
        const SizedBox(height: 12),
        _LearningAnalysisCard(snapshot: snapshot),
        const SizedBox(height: 24),
        const _SectionTitle(title: 'Dificuldade por assunto'),
        const SizedBox(height: 12),
        _DifficultyHeatmapCard(entries: snapshot.difficultyHeatmap),
        const SizedBox(height: 24),
        const _SectionTitle(title: 'Curva de aprendizado'),
        const SizedBox(height: 12),
        _LearningCurveCard(points: snapshot.learningCurve),
        const SizedBox(height: 24),
        const _SectionTitle(title: 'Relatorios personalizados'),
        const SizedBox(height: 12),
        _ReportsCard(reports: snapshot.personalizedReports),
        const SizedBox(height: 24),
        const _SectionTitle(title: 'Recomendacoes inteligentes'),
        const SizedBox(height: 12),
        _RecommendationsCard(recommendations: snapshot.recommendations),
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

class _LearningAnalysisCard extends StatelessWidget {
  const _LearningAnalysisCard({required this.snapshot});

  final LearningDashboardSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final analysesByTopic = <String, TopicLearningAnalysis>{
      for (final analysis in snapshot.topicAnalyses) analysis.topicId: analysis,
    };
    final visible = snapshot.topics.take(4).toList(growable: false);
    if (visible.isEmpty) {
      return const AppCard(child: Text('Nenhum assunto disponivel.'));
    }

    return AppCard(
      child: Column(
        children: [
          for (var index = 0; index < visible.length; index++) ...[
            _TopicAnalysisRow(
              item: visible[index],
              analysis: analysesByTopic[visible[index].topic.topicId],
            ),
            if (index < visible.length - 1) const Divider(height: 24),
          ],
        ],
      ),
    );
  }
}

class _TopicAnalysisRow extends StatelessWidget {
  const _TopicAnalysisRow({required this.item, required this.analysis});

  final TopicDashboardItem item;
  final TopicLearningAnalysis? analysis;

  @override
  Widget build(BuildContext context) {
    final current = analysis;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(_indicatorIcon(current?.indicator)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.topic.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Text(_indicatorLabel(current?.indicator)),
              const SizedBox(height: 6),
              LinearProgressIndicator(value: item.progress.masteryRate),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Chip(label: Text(_trendLabel(current?.trend))),
      ],
    );
  }
}

class _DifficultyHeatmapCard extends StatelessWidget {
  const _DifficultyHeatmapCard({required this.entries});

  final List<TopicDifficultyHeatmapEntry> entries;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const AppCard(child: Text('Sem dados de dificuldade ainda.'));
    }

    return AppCard(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final entry in entries)
            Chip(
              avatar: CircleAvatar(
                backgroundColor: _heatColor(context, entry.indicator),
                radius: 6,
              ),
              label: Text(
                '${entry.topicName} ${_formatPercent(entry.masteryRate)}',
              ),
            ),
        ],
      ),
    );
  }
}

class _LearningCurveCard extends StatelessWidget {
  const _LearningCurveCard({required this.points});

  final List<LearningCurvePoint> points;

  @override
  Widget build(BuildContext context) {
    if (points.isEmpty) {
      return const AppCard(
        child: Text('A curva sera exibida apos as primeiras atividades.'),
      );
    }
    final recent = points.length > 5
        ? points.sublist(points.length - 5)
        : points;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final point in recent) ...[
            Row(
              children: [
                SizedBox(width: 52, child: Text(_formatDay(point.day))),
                Expanded(
                  child: LinearProgressIndicator(value: point.masteryRate),
                ),
                const SizedBox(width: 12),
                Text(_formatPercent(point.accuracyRate)),
              ],
            ),
            const SizedBox(height: 10),
          ],
          Text(
            'XP estimado recente: ${recent.fold<int>(0, (sum, item) => sum + item.estimatedXp)}',
          ),
        ],
      ),
    );
  }
}

class _ReportsCard extends StatelessWidget {
  const _ReportsCard({required this.reports});

  final List<PersonalizedLearningReport> reports;

  @override
  Widget build(BuildContext context) {
    if (reports.isEmpty) {
      return const AppCard(
        child: Text('Continue estudando para gerar relatorios personalizados.'),
      );
    }

    return AppCard(
      child: Column(
        children: [
          for (var index = 0; index < reports.length; index++) ...[
            _InfoRow(
              icon: Icons.insights_outlined,
              label: reports[index].message,
              value: '',
            ),
            if (index < reports.length - 1) const Divider(height: 24),
          ],
        ],
      ),
    );
  }
}

class _RecommendationsCard extends StatelessWidget {
  const _RecommendationsCard({required this.recommendations});

  final List<PersonalizedRecommendation> recommendations;

  @override
  Widget build(BuildContext context) {
    if (recommendations.isEmpty) {
      return const AppCard(
        child: Text('Nenhuma recomendacao pendente no momento.'),
      );
    }

    return AppCard(
      child: Column(
        children: [
          for (
            var index = 0;
            index < recommendations.take(4).length;
            index++
          ) ...[
            _InfoRow(
              icon: _recommendationIcon(recommendations[index].type),
              label: recommendations[index].title,
              value: recommendations[index].priority >= 90 ? 'Alta' : '',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36, top: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(recommendations[index].reason),
              ),
            ),
            if (index < recommendations.take(4).length - 1)
              const Divider(height: 24),
          ],
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
      ],
    );
  }
}

class _NotificationBell extends StatelessWidget {
  const _NotificationBell({required this.unreadCount, required this.onPressed});

  final int unreadCount;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Notificações',
      onPressed: onPressed,
      icon: Badge.count(
        count: unreadCount,
        isLabelVisible: unreadCount > 0,
        child: const Icon(Icons.notifications_outlined),
      ),
    );
  }
}

class _NotificationSummary extends StatelessWidget {
  const _NotificationSummary({
    required this.notifications,
    required this.readNotificationIds,
    required this.onMarkRead,
  });

  final List<MotivationalNotification> notifications;
  final Set<String> readNotificationIds;
  final ValueChanged<String> onMarkRead;

  @override
  Widget build(BuildContext context) {
    final unread = notifications
        .where((item) => !readNotificationIds.contains(item.id))
        .take(3)
        .toList(growable: false);
    if (unread.isEmpty) {
      return const AppCard(child: Text('Nenhuma notificação pendente.'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle(title: 'Notificações'),
        const SizedBox(height: 12),
        for (final notification in unread) ...[
          _NotificationTile(
            notification: notification,
            isRead: false,
            onMarkRead: () => onMarkRead(notification.id),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.notification,
    required this.isRead,
    required this.onMarkRead,
  });

  final MotivationalNotification notification;
  final bool isRead;
  final VoidCallback onMarkRead;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(_icon(notification.type)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(notification.message),
              ],
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: isRead ? null : onMarkRead,
            child: Text(isRead ? 'Lida' : 'Marcar'),
          ),
        ],
      ),
    );
  }

  IconData _icon(MotivationalNotificationType type) {
    return switch (type) {
      MotivationalNotificationType.practice => Icons.code_outlined,
      MotivationalNotificationType.streak =>
        Icons.local_fire_department_outlined,
      MotivationalNotificationType.progress => Icons.trending_up_outlined,
      MotivationalNotificationType.challenge => Icons.emoji_events_outlined,
      MotivationalNotificationType.review => Icons.refresh_outlined,
    };
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

String _indicatorLabel(LearningIndicatorStatus? status) {
  switch (status) {
    case LearningIndicatorStatus.excellentMastery:
      return 'Excelente dominio';
    case LearningIndicatorStatus.goodProgress:
      return 'Bom progresso';
    case LearningIndicatorStatus.needsReview:
      return 'Necessita revisao';
    case LearningIndicatorStatus.criticalTopic:
      return 'Topico critico';
    case null:
      return 'Sem dados suficientes';
  }
}

String _trendLabel(LearningTrend? trend) {
  switch (trend) {
    case LearningTrend.improving:
      return 'Melhorando';
    case LearningTrend.stable:
      return 'Estavel';
    case LearningTrend.declining:
      return 'Piorando';
    case null:
      return 'Inicial';
  }
}

IconData _indicatorIcon(LearningIndicatorStatus? status) {
  switch (status) {
    case LearningIndicatorStatus.excellentMastery:
      return Icons.verified_outlined;
    case LearningIndicatorStatus.goodProgress:
      return Icons.trending_up_outlined;
    case LearningIndicatorStatus.needsReview:
      return Icons.refresh_outlined;
    case LearningIndicatorStatus.criticalTopic:
      return Icons.priority_high_outlined;
    case null:
      return Icons.insights_outlined;
  }
}

IconData _recommendationIcon(RecommendationType type) {
  switch (type) {
    case RecommendationType.nextTopic:
      return Icons.arrow_forward_outlined;
    case RecommendationType.requiredReview:
      return Icons.refresh_outlined;
    case RecommendationType.unlockChallenge:
      return Icons.emoji_events_outlined;
    case RecommendationType.placementTest:
      return Icons.fact_check_outlined;
    case RecommendationType.beginnerReinforcement:
      return Icons.school_outlined;
  }
}

Color _heatColor(BuildContext context, LearningIndicatorStatus status) {
  final colorScheme = Theme.of(context).colorScheme;
  switch (status) {
    case LearningIndicatorStatus.excellentMastery:
      return Colors.green;
    case LearningIndicatorStatus.goodProgress:
      return colorScheme.tertiary;
    case LearningIndicatorStatus.needsReview:
      return Colors.amber;
    case LearningIndicatorStatus.criticalTopic:
      return colorScheme.error;
  }
}

String _formatPercent(double value) {
  final normalized = value.clamp(0, 1);
  return '${(normalized * 100).round()}%';
}

String _formatDay(DateTime day) =>
    '${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}';

String _formatDuration(Duration value) {
  if (value.inHours > 0) {
    final minutes = value.inMinutes.remainder(60);
    return '${value.inHours}h ${minutes}min';
  }
  return '${value.inMinutes}min';
}
