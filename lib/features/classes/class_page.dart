import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/app_card.dart';
import 'domain/entities/class_entities.dart';
import 'providers/class_providers.dart';

class ClassPage extends ConsumerWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentId = ref.watch(currentStudentIdProvider);
    if (studentId == null) {
      return const Scaffold(
        body: Center(child: Text('Entre para consultar sua turma.')),
      );
    }
    final academicClass = ref.watch(classProvider(studentId));
    return Scaffold(
      appBar: AppBar(title: const Text('Minha turma')),
      body: academicClass.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            Center(child: Text('Falha ao carregar turma: $error')),
        data: (value) {
          if (value == null) {
            return const Center(
              child: Text('Nenhuma turma vinculada ao seu perfil.'),
            );
          }
          return _ClassOverview(academicClass: value, studentId: studentId);
        },
      ),
    );
  }
}

class _ClassOverview extends ConsumerWidget {
  const _ClassOverview({required this.academicClass, required this.studentId});

  final ClassEntity academicClass;
  final String studentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(classStatsProvider(studentId));
    final ranking = ref.watch(rankingProvider(studentId));
    final members = ref.watch(classmatesProvider(studentId));
    return RefreshIndicator(
      onRefresh: () async {
        final repository = await ref.read(classRepositoryProvider.future);
        await repository.refreshClassAnalytics(studentId);
        ref.invalidate(classStatsProvider(studentId));
        ref.invalidate(rankingProvider(studentId));
        ref.invalidate(classmatesProvider(studentId));
      },
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  academicClass.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  '${academicClass.course} - ${academicClass.period} periodo',
                ),
                Text('Campus: ${academicClass.campus}'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          stats.when(
            data: (data) => data == null
                ? const SizedBox.shrink()
                : _StatisticsCard(statistics: data),
            loading: () => const LinearProgressIndicator(),
            error: (_, _) => const Text('Estatisticas indisponiveis.'),
          ),
          const SizedBox(height: 20),
          Text(
            'Ranking da turma',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          ranking.when(
            data: (data) => data == null
                ? const Text('Ranking ainda nao calculado.')
                : Column(
                    children: [
                      for (final entry in data.entries) ...[
                        _RankingCard(
                          entry: entry,
                          isCurrentStudent:
                              entry.student.studentId == studentId,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ],
                  ),
            loading: () => const LinearProgressIndicator(),
            error: (_, _) => const Text('Ranking indisponivel.'),
          ),
          const SizedBox(height: 20),
          Text('Colegas', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          members.when(
            data: (items) => Column(
              children: [
                for (final student in items) ...[
                  _MemberCard(student: student),
                  const SizedBox(height: 8),
                ],
              ],
            ),
            loading: () => const LinearProgressIndicator(),
            error: (_, _) => const Text('Membros indisponiveis.'),
          ),
        ],
      ),
    );
  }
}

class _StatisticsCard extends StatelessWidget {
  const _StatisticsCard({required this.statistics});

  final ClassStatisticsEntity statistics;

  @override
  Widget build(BuildContext context) {
    final accuracy = (statistics.averageAccuracy * 100).toStringAsFixed(1);
    final progress = (statistics.averageProgress * 100).toStringAsFixed(1);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Media geral', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            '${statistics.totalStudents} alunos | XP medio: ${statistics.averageXp.toStringAsFixed(0)}',
          ),
          Text('Progresso: $progress% | Acertos: $accuracy%'),
          Text(
            'Streak medio: ${statistics.averageStreak.toStringAsFixed(1)} dias',
          ),
          Text('Exercicios concluidos: ${statistics.totalCompletedExercises}'),
          if (statistics.mostDifficultTopicId != null)
            Text('Maior dificuldade: ${statistics.mostDifficultTopicId}'),
          if (statistics.mostMasteredTopicId != null)
            Text('Maior dominio: ${statistics.mostMasteredTopicId}'),
        ],
      ),
    );
  }
}

class _RankingCard extends StatelessWidget {
  const _RankingCard({required this.entry, required this.isCurrentStudent});

  final StudentRankingEntry entry;
  final bool isCurrentStudent;

  @override
  Widget build(BuildContext context) => AppCard(
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(child: Text('${entry.position}')),
      title: Text(
        isCurrentStudent ? '${entry.student.name} (voce)' : entry.student.name,
      ),
      subtitle: Text(
        'Nivel ${entry.student.level} | ${entry.student.streakDays} dias de streak',
      ),
      trailing: Text('${entry.student.totalXp} XP'),
    ),
  );
}

class _MemberCard extends StatelessWidget {
  const _MemberCard({required this.student});

  final StudentPublicProfileEntity student;

  @override
  Widget build(BuildContext context) => AppCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(student.name, style: Theme.of(context).textTheme.titleMedium),
        Text(
          'Nivel ${student.level} | ${student.totalXp} XP | Streak ${student.streakDays}',
        ),
        Text(
          'Progresso ${(student.overallProgress * 100).toStringAsFixed(0)}%',
        ),
        if (student.primaryBadgeIds.isNotEmpty)
          Text('Badges: ${student.primaryBadgeIds.join(', ')}'),
      ],
    ),
  );
}
