import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/loading.dart';
import '../auth/auth_model.dart';
import '../user/domain/entities/user_profile.dart';
import '../user/providers/user_providers.dart';
import 'profile_academic_summary.dart';
import 'profile_academic_summary_service.dart';
import 'profile_cubit.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  Future<void> _logout(BuildContext context) async {
    await context.read<ProfileCubit>().logout();
    if (context.mounted) context.go(AppRoute.auth.path);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: BlocBuilder<ProfileCubit, AuthModel?>(
        builder: (context, user) {
          if (user == null) {
            return Center(
              child: AppButton(
                label: 'Entrar',
                icon: Icons.login,
                onPressed: () => context.push(AppRoute.auth.path),
              ),
            );
          }

          final dashboard = ref.watch(
            learningDashboardProvider(
              DashboardQuery(userId: user.registration),
            ),
          );
          return dashboard.when(
            data: (snapshot) {
              final summary = const ProfileAcademicSummaryService().build(
                authUser: user,
                snapshot: snapshot,
              );
              return _ProfileContent(
                summary: summary,
                onLogout: () => _logout(context),
              );
            },
            loading: () => const Loading(),
            error: (error, _) => ListView(
              padding: const EdgeInsets.all(24),
              children: [
                AppCard(
                  child: Text('Nao foi possivel carregar o perfil: $error'),
                ),
                const SizedBox(height: 24),
                AppButton(
                  label: 'Sair',
                  icon: Icons.logout,
                  outlined: true,
                  onPressed: () => _logout(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({required this.summary, required this.onLogout});

  final ProfileAcademicSummary summary;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _HeaderCard(summary: summary.header),
        const SizedBox(height: 16),
        _SmartSummaryCard(insights: summary.insights),
        const SizedBox(height: 16),
        _ProgressCard(summary: summary.progress),
        const SizedBox(height: 16),
        _StatisticsCard(summary: summary.statistics),
        const SizedBox(height: 16),
        _StreakCard(summary: summary.streak),
        const SizedBox(height: 16),
        _BadgesCard(badges: summary.badges),
        const SizedBox(height: 16),
        _SubjectsCard(subjects: summary.subjects),
        const SizedBox(height: 16),
        _TimelineCard(events: summary.timeline),
        const SizedBox(height: 16),
        _ClassroomCard(summary: summary.classroom),
        const SizedBox(height: 16),
        _AdvancedCard(summary: summary.advanced),
        const SizedBox(height: 16),
        _VisualizationsCard(summary: summary.visuals),
        const SizedBox(height: 16),
        _SocialCard(),
        const SizedBox(height: 16),
        _QuickSettingsCard(settings: summary.settings),
        const SizedBox(height: 24),
        AppButton(
          label: 'Sair',
          icon: Icons.logout,
          outlined: true,
          onPressed: onLogout,
        ),
      ],
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.summary});

  final ProfileHeaderSummary summary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 42,
                backgroundColor: colorScheme.primaryContainer,
                child: Text(
                  _initials(summary.fullName),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      summary.fullName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('@${summary.nickname}'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _InfoChip(
                          icon: Icons.military_tech_outlined,
                          label: 'Nivel ${summary.level}',
                        ),
                        _InfoChip(
                          icon: Icons.workspace_premium_outlined,
                          label: summary.title,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _InfoGrid(
            items: [
              _InfoItem('Matricula', summary.registration),
              _InfoItem('Curso', summary.course),
              _InfoItem('Campus', summary.campus),
              _InfoItem('Periodo atual', summary.currentPeriod),
              _InfoItem('Ingresso', summary.entryDate),
            ],
          ),
        ],
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return 'PT';
    final first = parts.first.isEmpty ? 'P' : parts.first[0];
    final last = parts.length < 2 || parts.last.isEmpty ? 'T' : parts.last[0];
    return '$first$last'.toUpperCase();
  }
}

class _SmartSummaryCard extends StatelessWidget {
  const _SmartSummaryCard({required this.insights});

  final List<String> insights;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.auto_awesome_outlined,
            title: 'Resumo inteligente',
          ),
          const SizedBox(height: 12),
          for (final insight in insights.take(5)) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle_outline, size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text(insight)),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.summary});

  final ProfileProgressSummary summary;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.trending_up_outlined,
            title: 'Progresso geral',
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: summary.courseProgress.clamp(0, 1),
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 12),
              Text(_percent(summary.courseProgress)),
            ],
          ),
          const SizedBox(height: 16),
          _MetricWrap(
            metrics: [
              _Metric('XP atual', summary.currentXp.toString()),
              _Metric('XP total', summary.totalXp.toString()),
              _Metric('Proximo nivel', '${summary.xpToNextLevel} XP'),
              _Metric('Tempo estudado', _duration(summary.totalStudyTime)),
              _Metric('Sessoes', summary.totalStudySessions.toString()),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatisticsCard extends StatelessWidget {
  const _StatisticsCard({required this.summary});

  final ProfileStatisticsSummary summary;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.insights_outlined,
            title: 'Estatisticas academicas',
          ),
          const SizedBox(height: 12),
          _MetricWrap(
            metrics: [
              _Metric(
                'Exercicios concluidos',
                summary.completedExercises.toString(),
              ),
              _Metric('Corretos', summary.correctExercises.toString()),
              _Metric('Incorretos', summary.incorrectExercises.toString()),
              _Metric('Taxa de acerto', _percent(summary.accuracyRate)),
              _Metric('Tempo medio', _duration(summary.averageActivityTime)),
              _Metric('Mais forte', summary.strongestSubject),
              _Metric('Mais dificuldade', summary.weakestSubject),
              _Metric('Quizzes', summary.totalQuizzes.toString()),
              _Metric('Desafios', summary.completedChallenges.toString()),
            ],
          ),
        ],
      ),
    );
  }
}

class _StreakCard extends StatelessWidget {
  const _StreakCard({required this.summary});

  final ProfileStreakSummary summary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.local_fire_department_outlined,
            title: 'Ofensiva',
          ),
          const SizedBox(height: 12),
          _MetricWrap(
            metrics: [
              _Metric('Dias consecutivos', '${summary.currentDays}'),
              _Metric('Maior streak', '${summary.longestDays}'),
              _Metric('Proxima recompensa', summary.nextReward),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final day in summary.lastThirtyDays)
                Tooltip(
                  message: _date(day.day),
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: day.active
                          ? colorScheme.primary
                          : Colors.white.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          for (final record in summary.records)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(record),
            ),
        ],
      ),
    );
  }
}

class _BadgesCard extends StatelessWidget {
  const _BadgesCard({required this.badges});

  final List<ProfileBadgeSummary> badges;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.emoji_events_outlined,
            title: 'Conquistas e badges',
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth > 720
                  ? 3
                  : constraints.maxWidth > 460
                  ? 2
                  : 1;
              return GridView.count(
                crossAxisCount: columns,
                childAspectRatio: columns == 1 ? 3.8 : 2.7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (final badge in badges.take(6)) _BadgeTile(badge: badge),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BadgeTile extends StatelessWidget {
  const _BadgeTile({required this.badge});

  final ProfileBadgeSummary badge;

  @override
  Widget build(BuildContext context) {
    final color = _rarityColor(badge.rarity, Theme.of(context).colorScheme);
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: color.withValues(alpha: 0.42)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              badge.unlocked ? Icons.workspace_premium : Icons.lock_outline,
              color: color,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    badge.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${_rarityLabel(badge.rarity)} - ${badge.description}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(value: badge.progress.clamp(0, 1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubjectsCard extends StatelessWidget {
  const _SubjectsCard({required this.subjects});

  final List<ProfileSubjectSummary> subjects;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.school_outlined,
            title: 'Desempenho por assunto',
          ),
          const SizedBox(height: 12),
          if (subjects.isEmpty)
            const Text('Nenhum assunto estudado ainda.')
          else
            for (final subject in subjects.take(6)) ...[
              _SubjectRow(subject: subject),
              const Divider(height: 18),
            ],
        ],
      ),
    );
  }
}

class _SubjectRow extends StatelessWidget {
  const _SubjectRow({required this.subject});

  final ProfileSubjectSummary subject;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                subject.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Text(_percent(subject.masteryRate)),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(value: subject.masteryRate.clamp(0, 1)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            _Stars(count: subject.masteryStars),
            Text('Tempo: ${_duration(subject.studyTime)}'),
            Text('Ultima: ${_date(subject.lastActivity)}'),
            Text(subject.reviewSuggestion),
          ],
        ),
      ],
    );
  }
}

class _TimelineCard extends StatelessWidget {
  const _TimelineCard({required this.events});

  final List<ProfileTimelineEvent> events;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.timeline_outlined,
            title: 'Historico de evolucao',
          ),
          const SizedBox(height: 12),
          for (final event in events.take(6)) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(_timelineIcon(event.icon), size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(event.description),
                      Text(_dateTime(event.occurredAt)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _ClassroomCard extends StatelessWidget {
  const _ClassroomCard({required this.summary});

  final ProfileClassroomSummary summary;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: Icons.groups_2_outlined, title: 'Turma'),
          const SizedBox(height: 12),
          _InfoGrid(
            items: [
              _InfoItem('Turma', summary.name),
              _InfoItem('Alunos', summary.studentCount.toString()),
              _InfoItem('Media da turma', _percent(summary.classAverage)),
              _InfoItem('Ranking interno', '#${summary.internalRanking}'),
              _InfoItem('Sua posicao', '#${summary.userPosition}'),
              _InfoItem(
                'XP voce/turma',
                '${summary.userXp}/${summary.classAverageXp}',
              ),
              _InfoItem(
                'Nivel voce/turma',
                '${summary.userLevel}/${summary.classAverageLevel}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AdvancedCard extends StatelessWidget {
  const _AdvancedCard({required this.summary});

  final ProfileAdvancedStatistics summary;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.analytics_outlined,
            title: 'Estatisticas avancadas',
          ),
          const SizedBox(height: 12),
          _MetricWrap(
            metrics: [
              _Metric('Dias ativos', summary.activeDays.toString()),
              _Metric(
                'Sequencia media',
                summary.averageStudySequence.toStringAsFixed(1),
              ),
              _Metric('Horario frequente', summary.frequentStudyHour),
              _Metric(
                'Evolucao semanal',
                _signedPercent(summary.weeklyEvolution),
              ),
              _Metric(
                'Evolucao mensal',
                _signedPercent(summary.monthlyEvolution),
              ),
              _Metric('Evolucao de XP', summary.xpEvolution.round().toString()),
              _Metric(
                'Desempenho',
                _signedPercent(summary.performanceEvolution),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VisualizationsCard extends StatelessWidget {
  const _VisualizationsCard({required this.summary});

  final ProfileVisualSummary summary;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.stacked_line_chart_outlined,
            title: 'Visualizacoes',
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth > 620;
              final children = [
                _ChartPanel(
                  title: 'Evolucao de XP',
                  child: _LineChart(values: summary.xpEvolution),
                ),
                _ChartPanel(
                  title: 'Evolucao de niveis',
                  child: _LineChart(values: summary.levelEvolution),
                ),
                _ChartPanel(
                  title: 'Radar de competencias',
                  child: _RadarChart(values: summary.competencyRadar),
                ),
                _ChartPanel(
                  title: 'Assuntos dominados',
                  child: _DistributionChart(
                    values: summary.subjectDistribution,
                  ),
                ),
              ];
              return GridView.count(
                crossAxisCount: wide ? 2 : 1,
                childAspectRatio: wide ? 2.1 : 2.4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: children,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SocialCard extends StatelessWidget {
  const _SocialCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: Icons.share_outlined, title: 'Area social'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _ActionChipButton(
                label: 'Conquista',
                icon: Icons.emoji_events_outlined,
              ),
              _ActionChipButton(
                label: 'Perfil',
                icon: Icons.account_circle_outlined,
              ),
              _ActionChipButton(
                label: 'Nivel',
                icon: Icons.trending_up_outlined,
              ),
              _ActionChipButton(
                label: 'Badge',
                icon: Icons.workspace_premium_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickSettingsCard extends StatelessWidget {
  const _QuickSettingsCard({required this.settings});

  final ProfileQuickSettings settings;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.tune_outlined,
            title: 'Configuracoes rapidas',
          ),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.photo_camera_outlined),
            title: const Text('Alterar foto'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () =>
                _snack(context, 'Alteracao de foto preparada para integracao.'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.badge_outlined),
            title: const Text('Alterar apelido'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _snack(
              context,
              'Alteracao de apelido preparada para integracao.',
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Preferencias de notificacoes'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(AppRoute.notificationSettings.path),
          ),
          _SettingLine(label: 'Sons', value: settings.sounds),
          _SettingLine(label: 'Vibracao', value: settings.vibration),
          _SettingLine(label: 'Modo foco', value: settings.focusMode),
          _SettingLine(
            label: 'Modo competicao',
            value: settings.competitionMode,
          ),
          _ProfileRow(label: 'Tema', value: settings.theme),
        ],
      ),
    );
  }
}

class _SettingLine extends StatelessWidget {
  const _SettingLine({required this.label, required this.value});

  final String label;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return _ProfileRow(label: label, value: value ? 'Ativo' : 'Inativo');
  }
}

class _ActionChipButton extends StatelessWidget {
  const _ActionChipButton({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _snack(context, 'Compartilhamento de $label preparado.'),
      icon: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}

class _MetricWrap extends StatelessWidget {
  const _MetricWrap({required this.metrics});

  final List<_Metric> metrics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth > 720
            ? (constraints.maxWidth - 24) / 3
            : constraints.maxWidth > 420
            ? (constraints.maxWidth - 12) / 2
            : constraints.maxWidth;
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final metric in metrics)
              SizedBox(
                width: width,
                child: _MetricTile(metric: metric),
              ),
          ],
        );
      },
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.metric});

  final _Metric metric;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(metric.label, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 6),
            Text(
              metric.value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}

class _Metric {
  const _Metric(this.label, this.value);

  final String label;
  final String value;
}

class _InfoGrid extends StatelessWidget {
  const _InfoGrid({required this.items});

  final List<_InfoItem> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth > 620
            ? (constraints.maxWidth - 16) / 2
            : constraints.maxWidth;
        return Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            for (final item in items)
              SizedBox(
                width: width,
                child: _ProfileRow(label: item.label, value: item.value),
              ),
          ],
        );
      },
    );
  }
}

class _InfoItem {
  const _InfoItem(this.label, this.value);

  final String label;
  final String value;
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 132,
            child: Text(
              label,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.68)),
            ),
          ),
          Expanded(
            child: Text(
              value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      side: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
      backgroundColor: Colors.white.withValues(alpha: 0.04),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}

class _Stars extends StatelessWidget {
  const _Stars({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < 5; index++)
          Icon(
            index < count ? Icons.star : Icons.star_border,
            size: 16,
            color: Theme.of(context).colorScheme.tertiary,
          ),
      ],
    );
  }
}

class _ChartPanel extends StatelessWidget {
  const _ChartPanel({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({required this.values});

  final List<double> values;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LineChartPainter(
        values: values,
        color: Theme.of(context).colorScheme.primary,
        gridColor: Colors.white.withValues(alpha: 0.10),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _RadarChart extends StatelessWidget {
  const _RadarChart({required this.values});

  final Map<String, double> values;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadarPainter(
        values: values,
        color: Theme.of(context).colorScheme.secondary,
        gridColor: Colors.white.withValues(alpha: 0.10),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _DistributionChart extends StatelessWidget {
  const _DistributionChart({required this.values});

  final Map<String, double> values;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DistributionPainter(
        values: values,
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.tertiary,
          Theme.of(context).colorScheme.error,
        ],
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  const _LineChartPainter({
    required this.values,
    required this.color,
    required this.gridColor,
  });

  final List<double> values;
  final Color color;
  final Color gridColor;

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 1;
    for (var index = 1; index < 4; index++) {
      final y = size.height * index / 4;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
    if (values.length < 2) return;
    final minValue = values.reduce(math.min);
    final maxValue = values.reduce(math.max);
    final range = maxValue == minValue ? 1 : maxValue - minValue;
    final path = Path();
    for (var index = 0; index < values.length; index++) {
      final x = size.width * index / (values.length - 1);
      final y =
          size.height - ((values[index] - minValue) / range) * size.height;
      if (index == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter oldDelegate) {
    return oldDelegate.values != values || oldDelegate.color != color;
  }
}

class _RadarPainter extends CustomPainter {
  const _RadarPainter({
    required this.values,
    required this.color,
    required this.gridColor,
  });

  final Map<String, double> values;
  final Color color;
  final Color gridColor;

  @override
  void paint(Canvas canvas, Size size) {
    final entries = values.entries.toList(growable: false);
    if (entries.length < 3) return;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 8;
    final gridPaint = Paint()
      ..color = gridColor
      ..style = PaintingStyle.stroke;
    for (final factor in const [0.33, 0.66, 1.0]) {
      canvas.drawCircle(center, radius * factor, gridPaint);
    }
    final path = Path();
    for (var index = 0; index < entries.length; index++) {
      final angle = -math.pi / 2 + index * 2 * math.pi / entries.length;
      final value = entries[index].value.clamp(0, 1).toDouble();
      final point =
          center + Offset(math.cos(angle), math.sin(angle)) * radius * value;
      if (index == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    path.close();
    canvas.drawPath(path, Paint()..color = color.withValues(alpha: 0.22));
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(covariant _RadarPainter oldDelegate) {
    return oldDelegate.values != values || oldDelegate.color != color;
  }
}

class _DistributionPainter extends CustomPainter {
  const _DistributionPainter({required this.values, required this.colors});

  final Map<String, double> values;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final total = values.values.fold<double>(0, (sum, value) => sum + value);
    if (total == 0) return;
    final rect = Offset.zero & size;
    var start = -math.pi / 2;
    var index = 0;
    for (final value in values.values) {
      final sweep = value / total * 2 * math.pi;
      canvas.drawArc(
        rect.deflate(4),
        start,
        sweep,
        true,
        Paint()..color = colors[index % colors.length],
      );
      start += sweep;
      index++;
    }
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      math.min(size.width, size.height) * 0.23,
      Paint()..color = const Color(0xFF101C2E),
    );
  }

  @override
  bool shouldRepaint(covariant _DistributionPainter oldDelegate) {
    return oldDelegate.values != values;
  }
}

String _percent(double value) => '${(value.clamp(0, 1) * 100).round()}%';

String _signedPercent(double value) {
  final sign = value >= 0 ? '+' : '';
  return '$sign${(value * 100).round()}%';
}

String _duration(Duration duration) {
  if (duration.inHours > 0) {
    return '${duration.inHours}h ${duration.inMinutes.remainder(60)}min';
  }
  if (duration.inMinutes > 0) return '${duration.inMinutes}min';
  return '${duration.inSeconds}s';
}

String _date(DateTime? value) {
  if (value == null) return '-';
  final day = value.day.toString().padLeft(2, '0');
  final month = value.month.toString().padLeft(2, '0');
  return '$day/$month';
}

String _dateTime(DateTime value) {
  final day = value.day.toString().padLeft(2, '0');
  final month = value.month.toString().padLeft(2, '0');
  final hour = value.hour.toString().padLeft(2, '0');
  final minute = value.minute.toString().padLeft(2, '0');
  return '$day/$month ${hour}h$minute';
}

IconData _timelineIcon(ProfileTimelineIcon icon) {
  return switch (icon) {
    ProfileTimelineIcon.level => Icons.trending_up_outlined,
    ProfileTimelineIcon.badge => Icons.workspace_premium_outlined,
    ProfileTimelineIcon.subject => Icons.school_outlined,
    ProfileTimelineIcon.challenge => Icons.flag_outlined,
  };
}

Color _rarityColor(AchievementRarity rarity, ColorScheme colorScheme) {
  return switch (rarity) {
    AchievementRarity.common => colorScheme.outline,
    AchievementRarity.uncommon => colorScheme.primary,
    AchievementRarity.rare => colorScheme.secondary,
    AchievementRarity.epic => colorScheme.tertiary,
    AchievementRarity.legendary => colorScheme.error,
  };
}

String _rarityLabel(AchievementRarity rarity) {
  return switch (rarity) {
    AchievementRarity.common => 'Comum',
    AchievementRarity.uncommon => 'Incomum',
    AchievementRarity.rare => 'Rara',
    AchievementRarity.epic => 'Epica',
    AchievementRarity.legendary => 'Lendaria',
  };
}

void _snack(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
