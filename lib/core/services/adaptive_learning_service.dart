import '../../features/user/domain/entities/learning_dashboard.dart';

final class AdaptiveActivityResult {
  const AdaptiveActivityResult({required this.progress, required this.review});

  final TopicLearningProgress progress;
  final ReviewSchedule review;
}

final class AdaptiveLearningService {
  const AdaptiveLearningService();

  AdaptiveActivityResult apply({
    required LearningTopic topic,
    required TopicLearningProgress current,
    required StudyActivity activity,
    ReviewSchedule? currentReview,
  }) {
    final isAttempt = activity.wasCorrect != null;
    final attempts = current.totalAttempts + (isAttempt ? 1 : 0);
    final correct =
        current.correctAttempts + (activity.wasCorrect == true ? 1 : 0);
    final completedExercises = _countsAsCompletedUnit(activity.type)
        ? (current.completedExercises + 1).clamp(0, topic.totalExercises)
        : current.completedExercises;
    final completion = topic.totalExercises == 0
        ? current.completionRate
        : completedExercises / topic.totalExercises;
    final responseTime =
        current.totalResponseTime + (activity.responseTime ?? Duration.zero);
    final accuracy = attempts == 0 ? 0.0 : correct / attempts;
    final mastery = _mastery(
      completion: completion,
      accuracy: accuracy,
      attempts: attempts,
      current: current.masteryRate,
    );
    final now = activity.occurredAt.toUtc();
    final status = completion >= 1 && mastery >= 0.7
        ? TopicStatus.completed
        : mastery < 0.5 && attempts >= 3
        ? TopicStatus.reviewRecommended
        : TopicStatus.inProgress;
    final difficulty = _perceivedDifficulty(accuracy, responseTime, attempts);
    final badges = <String>{...current.unlockedBadgeIds};
    if (mastery >= 1) {
      badges.add('master_${topic.topicId}');
    }
    if (activity.wasCorrect == true &&
        activity.wasFirstAttempt &&
        attempts == correct) {
      badges.add('first_try_${topic.topicId}');
    }
    final updated = current.copyWith(
      status: status,
      completionRate: completion,
      previousMasteryRate: current.masteryRate,
      masteryRate: mastery,
      completedExercises: completedExercises,
      totalAttempts: attempts,
      correctAttempts: correct,
      totalResponseTime: responseTime,
      totalStudyTime: current.totalStudyTime + activity.duration,
      userDifficulty: difficulty,
      unlockedBadgeIds: badges.toList(growable: false),
      firstTryPerfect: attempts > 0 && attempts == correct,
      lastAccess: now,
      unlockedAt: current.unlockedAt ?? now,
      completedAt: status == TopicStatus.completed ? now : current.completedAt,
      updatedAt: now,
    );
    return AdaptiveActivityResult(
      progress: updated,
      review: _scheduleReview(
        current: currentReview,
        userId: current.userId,
        topicId: topic.topicId,
        mastery: mastery,
        wasCorrect: activity.wasCorrect,
        at: now,
      ),
    );
  }

  double _mastery({
    required double completion,
    required double accuracy,
    required int attempts,
    required double current,
  }) {
    if (attempts == 0) {
      return current;
    }
    return ((completion * 0.45) + (accuracy * 0.55)).clamp(0, 1);
  }

  bool _countsAsCompletedUnit(StudyEventType type) {
    return switch (type) {
      StudyEventType.exerciseCompleted ||
      StudyEventType.quizCompleted ||
      StudyEventType.challengeCompleted => true,
      StudyEventType.contentViewed ||
      StudyEventType.exerciseAttempted ||
      StudyEventType.reviewCompleted => false,
    };
  }

  TopicDifficulty _perceivedDifficulty(
    double accuracy,
    Duration responseTime,
    int attempts,
  ) {
    final averageMilliseconds = attempts == 0
        ? 0
        : responseTime.inMilliseconds ~/ attempts;
    if (accuracy < 0.5 || averageMilliseconds > 180000) {
      return TopicDifficulty.hard;
    }
    if (accuracy < 0.8 || averageMilliseconds > 90000) {
      return TopicDifficulty.medium;
    }
    return TopicDifficulty.easy;
  }

  ReviewSchedule _scheduleReview({
    required ReviewSchedule? current,
    required String userId,
    required String topicId,
    required double mastery,
    required bool? wasCorrect,
    required DateTime at,
  }) {
    final failed = wasCorrect == false;
    final repetitions = failed ? 0 : (current?.repetitions ?? 0) + 1;
    final lapses = (current?.lapses ?? 0) + (failed ? 1 : 0);
    final ease = ((current?.easeFactor ?? 2.5) + (failed ? -0.2 : 0.1)).clamp(
      1.3,
      3.0,
    );
    final interval = failed
        ? 1
        : repetitions == 1
        ? 1
        : repetitions == 2
        ? 3
        : ((current?.intervalDays ?? 3) * ease).round().clamp(1, 180);
    final urgency = failed || mastery < 0.5
        ? ReviewUrgency.emergency
        : interval <= 1
        ? ReviewUrgency.dueToday
        : ReviewUrgency.scheduled;
    return ReviewSchedule(
      userId: userId,
      topicId: topicId,
      dueAt: at.add(Duration(days: interval)),
      lastReviewedAt: at,
      intervalDays: interval,
      easeFactor: ease,
      repetitions: repetitions,
      lapses: lapses,
      urgency: urgency,
    );
  }
}
