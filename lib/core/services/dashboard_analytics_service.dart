import '../../features/user/domain/entities/learning_dashboard.dart';
import '../../features/user/domain/entities/user_profile.dart';

final class DashboardAnalyticsService {
  const DashboardAnalyticsService();

  LearningDashboardSnapshot build({
    required UserProfile? user,
    required List<LearningTopic> topics,
    required List<TopicLearningProgress> progress,
    required List<StudyActivity> activities,
    required List<ReviewSchedule> reviews,
    required List<LearningGoal> goals,
    required DashboardFilters filters,
    required DateTime now,
  }) {
    final progressByTopic = <String, TopicLearningProgress>{
      for (final item in progress) item.topicId: item,
    };
    final completedIds = progress
        .where((item) => item.status == TopicStatus.completed)
        .map((item) => item.topicId)
        .toSet();
    final reviewIds = reviews
        .where((item) => !item.dueAt.isAfter(now.add(const Duration(days: 1))))
        .map((item) => item.topicId)
        .toSet();
    final allItems = topics
        .map((topic) {
          final missing = topic.prerequisiteTopicIds
              .where((id) => !completedIds.contains(id))
              .toList(growable: false);
          var itemProgress =
              progressByTopic[topic.topicId] ??
              _emptyProgress(
                userId: user?.userId ?? '',
                topicId: topic.topicId,
                status: missing.isEmpty
                    ? TopicStatus.notStarted
                    : TopicStatus.blocked,
                at: now,
              );
          if (missing.isNotEmpty &&
              itemProgress.status == TopicStatus.notStarted) {
            itemProgress = itemProgress.copyWith(status: TopicStatus.blocked);
          } else if (reviewIds.contains(topic.topicId) &&
              itemProgress.status == TopicStatus.completed) {
            itemProgress = itemProgress.copyWith(
              status: TopicStatus.reviewRecommended,
            );
          }
          return TopicDashboardItem(
            topic: topic,
            progress: itemProgress,
            isUnlocked: missing.isEmpty,
            missingPrerequisiteIds: missing,
          );
        })
        .toList(growable: false);
    final items = _applyFilters(allItems, filters);
    final dueToday = reviews
        .where((item) => !item.dueAt.isAfter(_endOfDay(now)))
        .toList(growable: false);
    final dueWeek = reviews
        .where((item) => !item.dueAt.isAfter(now.add(const Duration(days: 7))))
        .toList(growable: false);
    return LearningDashboardSnapshot(
      user: user,
      overallProgress: _overallProgress(allItems),
      topics: items,
      recommendations: _recommend(allItems, reviews, now),
      reviewsDueToday: dueToday,
      reviewsThisWeek: dueWeek,
      goals: goals,
      strongTopicIds: progress
          .where((item) => item.totalAttempts > 0 && item.accuracyRate >= 0.8)
          .map((item) => item.topicId)
          .toList(growable: false),
      weakTopicIds: progress
          .where((item) => item.totalAttempts >= 2 && item.accuracyRate < 0.5)
          .map((item) => item.topicId)
          .toList(growable: false),
      heatmap: _heatmap(activities),
      milestones: _milestones(user, allItems, goals, now),
      estimatedCompletionDate: _estimateCompletion(allItems, activities, now),
    );
  }

  List<TopicDashboardItem> _applyFilters(
    List<TopicDashboardItem> items,
    DashboardFilters filters,
  ) {
    final search = filters.searchTerm?.trim().toLowerCase();
    final result = items.where((item) {
      if (search != null &&
          search.isNotEmpty &&
          !item.topic.name.toLowerCase().contains(search)) {
        return false;
      }
      if (filters.status != null && item.progress.status != filters.status) {
        return false;
      }
      if (filters.difficulty != null &&
          item.topic.difficulty != filters.difficulty) {
        return false;
      }
      return filters.contentType == null ||
          item.topic.contentTypes.contains(filters.contentType);
    }).toList();
    switch (filters.sort) {
      case TopicSort.learningPath:
        result.sort((a, b) => a.topic.order.compareTo(b.topic.order));
        break;
      case TopicSort.progressDescending:
        result.sort(
          (a, b) =>
              b.progress.completionRate.compareTo(a.progress.completionRate),
        );
        break;
      case TopicSort.leastRecentAccess:
        result.sort(
          (a, b) =>
              (a.progress.lastAccess ?? DateTime.fromMillisecondsSinceEpoch(0))
                  .compareTo(
                    b.progress.lastAccess ??
                        DateTime.fromMillisecondsSinceEpoch(0),
                  ),
        );
        break;
      case TopicSort.difficulty:
        result.sort(
          (a, b) =>
              b.topic.difficulty.index.compareTo(a.topic.difficulty.index),
        );
        break;
    }
    return List<TopicDashboardItem>.unmodifiable(result);
  }

  double _overallProgress(List<TopicDashboardItem> items) {
    final weight = items.fold<int>(
      0,
      (sum, item) => sum + item.topic.totalExercises.clamp(1, 1000000),
    );
    if (weight == 0) {
      return 0;
    }
    final completed = items.fold<double>(
      0,
      (sum, item) =>
          sum +
          (item.progress.completionRate *
              item.topic.totalExercises.clamp(1, 1000000)),
    );
    return completed / weight;
  }

  List<PersonalizedRecommendation> _recommend(
    List<TopicDashboardItem> items,
    List<ReviewSchedule> reviews,
    DateTime now,
  ) {
    final recommendations = <PersonalizedRecommendation>[];
    final itemById = <String, TopicDashboardItem>{
      for (final item in items) item.topic.topicId: item,
    };
    for (final review in reviews.where((item) => !item.dueAt.isAfter(now))) {
      final topic = itemById[review.topicId];
      if (topic != null) {
        recommendations.add(
          PersonalizedRecommendation(
            type: RecommendationType.requiredReview,
            topicId: topic.topic.topicId,
            title: 'Revisar ${topic.topic.name}',
            reason: review.urgency == ReviewUrgency.emergency
                ? 'Erros recentes indicam revisão imediata.'
                : 'A revisão espaçada deste assunto venceu.',
            priority: review.urgency == ReviewUrgency.emergency ? 100 : 80,
          ),
        );
      }
    }
    final next = items
        .where(
          (item) =>
              item.isUnlocked &&
              (item.progress.status == TopicStatus.notStarted ||
                  item.progress.status == TopicStatus.inProgress),
        )
        .firstOrNull;
    if (next != null) {
      recommendations.add(
        PersonalizedRecommendation(
          type: RecommendationType.nextTopic,
          topicId: next.topic.topicId,
          title: 'Continuar ${next.topic.name}',
          reason: 'Os pre-requisitos estao concluidos.',
          priority: 60,
        ),
      );
    }
    for (final item in items.where(
      (item) =>
          item.progress.totalAttempts >= 2 && item.progress.accuracyRate < 0.5,
    )) {
      recommendations.add(
        PersonalizedRecommendation(
          type: RecommendationType.beginnerReinforcement,
          topicId: item.topic.topicId,
          title: 'Reforçar ${item.topic.name}',
          reason: 'A taxa de acerto esta abaixo de 50%.',
          priority: 90,
        ),
      );
    }
    recommendations.sort((a, b) => b.priority.compareTo(a.priority));
    return List<PersonalizedRecommendation>.unmodifiable(recommendations);
  }

  List<ActivityHeatmapEntry> _heatmap(List<StudyActivity> activities) {
    final totals = <DateTime, Duration>{};
    for (final activity in activities) {
      final day = DateTime.utc(
        activity.occurredAt.year,
        activity.occurredAt.month,
        activity.occurredAt.day,
      );
      totals[day] = (totals[day] ?? Duration.zero) + activity.duration;
    }
    final entries =
        totals.entries
            .map(
              (entry) =>
                  ActivityHeatmapEntry(day: entry.key, studyTime: entry.value),
            )
            .toList()
          ..sort((a, b) => a.day.compareTo(b.day));
    return List<ActivityHeatmapEntry>.unmodifiable(entries);
  }

  List<LearningMilestone> _milestones(
    UserProfile? user,
    List<TopicDashboardItem> items,
    List<LearningGoal> goals,
    DateTime now,
  ) {
    final milestones = <LearningMilestone>[];
    if (user != null && user.progression.nextLevelXp > 0) {
      milestones.add(
        LearningMilestone(
          title: 'Próximo nível',
          description:
              'Faltam ${(user.progression.nextLevelXp - user.progression.currentXp).clamp(0, user.progression.nextLevelXp)} XP.',
          progress: user.progression.currentXp / user.progression.nextLevelXp,
        ),
      );
    }
    final blocked = items.where((item) => !item.isUnlocked).firstOrNull;
    if (blocked != null) {
      milestones.add(
        LearningMilestone(
          title: 'Desbloquear ${blocked.topic.name}',
          description:
              'Conclua ${blocked.missingPrerequisiteIds.length} pre-requisito(s).',
          progress: 0,
        ),
      );
    }
    for (final goal in goals.where((item) => item.deadline.isAfter(now))) {
      milestones.add(
        LearningMilestone(
          title: 'Meta pessoal',
          description: goal.description,
          progress: goal.topicId == null
              ? 0
              : items
                        .where((item) => item.topic.topicId == goal.topicId)
                        .firstOrNull
                        ?.progress
                        .completionRate ??
                    0,
        ),
      );
    }
    return List<LearningMilestone>.unmodifiable(milestones);
  }

  DateTime? _estimateCompletion(
    List<TopicDashboardItem> items,
    List<StudyActivity> activities,
    DateTime now,
  ) {
    final completed = items.where(
      (item) => item.progress.status == TopicStatus.completed,
    );
    final remaining = items.length - completed.length;
    if (remaining <= 0) {
      return now;
    }
    final activeDays = activities
        .map(
          (item) => DateTime.utc(
            item.occurredAt.year,
            item.occurredAt.month,
            item.occurredAt.day,
          ),
        )
        .toSet()
        .length;
    if (completed.isEmpty || activeDays == 0) {
      return null;
    }
    final topicsPerDay = completed.length / activeDays;
    return now.add(Duration(days: (remaining / topicsPerDay).ceil()));
  }

  TopicLearningProgress _emptyProgress({
    required String userId,
    required String topicId,
    required TopicStatus status,
    required DateTime at,
  }) {
    return TopicLearningProgress(
      userId: userId,
      topicId: topicId,
      status: status,
      completionRate: 0,
      masteryRate: 0,
      previousMasteryRate: 0,
      completedExercises: 0,
      totalAttempts: 0,
      correctAttempts: 0,
      totalResponseTime: Duration.zero,
      totalStudyTime: Duration.zero,
      userDifficulty: null,
      unlockedBadgeIds: const <String>[],
      firstTryPerfect: false,
      lastAccess: null,
      unlockedAt: null,
      completedAt: null,
      updatedAt: at,
    );
  }

  DateTime _endOfDay(DateTime value) =>
      DateTime.utc(value.year, value.month, value.day, 23, 59, 59, 999);
}
