import 'user_profile.dart';

enum TopicStatus {
  notStarted,
  inProgress,
  completed,
  blocked,
  reviewRecommended,
}

enum LearningContentType {
  theory,
  exercise,
  challenge,
  quiz,
  project,
  flashcard,
}

enum TopicDifficulty { easy, medium, hard }

enum StudyEventType {
  contentViewed,
  exerciseAttempted,
  exerciseCompleted,
  quizCompleted,
  challengeCompleted,
  reviewCompleted,
}

enum RecommendationType {
  nextTopic,
  requiredReview,
  unlockChallenge,
  placementTest,
  beginnerReinforcement,
}

enum ReviewUrgency { scheduled, dueToday, emergency }

enum GoalStatus { active, completed, expired, cancelled }

enum TopicSort {
  learningPath,
  progressDescending,
  leastRecentAccess,
  difficulty,
}

enum LearningIndicatorStatus {
  excellentMastery,
  goodProgress,
  needsReview,
  criticalTopic,
}

enum LearningTrend { improving, stable, declining }

final class LearningTopic {
  const LearningTopic({
    required this.topicId,
    required this.name,
    required this.description,
    required this.parentTopicId,
    required this.prerequisiteTopicIds,
    required this.contentTypes,
    required this.difficulty,
    required this.order,
    required this.totalExercises,
    required this.xpReward,
    required this.coinReward,
    required this.isActive,
  });

  final String topicId;
  final String name;
  final String description;
  final String? parentTopicId;
  final List<String> prerequisiteTopicIds;
  final List<LearningContentType> contentTypes;
  final TopicDifficulty difficulty;
  final int order;
  final int totalExercises;
  final int xpReward;
  final int coinReward;
  final bool isActive;
}

final class TopicLearningProgress {
  const TopicLearningProgress({
    required this.userId,
    required this.topicId,
    required this.status,
    required this.completionRate,
    required this.masteryRate,
    required this.previousMasteryRate,
    required this.completedExercises,
    required this.totalAttempts,
    required this.correctAttempts,
    required this.totalResponseTime,
    required this.totalStudyTime,
    required this.userDifficulty,
    required this.unlockedBadgeIds,
    required this.firstTryPerfect,
    required this.lastAccess,
    required this.unlockedAt,
    required this.completedAt,
    required this.updatedAt,
  });

  final String userId;
  final String topicId;
  final TopicStatus status;
  final double completionRate;
  final double masteryRate;
  final double previousMasteryRate;
  final int completedExercises;
  final int totalAttempts;
  final int correctAttempts;
  final Duration totalResponseTime;
  final Duration totalStudyTime;
  final TopicDifficulty? userDifficulty;
  final List<String> unlockedBadgeIds;
  final bool firstTryPerfect;
  final DateTime? lastAccess;
  final DateTime? unlockedAt;
  final DateTime? completedAt;
  final DateTime updatedAt;

  double get accuracyRate =>
      totalAttempts == 0 ? 0 : correctAttempts / totalAttempts;

  Duration get averageResponseTime => totalAttempts == 0
      ? Duration.zero
      : Duration(
          milliseconds: totalResponseTime.inMilliseconds ~/ totalAttempts,
        );

  int get masteryStars => (masteryRate * 5).ceil().clamp(1, 5);

  double get masteryVariation => masteryRate - previousMasteryRate;

  TopicLearningProgress copyWith({
    TopicStatus? status,
    double? completionRate,
    double? masteryRate,
    double? previousMasteryRate,
    int? completedExercises,
    int? totalAttempts,
    int? correctAttempts,
    Duration? totalResponseTime,
    Duration? totalStudyTime,
    TopicDifficulty? userDifficulty,
    List<String>? unlockedBadgeIds,
    bool? firstTryPerfect,
    DateTime? lastAccess,
    DateTime? unlockedAt,
    DateTime? completedAt,
    DateTime? updatedAt,
  }) {
    return TopicLearningProgress(
      userId: userId,
      topicId: topicId,
      status: status ?? this.status,
      completionRate: completionRate ?? this.completionRate,
      masteryRate: masteryRate ?? this.masteryRate,
      previousMasteryRate: previousMasteryRate ?? this.previousMasteryRate,
      completedExercises: completedExercises ?? this.completedExercises,
      totalAttempts: totalAttempts ?? this.totalAttempts,
      correctAttempts: correctAttempts ?? this.correctAttempts,
      totalResponseTime: totalResponseTime ?? this.totalResponseTime,
      totalStudyTime: totalStudyTime ?? this.totalStudyTime,
      userDifficulty: userDifficulty ?? this.userDifficulty,
      unlockedBadgeIds: unlockedBadgeIds ?? this.unlockedBadgeIds,
      firstTryPerfect: firstTryPerfect ?? this.firstTryPerfect,
      lastAccess: lastAccess ?? this.lastAccess,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      completedAt: completedAt ?? this.completedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

final class StudyActivity {
  const StudyActivity({
    required this.activityId,
    required this.userId,
    required this.topicId,
    required this.type,
    required this.occurredAt,
    required this.duration,
    required this.responseTime,
    required this.wasCorrect,
    required this.wasFirstAttempt,
    required this.masteryAfterEvent,
  });

  final String activityId;
  final String userId;
  final String topicId;
  final StudyEventType type;
  final DateTime occurredAt;
  final Duration duration;
  final Duration? responseTime;
  final bool? wasCorrect;
  final bool wasFirstAttempt;
  final double masteryAfterEvent;
}

final class ReviewSchedule {
  const ReviewSchedule({
    required this.userId,
    required this.topicId,
    required this.dueAt,
    required this.lastReviewedAt,
    required this.intervalDays,
    required this.easeFactor,
    required this.repetitions,
    required this.lapses,
    required this.urgency,
  });

  final String userId;
  final String topicId;
  final DateTime dueAt;
  final DateTime? lastReviewedAt;
  final int intervalDays;
  final double easeFactor;
  final int repetitions;
  final int lapses;
  final ReviewUrgency urgency;
}

final class LearningGoal {
  const LearningGoal({
    required this.goalId,
    required this.userId,
    required this.topicId,
    required this.description,
    required this.targetCompletionRate,
    required this.deadline,
    required this.status,
    required this.createdAt,
  });

  final String goalId;
  final String userId;
  final String? topicId;
  final String description;
  final double targetCompletionRate;
  final DateTime deadline;
  final GoalStatus status;
  final DateTime createdAt;
}

final class TopicDashboardItem {
  const TopicDashboardItem({
    required this.topic,
    required this.progress,
    required this.isUnlocked,
    required this.missingPrerequisiteIds,
  });

  final LearningTopic topic;
  final TopicLearningProgress progress;
  final bool isUnlocked;
  final List<String> missingPrerequisiteIds;
}

final class PersonalizedRecommendation {
  const PersonalizedRecommendation({
    required this.type,
    required this.topicId,
    required this.title,
    required this.reason,
    required this.priority,
  });

  final RecommendationType type;
  final String topicId;
  final String title;
  final String reason;
  final int priority;
}

final class LearningMilestone {
  const LearningMilestone({
    required this.title,
    required this.description,
    required this.progress,
  });

  final String title;
  final String description;
  final double progress;
}

final class ActivityHeatmapEntry {
  const ActivityHeatmapEntry({required this.day, required this.studyTime});

  final DateTime day;
  final Duration studyTime;
}

final class TopicLearningAnalysis {
  const TopicLearningAnalysis({
    required this.topicId,
    required this.indicator,
    required this.trend,
    required this.accuracyRate,
    required this.averageResponseTime,
    required this.attempts,
    required this.recurringErrors,
    required this.abandoned,
    required this.studyFrequencyDays,
  });

  final String topicId;
  final LearningIndicatorStatus indicator;
  final LearningTrend trend;
  final double accuracyRate;
  final Duration averageResponseTime;
  final int attempts;
  final int recurringErrors;
  final bool abandoned;
  final int studyFrequencyDays;
}

final class TopicDifficultyHeatmapEntry {
  const TopicDifficultyHeatmapEntry({
    required this.topicId,
    required this.topicName,
    required this.masteryRate,
    required this.indicator,
  });

  final String topicId;
  final String topicName;
  final double masteryRate;
  final LearningIndicatorStatus indicator;
}

final class LearningCurvePoint {
  const LearningCurvePoint({
    required this.day,
    required this.masteryRate,
    required this.accuracyRate,
    required this.estimatedXp,
  });

  final DateTime day;
  final double masteryRate;
  final double accuracyRate;
  final int estimatedXp;
}

final class PersonalizedLearningReport {
  const PersonalizedLearningReport({
    required this.message,
    required this.topicId,
    required this.priority,
  });

  final String message;
  final String? topicId;
  final int priority;
}

final class DashboardFilters {
  const DashboardFilters({
    this.searchTerm,
    this.status,
    this.difficulty,
    this.contentType,
    this.sort = TopicSort.learningPath,
  });

  final String? searchTerm;
  final TopicStatus? status;
  final TopicDifficulty? difficulty;
  final LearningContentType? contentType;
  final TopicSort sort;
}

final class LearningDashboardSnapshot {
  const LearningDashboardSnapshot({
    required this.user,
    required this.overallProgress,
    required this.topics,
    required this.recommendations,
    required this.reviewsDueToday,
    required this.reviewsThisWeek,
    required this.goals,
    required this.strongTopicIds,
    required this.weakTopicIds,
    required this.heatmap,
    required this.topicAnalyses,
    required this.difficultyHeatmap,
    required this.learningCurve,
    required this.personalizedReports,
    required this.milestones,
    required this.estimatedCompletionDate,
  });

  final UserProfile? user;
  final double overallProgress;
  final List<TopicDashboardItem> topics;
  final List<PersonalizedRecommendation> recommendations;
  final List<ReviewSchedule> reviewsDueToday;
  final List<ReviewSchedule> reviewsThisWeek;
  final List<LearningGoal> goals;
  final List<String> strongTopicIds;
  final List<String> weakTopicIds;
  final List<ActivityHeatmapEntry> heatmap;
  final List<TopicLearningAnalysis> topicAnalyses;
  final List<TopicDifficultyHeatmapEntry> difficultyHeatmap;
  final List<LearningCurvePoint> learningCurve;
  final List<PersonalizedLearningReport> personalizedReports;
  final List<LearningMilestone> milestones;
  final DateTime? estimatedCompletionDate;
}
