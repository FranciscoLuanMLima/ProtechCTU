import 'dart:async';
import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../../../core/database/database_exception.dart';
import '../../../../core/services/adaptive_learning_service.dart';
import '../../../../core/services/dashboard_analytics_service.dart';
import '../../domain/entities/learning_dashboard.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/learning_dashboard_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/learning_dashboard_local_datasource.dart';
import '../mappers/learning_dashboard_mapper.dart';
import '../models/learning_dashboard_model.dart';
import '../models/user_profile_model.dart';

final class LearningDashboardRepositoryImpl
    implements LearningDashboardRepository {
  LearningDashboardRepositoryImpl({
    required LearningDashboardLocalDataSource localDataSource,
    required UserRepository userRepository,
    required AdaptiveLearningService adaptiveLearningService,
    required DashboardAnalyticsService analyticsService,
    Uuid uuid = const Uuid(),
  }) : _localDataSource = localDataSource,
       _userRepository = userRepository,
       _adaptiveLearningService = adaptiveLearningService,
       _analyticsService = analyticsService,
       _uuid = uuid;

  final LearningDashboardLocalDataSource _localDataSource;
  final UserRepository _userRepository;
  final AdaptiveLearningService _adaptiveLearningService;
  final DashboardAnalyticsService _analyticsService;
  final Uuid _uuid;

  @override
  Stream<LearningDashboardSnapshot> watchDashboard(
    String userId, {
    DashboardFilters filters = const DashboardFilters(),
  }) {
    final controller = StreamController<void>();
    final subscriptions = <StreamSubscription<Object?>>[];
    controller.onListen = () {
      subscriptions.add(
        _localDataSource
            .watchDashboardChanges(userId)
            .listen((_) => controller.add(null), onError: controller.addError),
      );
      subscriptions.add(
        _userRepository
            .watchProfile(userId)
            .listen((_) => controller.add(null), onError: controller.addError),
      );
    };
    controller.onCancel = () async {
      for (final subscription in subscriptions) {
        await subscription.cancel();
      }
      await controller.close();
    };
    return controller.stream.asyncMap(
      (_) => getDashboard(userId, filters: filters),
    );
  }

  @override
  Future<LearningDashboardSnapshot> getDashboard(
    String userId, {
    DashboardFilters filters = const DashboardFilters(),
  }) async {
    if (userId.trim().isEmpty) {
      throw const DatabaseException(
        'O identificador do usuario e obrigatorio.',
      );
    }
    final results = await Future.wait<Object?>(<Future<Object?>>[
      _userRepository.getProfile(userId),
      _localDataSource.findTopics(),
      _localDataSource.findProgress(userId),
      _localDataSource.findActivities(
        userId,
        from: DateTime.now().toUtc().subtract(const Duration(days: 365)),
      ),
      _localDataSource.findReviews(userId),
      _localDataSource.findGoals(userId),
    ]);
    return _analyticsService.build(
      user: results[0] as UserProfile?,
      topics: (results[1] as List<LearningTopicModel>)
          .map(LearningDashboardMapper.topicToEntity)
          .toList(growable: false),
      progress: (results[2] as List<UserTopicProgressModel>)
          .map(LearningDashboardMapper.progressToEntity)
          .toList(growable: false),
      activities: (results[3] as List<StudyActivityModel>)
          .map(LearningDashboardMapper.activityToEntity)
          .toList(growable: false),
      reviews: (results[4] as List<ReviewScheduleModel>)
          .map(LearningDashboardMapper.reviewToEntity)
          .toList(growable: false),
      goals: (results[5] as List<LearningGoalModel>)
          .map(LearningDashboardMapper.goalToEntity)
          .toList(growable: false),
      filters: filters,
      now: DateTime.now().toUtc(),
    );
  }

  @override
  Future<void> saveTopicCatalog(List<LearningTopic> topics) async {
    _validateCatalog(topics);
    await _localDataSource.putTopics(
      topics.map(LearningDashboardMapper.topicToModel).toList(growable: false),
    );
  }

  @override
  Future<void> recordActivity(StudyActivity activity) async {
    _validateActivity(activity);
    if (await _localDataSource.findActivity(activity.activityId) != null) {
      return;
    }
    final topicModel = await _localDataSource.findTopic(activity.topicId);
    if (topicModel == null || !topicModel.isActive) {
      throw const DatabaseException('Assunto nao encontrado ou inativo.');
    }
    final topic = LearningDashboardMapper.topicToEntity(topicModel);
    final allProgress = await _localDataSource.findProgress(activity.userId);
    final completedTopicIds = allProgress
        .where((item) => item.status == TopicStatus.completed.name)
        .map((item) => item.topicId)
        .toSet();
    if (topic.prerequisiteTopicIds.any(
      (topicId) => !completedTopicIds.contains(topicId),
    )) {
      throw const DatabaseException(
        'O assunto ainda possui pre-requisitos nao concluidos.',
      );
    }
    final storedProgress = await _localDataSource.findTopicProgress(
      activity.userId,
      activity.topicId,
    );
    final storedReview = await _localDataSource.findReview(
      activity.userId,
      activity.topicId,
    );
    final current = storedProgress == null
        ? _initialProgress(
            activity.userId,
            activity.topicId,
            activity.occurredAt,
          )
        : LearningDashboardMapper.progressToEntity(storedProgress);
    final result = _adaptiveLearningService.apply(
      topic: topic,
      current: current,
      activity: activity,
      currentReview: storedReview == null
          ? null
          : LearningDashboardMapper.reviewToEntity(storedReview),
    );
    final persistedActivity = StudyActivity(
      activityId: activity.activityId,
      userId: activity.userId,
      topicId: activity.topicId,
      type: activity.type,
      occurredAt: activity.occurredAt,
      duration: activity.duration,
      responseTime: activity.responseTime,
      wasCorrect: activity.wasCorrect,
      wasFirstAttempt: activity.wasFirstAttempt,
      masteryAfterEvent: result.progress.masteryRate,
    );
    final progressModel = LearningDashboardMapper.progressToModel(
      result.progress,
    );
    final reviewModel = LearningDashboardMapper.reviewToModel(result.review);
    final activityModel = LearningDashboardMapper.activityToModel(
      persistedActivity,
    );
    await _localDataSource.putActivityState(
      progress: progressModel,
      activity: activityModel,
      review: reviewModel,
      operation: _operation(
        userId: activity.userId,
        resourceType: 'topicProgress',
        resourceKey: progressModel.recordKey,
        payload: <String, dynamic>{
          'progress': _progressPayload(progressModel),
          'review': _reviewPayload(reviewModel),
          'latestActivity': _activityPayload(activityModel),
        },
      ),
    );
  }

  @override
  Future<void> saveGoal(LearningGoal goal) async {
    if (goal.goalId.trim().isEmpty ||
        goal.userId.trim().isEmpty ||
        goal.description.trim().isEmpty ||
        goal.targetCompletionRate <= 0 ||
        goal.targetCompletionRate > 1) {
      throw const DatabaseException('Meta educacional invalida.');
    }
    final model = LearningDashboardMapper.goalToModel(goal);
    await _localDataSource.putGoal(
      model,
      _operation(
        userId: goal.userId,
        resourceType: 'learningGoal',
        resourceKey: goal.goalId,
        payload: _goalPayload(model),
      ),
    );
  }

  UserSyncOperationModel _operation({
    required String userId,
    required String resourceType,
    required String resourceKey,
    required Map<String, dynamic> payload,
  }) {
    final now = DateTime.now().toUtc();
    return UserSyncOperationModel()
      ..operationId = _uuid.v4()
      ..userId = userId
      ..resourceType = resourceType
      ..resourceKey = resourceKey
      ..type = SyncOperationType.upsert.name
      ..status = SyncOperationStatus.pending.name
      ..payloadJson = jsonEncode(payload)
      ..createdAt = now
      ..updatedAt = now;
  }

  void _validateCatalog(List<LearningTopic> topics) {
    final identifiers = <String>{};
    for (final topic in topics) {
      if (topic.topicId.trim().isEmpty ||
          topic.name.trim().isEmpty ||
          topic.totalExercises < 0 ||
          !identifiers.add(topic.topicId)) {
        throw const DatabaseException('Catalogo de assuntos invalido.');
      }
    }
    for (final topic in topics) {
      if (topic.prerequisiteTopicIds.any(
        (requiredId) =>
            requiredId == topic.topicId || !identifiers.contains(requiredId),
      )) {
        throw const DatabaseException(
          'Pre-requisito de assunto invalido ou inexistente.',
        );
      }
      _assertNoCycle(topic.topicId, topics, <String>{});
    }
  }

  void _assertNoCycle(
    String topicId,
    List<LearningTopic> topics,
    Set<String> path,
  ) {
    if (!path.add(topicId)) {
      throw const DatabaseException('Ciclo detectado na trilha de assuntos.');
    }
    final topic = topics.firstWhere((item) => item.topicId == topicId);
    for (final prerequisite in topic.prerequisiteTopicIds) {
      _assertNoCycle(prerequisite, topics, <String>{...path});
    }
  }

  void _validateActivity(StudyActivity activity) {
    if (activity.activityId.trim().isEmpty ||
        activity.userId.trim().isEmpty ||
        activity.topicId.trim().isEmpty ||
        activity.duration.isNegative ||
        (activity.responseTime?.isNegative ?? false)) {
      throw const DatabaseException('Evento de aprendizagem invalido.');
    }
  }

  TopicLearningProgress _initialProgress(
    String userId,
    String topicId,
    DateTime now,
  ) {
    return TopicLearningProgress(
      userId: userId,
      topicId: topicId,
      status: TopicStatus.notStarted,
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
      updatedAt: now.toUtc(),
    );
  }

  Map<String, dynamic> _progressPayload(UserTopicProgressModel model) =>
      <String, dynamic>{
        'userId': model.userId,
        'topicId': model.topicId,
        'status': model.status,
        'completionRate': model.completionRate,
        'masteryRate': model.masteryRate,
        'completedExercises': model.completedExercises,
        'totalAttempts': model.totalAttempts,
        'correctAttempts': model.correctAttempts,
        'updatedAt': model.updatedAt.toIso8601String(),
      };

  Map<String, dynamic> _reviewPayload(ReviewScheduleModel model) =>
      <String, dynamic>{
        'userId': model.userId,
        'topicId': model.topicId,
        'dueAt': model.dueAt.toIso8601String(),
        'intervalDays': model.intervalDays,
        'easeFactor': model.easeFactor,
        'repetitions': model.repetitions,
        'lapses': model.lapses,
        'urgency': model.urgency,
      };

  Map<String, dynamic> _activityPayload(StudyActivityModel model) =>
      <String, dynamic>{
        'activityId': model.activityId,
        'topicId': model.topicId,
        'type': model.type,
        'occurredAt': model.occurredAt.toIso8601String(),
        'durationMilliseconds': model.durationMilliseconds,
        'wasCorrect': model.wasCorrect,
        'masteryAfterEvent': model.masteryAfterEvent,
      };

  Map<String, dynamic> _goalPayload(LearningGoalModel model) =>
      <String, dynamic>{
        'goalId': model.goalId,
        'topicId': model.topicId,
        'description': model.description,
        'targetCompletionRate': model.targetCompletionRate,
        'deadline': model.deadline.toIso8601String(),
        'status': model.status,
      };
}
