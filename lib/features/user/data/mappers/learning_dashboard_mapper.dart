import 'dart:convert';

import '../../domain/entities/learning_dashboard.dart';
import '../models/learning_dashboard_model.dart';

abstract final class LearningDashboardMapper {
  static LearningTopic topicToEntity(LearningTopicModel model) {
    return LearningTopic(
      topicId: model.topicId,
      name: model.name,
      description: model.description,
      category: model.category,
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
      theory: _decodeList(model.theoryJson)
          .map(
            (item) => TopicTheorySection(
              title: item['title'] as String,
              explanation: item['explanation'] as String,
              exampleCode: item['exampleCode'] as String,
            ),
          )
          .toList(growable: false),
      exercises: _decodeList(model.exercisesJson)
          .map(
            (item) => TopicExercise(
              exerciseId: item['exerciseId'] as String,
              statement: item['statement'] as String,
              difficulty: TopicDifficulty.values.byName(
                item['difficulty'] as String,
              ),
              expectedAnswer: item['expectedAnswer'] as String,
              explanation: item['explanation'] as String,
            ),
          )
          .toList(growable: false),
      challenges: _decodeList(model.challengesJson)
          .map(
            (item) => TopicChallenge(
              challengeId: item['challengeId'] as String,
              title: item['title'] as String,
              requirement: item['requirement'] as String,
              difficulty: TopicDifficulty.values.byName(
                item['difficulty'] as String,
              ),
              xpBonus: item['xpBonus'] as int,
            ),
          )
          .toList(growable: false),
      badges: _decodeList(model.badgesJson)
          .map(
            (item) => TopicBadge(
              badgeId: item['badgeId'] as String,
              name: item['name'] as String,
              requiredMasteryRate: (item['requiredMasteryRate'] as num)
                  .toDouble(),
            ),
          )
          .toList(growable: false),
      isActive: model.isActive,
    );
  }

  static LearningTopicModel topicToModel(LearningTopic entity) {
    return LearningTopicModel()
      ..topicId = entity.topicId
      ..name = entity.name
      ..description = entity.description
      ..category = entity.category
      ..parentTopicId = entity.parentTopicId
      ..prerequisiteTopicIds = List<String>.from(entity.prerequisiteTopicIds)
      ..contentTypes = entity.contentTypes.map((item) => item.name).toList()
      ..difficulty = entity.difficulty.name
      ..order = entity.order
      ..totalExercises = entity.totalExercises
      ..xpReward = entity.xpReward
      ..coinReward = entity.coinReward
      ..theoryJson = jsonEncode(
        entity.theory
            .map(
              (item) => <String, Object>{
                'title': item.title,
                'explanation': item.explanation,
                'exampleCode': item.exampleCode,
              },
            )
            .toList(growable: false),
      )
      ..exercisesJson = jsonEncode(
        entity.exercises
            .map(
              (item) => <String, Object>{
                'exerciseId': item.exerciseId,
                'statement': item.statement,
                'difficulty': item.difficulty.name,
                'expectedAnswer': item.expectedAnswer,
                'explanation': item.explanation,
              },
            )
            .toList(growable: false),
      )
      ..challengesJson = jsonEncode(
        entity.challenges
            .map(
              (item) => <String, Object>{
                'challengeId': item.challengeId,
                'title': item.title,
                'requirement': item.requirement,
                'difficulty': item.difficulty.name,
                'xpBonus': item.xpBonus,
              },
            )
            .toList(growable: false),
      )
      ..badgesJson = jsonEncode(
        entity.badges
            .map(
              (item) => <String, Object>{
                'badgeId': item.badgeId,
                'name': item.name,
                'requiredMasteryRate': item.requiredMasteryRate,
              },
            )
            .toList(growable: false),
      )
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

  static List<Map<String, dynamic>> _decodeList(String value) {
    return (jsonDecode(value) as List<Object?>).cast<Map<String, dynamic>>();
  }
}
