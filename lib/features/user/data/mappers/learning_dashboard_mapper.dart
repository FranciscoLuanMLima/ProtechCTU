import '../../domain/entities/learning_dashboard.dart';
import '../models/learning_dashboard_model.dart';

abstract final class LearningDashboardMapper {
  static LearningTopic topicToEntity(LearningTopicModel model) {
    return LearningTopic(
      topicId: model.topicId,
      name: model.name,
      description: model.description,
      parentTopicId: model.parentTopicId,
      prerequisiteTopicIds: List<String>.unmodifiable(
        model.prerequisiteTopicIds,
      ),
      contentTypes: List<LearningContentType>.unmodifiable(
        model.contentTypes.map(LearningContentType.values.byName),
      ),
      difficulty: TopicDifficulty.values.byName(model.difficulty),
      order: model.order,
      totalExercises: model.totalExercises,
      xpReward: model.xpReward,
      coinReward: model.coinReward,
      isActive: model.isActive,
    );
  }

  static LearningTopicModel topicToModel(LearningTopic entity) {
    return LearningTopicModel()
      ..topicId = entity.topicId
      ..name = entity.name
      ..description = entity.description
      ..parentTopicId = entity.parentTopicId
      ..prerequisiteTopicIds = List<String>.from(entity.prerequisiteTopicIds)
      ..contentTypes = entity.contentTypes.map((item) => item.name).toList()
      ..difficulty = entity.difficulty.name
      ..order = entity.order
      ..totalExercises = entity.totalExercises
      ..xpReward = entity.xpReward
      ..coinReward = entity.coinReward
      ..isActive = entity.isActive;
  }

  static TopicLearningProgress progressToEntity(UserTopicProgressModel model) {
    return TopicLearningProgress(
      userId: model.userId,
      topicId: model.topicId,
      status: TopicStatus.values.byName(model.status),
      completionRate: model.completionRate,
      masteryRate: model.masteryRate,
      previousMasteryRate: model.previousMasteryRate,
      completedExercises: model.completedExercises,
      totalAttempts: model.totalAttempts,
      correctAttempts: model.correctAttempts,
      totalResponseTime: Duration(
        milliseconds: model.totalResponseTimeMilliseconds,
      ),
      totalStudyTime: Duration(milliseconds: model.totalStudyTimeMilliseconds),
      userDifficulty: model.userDifficulty == null
          ? null
          : TopicDifficulty.values.byName(model.userDifficulty!),
      unlockedBadgeIds: List<String>.unmodifiable(model.unlockedBadgeIds),
      firstTryPerfect: model.firstTryPerfect,
      lastAccess: model.lastAccess,
      unlockedAt: model.unlockedAt,
      completedAt: model.completedAt,
      updatedAt: model.updatedAt,
    );
  }

  static UserTopicProgressModel progressToModel(TopicLearningProgress entity) {
    return UserTopicProgressModel()
      ..recordKey = progressKey(entity.userId, entity.topicId)
      ..userId = entity.userId
      ..topicId = entity.topicId
      ..status = entity.status.name
      ..completionRate = entity.completionRate
      ..masteryRate = entity.masteryRate
      ..previousMasteryRate = entity.previousMasteryRate
      ..completedExercises = entity.completedExercises
      ..totalAttempts = entity.totalAttempts
      ..correctAttempts = entity.correctAttempts
      ..totalResponseTimeMilliseconds = entity.totalResponseTime.inMilliseconds
      ..totalStudyTimeMilliseconds = entity.totalStudyTime.inMilliseconds
      ..userDifficulty = entity.userDifficulty?.name
      ..unlockedBadgeIds = List<String>.from(entity.unlockedBadgeIds)
      ..firstTryPerfect = entity.firstTryPerfect
      ..lastAccess = entity.lastAccess?.toUtc()
      ..unlockedAt = entity.unlockedAt?.toUtc()
      ..completedAt = entity.completedAt?.toUtc()
      ..updatedAt = entity.updatedAt.toUtc();
  }

  static StudyActivity activityToEntity(StudyActivityModel model) {
    return StudyActivity(
      activityId: model.activityId,
      userId: model.userId,
      topicId: model.topicId,
      type: StudyEventType.values.byName(model.type),
      occurredAt: model.occurredAt,
      duration: Duration(milliseconds: model.durationMilliseconds),
      responseTime: model.responseTimeMilliseconds == null
          ? null
          : Duration(milliseconds: model.responseTimeMilliseconds!),
      wasCorrect: model.wasCorrect,
      wasFirstAttempt: model.wasFirstAttempt,
      masteryAfterEvent: model.masteryAfterEvent,
    );
  }

  static StudyActivityModel activityToModel(StudyActivity entity) {
    return StudyActivityModel()
      ..activityId = entity.activityId
      ..userId = entity.userId
      ..topicId = entity.topicId
      ..type = entity.type.name
      ..occurredAt = entity.occurredAt.toUtc()
      ..durationMilliseconds = entity.duration.inMilliseconds
      ..responseTimeMilliseconds = entity.responseTime?.inMilliseconds
      ..wasCorrect = entity.wasCorrect
      ..wasFirstAttempt = entity.wasFirstAttempt
      ..masteryAfterEvent = entity.masteryAfterEvent;
  }

  static ReviewSchedule reviewToEntity(ReviewScheduleModel model) {
    return ReviewSchedule(
      userId: model.userId,
      topicId: model.topicId,
      dueAt: model.dueAt,
      lastReviewedAt: model.lastReviewedAt,
      intervalDays: model.intervalDays,
      easeFactor: model.easeFactor,
      repetitions: model.repetitions,
      lapses: model.lapses,
      urgency: ReviewUrgency.values.byName(model.urgency),
    );
  }

  static ReviewScheduleModel reviewToModel(ReviewSchedule entity) {
    return ReviewScheduleModel()
      ..recordKey = progressKey(entity.userId, entity.topicId)
      ..userId = entity.userId
      ..topicId = entity.topicId
      ..dueAt = entity.dueAt.toUtc()
      ..lastReviewedAt = entity.lastReviewedAt?.toUtc()
      ..intervalDays = entity.intervalDays
      ..easeFactor = entity.easeFactor
      ..repetitions = entity.repetitions
      ..lapses = entity.lapses
      ..urgency = entity.urgency.name;
  }

  static LearningGoal goalToEntity(LearningGoalModel model) {
    return LearningGoal(
      goalId: model.goalId,
      userId: model.userId,
      topicId: model.topicId,
      description: model.description,
      targetCompletionRate: model.targetCompletionRate,
      deadline: model.deadline,
      status: GoalStatus.values.byName(model.status),
      createdAt: model.createdAt,
    );
  }

  static LearningGoalModel goalToModel(LearningGoal entity) {
    return LearningGoalModel()
      ..goalId = entity.goalId
      ..userId = entity.userId
      ..topicId = entity.topicId
      ..description = entity.description
      ..targetCompletionRate = entity.targetCompletionRate
      ..deadline = entity.deadline.toUtc()
      ..status = entity.status.name
      ..createdAt = entity.createdAt.toUtc();
  }

  static String progressKey(String userId, String topicId) =>
      '$userId::$topicId';
}
