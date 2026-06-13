import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/widgets/loading.dart';
import '../auth/auth_repository.dart';
import '../user/domain/entities/learning_dashboard.dart';
import '../user/providers/user_providers.dart';

class TeachingDashboardPage extends ConsumerWidget {
  const TeachingDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeUser = ref.watch(activeUserSessionProvider);
    final preferences = AuthRepository.instance.learningPreferences;
    final fallbackSnapshot = _PerformanceSnapshot.fromPreferences(preferences);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            tooltip: 'Perfil',
            onPressed: () => context.push(AppRoute.profile.path),
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: activeUser.when(
        data: (session) {
          if (session == null) {
            return _DashboardContent(
              userName: null,
              preferences: preferences,
              snapshot: fallbackSnapshot,
            );
          }
          final dashboard = ref.watch(
            learningDashboardProvider(
              DashboardQuery(userId: session.learnerId),
            ),
          );
          return dashboard.when(
            data: (data) => _DashboardContent(
              userName: session.authUser.name,
              preferences: preferences,
              snapshot: _PerformanceSnapshot.fromDashboard(
                data,
                fallback: fallbackSnapshot,
              ),
            ),
            loading: () => const Loading(),
            error: (error, _) => _DashboardContent(
              userName: session.authUser.name,
              preferences: preferences,
              snapshot: fallbackSnapshot.copyWith(
                notice:
                    'Nao foi possivel carregar o progresso agora. Exibindo uma visao inicial da trilha.',
              ),
            ),
          );
        },
        loading: () => const Loading(),
        error: (error, _) => _DashboardContent(
          userName: null,
          preferences: preferences,
          snapshot: fallbackSnapshot.copyWith(
            notice:
                'Nao foi possivel inicializar seu perfil local agora. Exibindo uma visao inicial da trilha.',
          ),
        ),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({
    required this.userName,
    required this.preferences,
    required this.snapshot,
  });

  final String? userName;
  final Map<String, String> preferences;
  final _PerformanceSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _DashboardHeader(
            userName: userName,
            preferences: preferences,
            snapshot: snapshot,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          sliver: SliverList.list(
            children: [
              _QuickActionGrid(
                actions: [
                  _QuickAction(
                    icon: Icons.menu_book_outlined,
                    title: 'Assuntos liberados',
                    badge: snapshot.enabledResults,
                    badgeColor: const Color(0xFF20C761),
                    onTap: () => context.push(AppRoute.concepts.path),
                  ),
                  _QuickAction(
                    icon: Icons.quiz_outlined,
                    title: 'Quizzes para responder',
                    badge: snapshot.pendingQuizzes,
                    badgeColor: const Color(0xFFF4C20D),
                    onTap: () => context.push(AppRoute.quiz.path),
                  ),
                  _QuickAction(
                    icon: Icons.hourglass_bottom_outlined,
                    title: 'Atividades pendentes',
                    badge: snapshot.pendingActivities,
                    badgeColor: const Color(0xFFE93A50),
                    onTap: () => context.push(
                      Uri(
                        path: AppRoute.activities.path,
                        queryParameters: const {'filter': 'pending'},
                      ).toString(),
                    ),
                  ),
                  _QuickAction(
                    icon: Icons.event_available_outlined,
                    title: 'Revisoes agendadas',
                    badge: snapshot.scheduledReviews,
                    badgeColor: const Color(0xFF48A8FF),
                    onTap: () => context.push(
                      Uri(
                        path: AppRoute.activities.path,
                        queryParameters: const {'filter': 'reviews'},
                      ).toString(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Desempenho geral',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              _MetricStrip(snapshot: snapshot),
              const SizedBox(height: 16),
              _SubjectPerformanceChart(subjects: snapshot.subjects),
              if (snapshot.notice != null) ...[
                const SizedBox(height: 12),
                _DashboardNotice(message: snapshot.notice!),
              ],
              const SizedBox(height: 16),
              _LearningTrailCard(
                language: preferences['language'],
                level: preferences['level'],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({
    required this.userName,
    required this.preferences,
    required this.snapshot,
  });

  final String? userName;
  final Map<String, String> preferences;
  final _PerformanceSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final language = preferences['language'] ?? 'programacao';

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 22),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0877F2), Color(0xFF0A54C9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName == null
                        ? 'Continue seus estudos'
                        : 'Ola, $userName',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Acompanhe seu desempenho em $language e avance na trilha.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.86),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _CompactScorePill(score: snapshot.overallScore),
          ],
        ),
      ),
    );
  }
}

class _CompactScorePill extends StatelessWidget {
  const _CompactScorePill({required this.score});

  final double score;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      height: 82,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.24)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${score.toStringAsFixed(1)}%',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'IDG',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.82),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionGrid extends StatelessWidget {
  const _QuickActionGrid({required this.actions});

  final List<_QuickAction> actions;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 10.0;
        final isWide = constraints.maxWidth >= 680;
        final columns = isWide ? 4 : 2;
        final width =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final action in actions)
              SizedBox(
                width: width,
                child: _QuickActionTile(action: action),
              ),
          ],
        );
      },
    );
  }
}

class _QuickAction {
  const _QuickAction({
    required this.icon,
    required this.title,
    required this.badge,
    required this.badgeColor,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final int badge;
  final Color badgeColor;
  final VoidCallback onTap;
}

class _QuickActionTile extends StatelessWidget {
  const _QuickActionTile({required this.action});

  final _QuickAction action;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF0877F2),
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: action.onTap,
        child: SizedBox(
          height: 118,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    action.icon,
                    size: 34,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: _Badge(value: action.badge, color: action.badgeColor),
                ),
                Positioned.fill(
                  left: 46,
                  right: 4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      action.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        height: 1.18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.value, required this.color});

  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        '$value',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _MetricStrip extends StatelessWidget {
  const _MetricStrip({required this.snapshot});

  final _PerformanceSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 740;
        final cards = [
          _OverallScoreCard(score: snapshot.overallScore),
          _MetricValueCard(
            title: 'Assuntos concluidos',
            value: '${snapshot.completedTopics}/${snapshot.totalTopics}',
            icon: Icons.task_alt_outlined,
            color: const Color(0xFF20C761),
          ),
          _MetricValueCard(
            title: 'Aproveitamento',
            value: '${snapshot.accuracyRate.toStringAsFixed(1)}%',
            icon: Icons.insights_outlined,
            color: const Color(0xFF48A8FF),
          ),
          _MetricValueCard(
            title: 'XP total',
            value: '${snapshot.totalXp}',
            icon: Icons.bolt_outlined,
            color: const Color(0xFFF4C20D),
          ),
          _MetricValueCard(
            title: 'Sequencia',
            value: '${snapshot.streakDays} dia(s)',
            icon: Icons.local_fire_department_outlined,
            color: const Color(0xFFE93A50),
          ),
        ];

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var index = 0; index < cards.length; index++) ...[
                if (index > 0) const SizedBox(width: 12),
                Expanded(child: cards[index]),
              ],
            ],
          );
        }

        return SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) =>
                SizedBox(width: 164, child: cards[index]),
          ),
        );
      },
    );
  }
}

class _OverallScoreCard extends StatelessWidget {
  const _OverallScoreCard({required this.score});

  final double score;

  @override
  Widget build(BuildContext context) {
    return _MetricCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'IDG do aluno',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 88,
            height: 52,
            child: CustomPaint(painter: _GaugePainter(score / 100)),
          ),
          const SizedBox(height: 8),
          Text(
            '${score.toStringAsFixed(1)}%',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class _MetricValueCard extends StatelessWidget {
  const _MetricValueCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return _MetricCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 14),
          Icon(icon, size: 42, color: color),
          const SizedBox(height: 10),
          Text(
            value,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF101C2E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: child,
    );
  }
}

class _SubjectPerformanceChart extends StatelessWidget {
  const _SubjectPerformanceChart({required this.subjects});

  final List<_SubjectPerformance> subjects;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
      decoration: BoxDecoration(
        color: const Color(0xFF101C2E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Desempenho por assunto',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 18),
          SizedBox(height: 220, child: _BarChart(subjects: subjects)),
          const SizedBox(height: 16),
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 14,
            runSpacing: 8,
            children: [
              _LegendItem(color: Color(0xFFE93A50), label: 'Insuficiente'),
              _LegendItem(color: Color(0xFFF4C20D), label: 'Basico'),
              _LegendItem(color: Color(0xFF0AB92F), label: 'Proficiente'),
              _LegendItem(color: Color(0xFF0877F2), label: 'Avancado'),
            ],
          ),
          const SizedBox(height: 14),
          _SubjectAbbreviationList(subjects: subjects),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF4C20D).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Toque nas barras para ver detalhes do assunto.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: const Color(0xFFF7D76D),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({required this.subjects});

  final List<_SubjectPerformance> subjects;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const leftAxisWidth = 34.0;
        const labelHeight = 30.0;
        const topValueHeight = 26.0;
        final chartHeight =
            constraints.maxHeight - labelHeight - topValueHeight - 8;
        final minSlotWidth = constraints.maxWidth < 420 ? 48.0 : 58.0;
        final chartWidth = math.max(
          constraints.maxWidth,
          leftAxisWidth + subjects.length * minSlotWidth,
        );
        final availableWidth = chartWidth - leftAxisWidth;
        final slotWidth = availableWidth / subjects.length;
        final barWidth = math.min(slotWidth * 0.58, 42.0).clamp(18.0, 42.0);

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: chartWidth,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: topValueHeight,
                  height: chartHeight,
                  child: CustomPaint(painter: _ChartGridPainter()),
                ),
                for (var index = 0; index < subjects.length; index++)
                  Positioned(
                    left: leftAxisWidth + slotWidth * index,
                    top: 0,
                    width: slotWidth,
                    height: constraints.maxHeight,
                    child: _BarChartColumn(
                      subject: subjects[index],
                      chartHeight: chartHeight,
                      barWidth: barWidth,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BarChartColumn extends StatelessWidget {
  const _BarChartColumn({
    required this.subject,
    required this.chartHeight,
    required this.barWidth,
  });

  final _SubjectPerformance subject;
  final double chartHeight;
  final double barWidth;

  @override
  Widget build(BuildContext context) {
    final barHeight = chartHeight * (subject.score / 100).clamp(0.0, 1.0);

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${subject.name}: ${subject.score.toStringAsFixed(1)}% - ${subject.levelLabel}',
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 26,
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '${subject.score.toStringAsFixed(1)}%',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: chartHeight,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                width: barWidth,
                height: barHeight,
                decoration: BoxDecoration(
                  color: subject.color,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(6),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: subject.color.withValues(alpha: 0.14),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 30,
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  subject.shortName,
                  maxLines: 1,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}

class _SubjectAbbreviationList extends StatelessWidget {
  const _SubjectAbbreviationList({required this.subjects});

  final List<_SubjectPerformance> subjects;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final subject in subjects)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              color: subject.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: subject.color.withValues(alpha: 0.34)),
            ),
            child: Text(
              '${subject.shortName} - ${subject.name}',
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
      ],
    );
  }
}

class _DashboardNotice extends StatelessWidget {
  const _DashboardNotice({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF4C20D).withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFF4C20D).withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Color(0xFFF4C20D)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFFF7D76D),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LearningTrailCard extends StatelessWidget {
  const _LearningTrailCard({required this.language, required this.level});

  final String? language;
  final String? level;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1A2A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF20C761).withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.route_outlined, color: Color(0xFF20C761)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trilha de aprendizagem',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 4),
                Text(
                  'Nivel ${level ?? 'inicial'} em ${language ?? 'programacao'}.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  const _GaugePainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(4, 4, size.width - 8, size.height * 1.6);
    const start = math.pi;
    const sweep = math.pi;
    final strokeWidth = size.height * 0.22;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final segments = [
      (color: const Color(0xFFE93A50), start: 0.00, end: 0.28),
      (color: const Color(0xFFF4C20D), start: 0.28, end: 0.50),
      (color: const Color(0xFF0AB92F), start: 0.50, end: 0.76),
      (color: const Color(0xFF0877F2), start: 0.76, end: 1.00),
    ];

    for (final segment in segments) {
      paint.color = segment.color;
      canvas.drawArc(
        rect,
        start + sweep * segment.start,
        sweep * (segment.end - segment.start) - 0.03,
        false,
        paint,
      );
    }

    final angle = start + sweep * progress.clamp(0.0, 1.0);
    final center = Offset(size.width / 2, size.height * 1.62);
    final radius = size.width * 0.38;
    final needleEnd = Offset(
      center.dx + math.cos(angle) * radius,
      center.dy + math.sin(angle) * radius,
    );
    final needlePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, needleEnd, needlePaint);
    canvas.drawCircle(center, 5, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class _ChartGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..strokeWidth = 1;
    final axisPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.22)
      ..strokeWidth = 1.2;
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
    );

    for (var tick = 0; tick <= 100; tick += 20) {
      final y = size.height - size.height * (tick / 100);
      canvas.drawLine(Offset(34, y), Offset(size.width, y), gridPaint);
      textPainter.text = TextSpan(
        text: '$tick',
        style: const TextStyle(color: Color(0xFF8EA1BD), fontSize: 11),
      );
      textPainter.layout(minWidth: 26, maxWidth: 26);
      textPainter.paint(canvas, Offset(0, y - 7));
    }

    canvas.drawLine(const Offset(34, 0), Offset(34, size.height), axisPaint);
    canvas.drawLine(
      Offset(34, size.height),
      Offset(size.width, size.height),
      axisPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PerformanceSnapshot {
  const _PerformanceSnapshot({
    required this.overallScore,
    required this.completedTopics,
    required this.totalTopics,
    required this.accuracyRate,
    required this.totalXp,
    required this.streakDays,
    required this.enabledResults,
    required this.pendingQuizzes,
    required this.pendingActivities,
    required this.scheduledReviews,
    required this.subjects,
    this.notice,
  });

  final double overallScore;
  final int completedTopics;
  final int totalTopics;
  final double accuracyRate;
  final int totalXp;
  final int streakDays;
  final int enabledResults;
  final int pendingQuizzes;
  final int pendingActivities;
  final int scheduledReviews;
  final List<_SubjectPerformance> subjects;
  final String? notice;

  _PerformanceSnapshot copyWith({String? notice}) {
    return _PerformanceSnapshot(
      overallScore: overallScore,
      completedTopics: completedTopics,
      totalTopics: totalTopics,
      accuracyRate: accuracyRate,
      totalXp: totalXp,
      streakDays: streakDays,
      enabledResults: enabledResults,
      pendingQuizzes: pendingQuizzes,
      pendingActivities: pendingActivities,
      scheduledReviews: scheduledReviews,
      subjects: subjects,
      notice: notice ?? this.notice,
    );
  }

  factory _PerformanceSnapshot.fromDashboard(
    LearningDashboardSnapshot dashboard, {
    required _PerformanceSnapshot fallback,
  }) {
    if (dashboard.topics.isEmpty) {
      return fallback.copyWith(
        notice:
            'Cadastre ou carregue assuntos da trilha para que o grafico use o progresso real do aluno.',
      );
    }

    final rankedTopics = dashboard.topics.toList(growable: false);
    final subjects = rankedTopics
        .take(8)
        .map(
          (item) => _SubjectPerformance.fromTopic(
            item.topic.name,
            _abbreviateTopic(item.topic.name),
            item.progress,
          ),
        )
        .toList(growable: false);
    final completed = dashboard.topics
        .where((item) => item.progress.status == TopicStatus.completed)
        .length;
    final unlocked = dashboard.topics.where((item) => item.isUnlocked).length;
    final quizPending = dashboard.topics.where((item) {
      return item.isUnlocked &&
          item.topic.contentTypes.contains(LearningContentType.quiz) &&
          item.progress.status != TopicStatus.completed;
    }).length;
    final activityPending = dashboard.topics.where((item) {
      return item.isUnlocked &&
          item.progress.status != TopicStatus.completed &&
          item.topic.contentTypes.any(
            (type) =>
                type == LearningContentType.exercise ||
                type == LearningContentType.challenge ||
                type == LearningContentType.project,
          );
    }).length;
    final score = (dashboard.overallProgress * 100).clamp(0.0, 100.0);
    final totalTopics = dashboard.topics.length;
    final attempts = dashboard.topics.fold<int>(
      0,
      (total, item) => total + item.progress.totalAttempts,
    );
    final correctAttempts = dashboard.topics.fold<int>(
      0,
      (total, item) => total + item.progress.correctAttempts,
    );
    final profileAccuracy = dashboard.user?.statistics.accuracyRate;
    final accuracy = profileAccuracy != null && profileAccuracy > 0
        ? profileAccuracy * 100
        : attempts == 0
        ? score
        : (correctAttempts / attempts) * 100;

    return _PerformanceSnapshot(
      overallScore: score,
      completedTopics: completed,
      totalTopics: totalTopics,
      accuracyRate: accuracy.clamp(0.0, 100.0),
      totalXp: dashboard.user?.progression.totalXp ?? 0,
      streakDays: dashboard.user?.streak.currentOffenseDays ?? 0,
      enabledResults: unlocked,
      pendingQuizzes: quizPending,
      pendingActivities: activityPending,
      scheduledReviews: dashboard.reviewsThisWeek.length,
      subjects: subjects.isEmpty ? fallback.subjects : subjects,
      notice: completed == 0 && score == 0
          ? 'O grafico ja esta conectado aos assuntos, mas ainda falta registrar atividades para formar desempenho real.'
          : null,
    );
  }

  factory _PerformanceSnapshot.fromPreferences(
    Map<String, String> preferences,
  ) {
    final base = switch (preferences['level']?.toLowerCase()) {
      'avancado' || 'advanced' => 88.0,
      'intermediario' || 'intermediate' => 80.0,
      'iniciante' || 'beginner' => 72.0,
      _ => 84.3,
    };
    final subjects = <_SubjectPerformance>[
      _SubjectPerformance.fromScore(
        'Conceitos',
        'CONC',
        (base + 6).clamp(0, 100),
      ),
      _SubjectPerformance.fromScore(
        'Quizzes',
        'QUIZ',
        (base - 4).clamp(0, 100),
      ),
      _SubjectPerformance.fromScore(
        'Atividades',
        'ATIV',
        (base + 1.5).clamp(0, 100),
      ),
      _SubjectPerformance.fromScore(
        'Pratica Python',
        'PY',
        (base + 2.9).clamp(0, 100),
      ),
      _SubjectPerformance.fromScore(
        'Revisoes',
        'REV',
        (base - 9.3).clamp(0, 100),
      ),
    ];
    final overall =
        subjects.map((subject) => subject.score).reduce((a, b) => a + b) /
        subjects.length;

    return _PerformanceSnapshot(
      overallScore: overall,
      completedTopics: 0,
      totalTopics: 0,
      accuracyRate: overall,
      totalXp: 0,
      streakDays: 0,
      enabledResults: 7,
      pendingQuizzes: 3,
      pendingActivities: 1,
      scheduledReviews: 4,
      subjects: subjects,
    );
  }
}

class _SubjectPerformance {
  const _SubjectPerformance({
    required this.name,
    required this.shortName,
    required this.score,
    required this.color,
    required this.levelLabel,
  });

  final String name;
  final String shortName;
  final double score;
  final Color color;
  final String levelLabel;

  factory _SubjectPerformance.fromScore(
    String name,
    String shortName,
    num score,
  ) {
    final value = score.toDouble();
    if (value < 50) {
      return _SubjectPerformance(
        name: name,
        shortName: shortName,
        score: value,
        color: const Color(0xFFE93A50),
        levelLabel: 'Insuficiente',
      );
    }
    if (value < 70) {
      return _SubjectPerformance(
        name: name,
        shortName: shortName,
        score: value,
        color: const Color(0xFFF4C20D),
        levelLabel: 'Basico',
      );
    }
    if (value < 82) {
      return _SubjectPerformance(
        name: name,
        shortName: shortName,
        score: value,
        color: const Color(0xFF0AB92F),
        levelLabel: 'Proficiente',
      );
    }
    return _SubjectPerformance(
      name: name,
      shortName: shortName,
      score: value,
      color: const Color(0xFF0877F2),
      levelLabel: 'Avancado',
    );
  }

  factory _SubjectPerformance.fromTopic(
    String name,
    String shortName,
    TopicLearningProgress progress,
  ) {
    final attemptsWeight = progress.totalAttempts == 0 ? 0.0 : 0.2;
    final value =
        (progress.completionRate * 0.45 +
            progress.masteryRate * 0.35 +
            progress.accuracyRate * attemptsWeight) /
        (attemptsWeight == 0 ? 0.8 : 1.0);
    return _SubjectPerformance.fromScore(name, shortName, value * 100);
  }
}

String _abbreviateTopic(String name) {
  final words = name
      .trim()
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .toList(growable: false);
  if (words.isEmpty) {
    return 'ASS';
  }
  if (words.length == 1) {
    final normalized = words.first.replaceAll(RegExp(r'[^A-Za-z0-9]'), '');
    return normalized.length <= 4
        ? normalized.toUpperCase()
        : normalized.substring(0, 4).toUpperCase();
  }
  final abbreviation = words
      .where((word) => word.length > 2)
      .take(4)
      .map((word) => word.characters.first)
      .join();
  return abbreviation.isEmpty ? 'ASS' : abbreviation.toUpperCase();
}
