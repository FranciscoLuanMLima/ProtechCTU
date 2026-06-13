import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/services/learning_catalog_seed.dart';
import '../user/domain/entities/learning_dashboard.dart';
import '../user/providers/user_providers.dart';
import 'activities_repository.dart';
import 'activities_cubit.dart';
import 'activity_model.dart';
import 'widgets/activity_card.dart';

class ActivitiesPage extends ConsumerWidget {
  const ActivitiesPage({super.key, this.filter});

  final String? filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = _ActivitiesView.fromFilter(filter);
    final activeUser = ref.watch(activeUserSessionProvider);
    final session = activeUser.asData?.value;
    final dashboard = session == null
        ? null
        : ref.watch(
            learningDashboardProvider(
              DashboardQuery(userId: session.learnerId),
            ),
          );
    final completedTopicIds = dashboard?.asData?.value.topics
        .where((item) => item.progress.status == TopicStatus.completed)
        .map((item) => item.topic.topicId)
        .toSet();
    final legacyCompletedActivityIds = const ActivitiesRepository()
        .legacyCompletedIds();

    return Scaffold(
      appBar: AppBar(title: Text(view.appBarTitle)),
      body: BlocBuilder<ActivitiesCubit, List<ActivityModel>>(
        builder: (context, activities) {
          final visibleActivities = view.apply(
            activities,
            completedTopicIds: completedTopicIds,
            legacyCompletedActivityIds: legacyCompletedActivityIds,
          );

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                view.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(view.description),
              const SizedBox(height: 16),
              if (view == _ActivitiesView.reviews)
                activeUser.when(
                  data: (session) =>
                      _ScheduledReviewsList(userId: session?.learnerId),
                  loading: () => const LinearProgressIndicator(),
                  error: (error, _) => _ActivitiesEmptyState(
                    message: 'Nao foi possivel inicializar o usuario: $error',
                  ),
                )
              else if (visibleActivities.isEmpty)
                _ActivitiesEmptyState(message: view.emptyMessage),
              if (view != _ActivitiesView.reviews)
                for (final activity in visibleActivities) ...[
                  ActivityCard(
                    activity: activity,
                    onStart: () => context.pushNamed(
                      AppRoute.activityEditor.name,
                      queryParameters: <String, String>{
                        'activityId': activity.id,
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
            ],
          );
        },
      ),
    );
  }
}

class _ScheduledReviewsList extends ConsumerWidget {
  const _ScheduledReviewsList({required this.userId});

  final String? userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = userId;
    if (id == null) {
      return const _ActivitiesEmptyState(
        message: 'Entre para visualizar suas revisoes agendadas.',
      );
    }
    final dashboard = ref.watch(
      learningDashboardProvider(DashboardQuery(userId: id)),
    );
    return dashboard.when(
      data: (snapshot) {
        if (snapshot.reviewsThisWeek.isEmpty) {
          return const _ActivitiesEmptyState(
            message: 'Nenhuma revisao agendada encontrada no momento.',
          );
        }
        final topicsById = <String, TopicDashboardItem>{
          for (final item in snapshot.topics) item.topic.topicId: item,
        };
        return Column(
          children: [
            for (final review in snapshot.reviewsThisWeek) ...[
              _ReviewCard(
                review: review,
                topicName:
                    topicsById[review.topicId]?.topic.name ?? review.topicId,
              ),
              const SizedBox(height: 12),
            ],
          ],
        );
      },
      loading: () => const LinearProgressIndicator(),
      error: (error, _) => _ActivitiesEmptyState(
        message: 'Nao foi possivel carregar revisoes: $error',
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review, required this.topicName});

  final ReviewSchedule review;
  final String topicName;

  @override
  Widget build(BuildContext context) {
    final due = review.dueAt.toLocal();
    return Card(
      child: ListTile(
        leading: const Icon(Icons.event_available_outlined),
        title: Text(topicName),
        subtitle: Text(
          'Vence em ${due.day.toString().padLeft(2, '0')}/'
          '${due.month.toString().padLeft(2, '0')} - '
          '${_urgencyLabel(review.urgency)}',
        ),
      ),
    );
  }

  String _urgencyLabel(ReviewUrgency urgency) {
    return switch (urgency) {
      ReviewUrgency.scheduled => 'agendada',
      ReviewUrgency.dueToday => 'vence hoje',
      ReviewUrgency.emergency => 'prioridade alta',
    };
  }
}

List<ActivityModel> filterPendingActivities(
  List<ActivityModel> activities, {
  required Set<String>? completedTopicIds,
  required Set<String> legacyCompletedActivityIds,
}) {
  return activities
      .where(
        (activity) => !_isCompletedActivity(
          activity,
          completedTopicIds: completedTopicIds,
          legacyCompletedActivityIds: legacyCompletedActivityIds,
        ),
      )
      .toList();
}

bool _isCompletedActivity(
  ActivityModel activity, {
  required Set<String>? completedTopicIds,
  required Set<String> legacyCompletedActivityIds,
}) {
  final topicId = LearningCatalogSeed.topicIdForActivity(activity.id);
  return legacyCompletedActivityIds.contains(activity.id) ||
      (topicId != null && (completedTopicIds?.contains(topicId) ?? false));
}

enum _ActivitiesView {
  all,
  pending,
  reviews;

  static _ActivitiesView fromFilter(String? filter) {
    return switch (filter) {
      'pending' => _ActivitiesView.pending,
      'reviews' => _ActivitiesView.reviews,
      _ => _ActivitiesView.all,
    };
  }

  String get appBarTitle {
    return switch (this) {
      _ActivitiesView.all => 'Atividades',
      _ActivitiesView.pending => 'Atividades pendentes',
      _ActivitiesView.reviews => 'Revisoes agendadas',
    };
  }

  String get title {
    return switch (this) {
      _ActivitiesView.all => 'Pratica orientada',
      _ActivitiesView.pending => 'Atividades pendentes',
      _ActivitiesView.reviews => 'Revisoes agendadas',
    };
  }

  String get description {
    return switch (this) {
      _ActivitiesView.all =>
        'Escolha um desafio. Cada atividade possui objetivo, etapas, dicas e criterio de conclusao.',
      _ActivitiesView.pending =>
        'Continue os desafios praticos ainda em aberto na sua trilha.',
      _ActivitiesView.reviews =>
        'Revise conteudos que precisam de reforco antes de avancar.',
    };
  }

  String get emptyMessage {
    return switch (this) {
      _ActivitiesView.all => 'Nenhuma atividade disponivel no momento.',
      _ActivitiesView.pending =>
        'Nenhuma atividade pendente encontrada no momento.',
      _ActivitiesView.reviews =>
        'Nenhuma revisao agendada encontrada no momento.',
    };
  }

  List<ActivityModel> apply(
    List<ActivityModel> activities, {
    required Set<String>? completedTopicIds,
    required Set<String> legacyCompletedActivityIds,
  }) {
    return switch (this) {
      _ActivitiesView.all => activities,
      _ActivitiesView.pending => filterPendingActivities(
        activities,
        completedTopicIds: completedTopicIds,
        legacyCompletedActivityIds: legacyCompletedActivityIds,
      ),
      _ActivitiesView.reviews => activities.where(_isReviewActivity).toList(),
    };
  }

  static bool _isReviewActivity(ActivityModel activity) {
    final text = [
      activity.title,
      activity.description,
      activity.concept,
      activity.objective,
      activity.problemStatement,
    ].join(' ').toLowerCase();
    return text.contains('revis') ||
        text.contains('refor') ||
        text.contains('maestr');
  }
}

class _ActivitiesEmptyState extends StatelessWidget {
  const _ActivitiesEmptyState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Text(message),
    );
  }
}
