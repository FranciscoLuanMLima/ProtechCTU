import 'dart:async';

import 'package:isar_community/isar.dart';

import '../../../../core/database/database_exception.dart';
import '../models/learning_dashboard_model.dart';
import '../models/user_profile_model.dart';

abstract interface class LearningDashboardLocalDataSource {
  Stream<void> watchDashboardChanges(String userId);

  Future<List<LearningTopicModel>> findTopics();

  Future<LearningTopicModel?> findTopic(String topicId);

  Future<List<UserTopicProgressModel>> findProgress(String userId);

  Future<UserTopicProgressModel?> findTopicProgress(
    String userId,
    String topicId,
  );

  Future<List<StudyActivityModel>> findActivities(
    String userId, {
    required DateTime from,
  });

  Future<List<ReviewScheduleModel>> findReviews(String userId);

  Future<ReviewScheduleModel?> findReview(String userId, String topicId);

  Future<List<LearningGoalModel>> findGoals(String userId);

  Future<void> putTopics(List<LearningTopicModel> topics);

  Future<void> putActivityState({
    required UserTopicProgressModel progress,
    required StudyActivityModel activity,
    required ReviewScheduleModel review,
    required UserSyncOperationModel operation,
  });

  Future<void> putGoal(
    LearningGoalModel goal,
    UserSyncOperationModel operation,
  );

  Future<StudyActivityModel?> findActivity(String activityId);
}

final class IsarLearningDashboardLocalDataSource
    implements LearningDashboardLocalDataSource {
  IsarLearningDashboardLocalDataSource(this._isar);

  final Isar _isar;

  @override
  Stream<void> watchDashboardChanges(String userId) {
    final controller = StreamController<void>();
    final subscriptions = <StreamSubscription<void>>[];
    controller.onListen = () {
      subscriptions.addAll(<StreamSubscription<void>>[
        _isar.learningTopicModels
            .watchLazy(fireImmediately: true)
            .listen((_) => controller.add(null), onError: controller.addError),
        _isar.userTopicProgressModels
            .filter()
            .userIdEqualTo(userId)
            .watchLazy(fireImmediately: true)
            .listen((_) => controller.add(null), onError: controller.addError),
        _isar.studyActivityModels
            .filter()
            .userIdEqualTo(userId)
            .watchLazy(fireImmediately: true)
            .listen((_) => controller.add(null), onError: controller.addError),
        _isar.reviewScheduleModels
            .filter()
            .userIdEqualTo(userId)
            .watchLazy(fireImmediately: true)
            .listen((_) => controller.add(null), onError: controller.addError),
        _isar.learningGoalModels
            .filter()
            .userIdEqualTo(userId)
            .watchLazy(fireImmediately: true)
            .listen((_) => controller.add(null), onError: controller.addError),
      ]);
    };
    controller.onCancel = () async {
      for (final subscription in subscriptions) {
        await subscription.cancel();
      }
      await controller.close();
    };
    return controller.stream;
  }

  @override
  Future<List<LearningTopicModel>> findTopics() async {
    try {
      return _isar.learningTopicModels
          .filter()
          .isActiveEqualTo(true)
          .sortByOrder()
          .findAll();
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao consultar assuntos.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<List<UserTopicProgressModel>> findProgress(String userId) async {
    try {
      return _isar.userTopicProgressModels
          .filter()
          .userIdEqualTo(userId)
          .findAll();
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao consultar progresso por assunto.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<LearningTopicModel?> findTopic(String topicId) async {
    try {
      return _isar.learningTopicModels
          .filter()
          .topicIdEqualTo(topicId)
          .findFirst();
    } catch (error, stackTrace) {
      throw DatabaseException('Falha ao consultar assunto.', error, stackTrace);
    }
  }

  @override
  Future<UserTopicProgressModel?> findTopicProgress(
    String userId,
    String topicId,
  ) async {
    try {
      return _isar.userTopicProgressModels
          .filter()
          .recordKeyEqualTo('$userId::$topicId')
          .findFirst();
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao consultar progresso do assunto.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<List<StudyActivityModel>> findActivities(
    String userId, {
    required DateTime from,
  }) async {
    try {
      return _isar.studyActivityModels
          .filter()
          .userIdEqualTo(userId)
          .and()
          .occurredAtGreaterThan(from)
          .sortByOccurredAtDesc()
          .findAll();
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao consultar historico de atividade.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<StudyActivityModel?> findActivity(String activityId) async {
    try {
      return _isar.studyActivityModels
          .filter()
          .activityIdEqualTo(activityId)
          .findFirst();
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao consultar evento de atividade.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<List<ReviewScheduleModel>> findReviews(String userId) async {
    try {
      return _isar.reviewScheduleModels
          .filter()
          .userIdEqualTo(userId)
          .sortByDueAt()
          .findAll();
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao consultar agenda de revisao.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<ReviewScheduleModel?> findReview(String userId, String topicId) async {
    try {
      return _isar.reviewScheduleModels
          .filter()
          .recordKeyEqualTo('$userId::$topicId')
          .findFirst();
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao consultar revisao do assunto.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<List<LearningGoalModel>> findGoals(String userId) async {
    try {
      return _isar.learningGoalModels
          .filter()
          .userIdEqualTo(userId)
          .and()
          .statusEqualTo('active')
          .sortByDeadline()
          .findAll();
    } catch (error, stackTrace) {
      throw DatabaseException('Falha ao consultar metas.', error, stackTrace);
    }
  }

  @override
  Future<void> putTopics(List<LearningTopicModel> topics) async {
    try {
      await _isar.writeTxn(() => _isar.learningTopicModels.putAll(topics));
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao persistir catalogo de assuntos.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<void> putActivityState({
    required UserTopicProgressModel progress,
    required StudyActivityModel activity,
    required ReviewScheduleModel review,
    required UserSyncOperationModel operation,
  }) async {
    try {
      await _isar.writeTxn(() async {
        final storedProgress = await _isar.userTopicProgressModels
            .filter()
            .recordKeyEqualTo(progress.recordKey)
            .findFirst();
        final storedReview = await _isar.reviewScheduleModels
            .filter()
            .recordKeyEqualTo(review.recordKey)
            .findFirst();
        if (storedProgress != null) {
          progress.id = storedProgress.id;
        }
        if (storedReview != null) {
          review.id = storedReview.id;
        }
        await _isar.userTopicProgressModels.put(progress);
        await _isar.studyActivityModels.put(activity);
        await _isar.reviewScheduleModels.put(review);
        await _replacePendingOperation(operation);
      });
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao registrar atividade do assunto.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<void> putGoal(
    LearningGoalModel goal,
    UserSyncOperationModel operation,
  ) async {
    try {
      await _isar.writeTxn(() async {
        final stored = await _isar.learningGoalModels
            .filter()
            .goalIdEqualTo(goal.goalId)
            .findFirst();
        if (stored != null) {
          goal.id = stored.id;
        }
        await _isar.learningGoalModels.put(goal);
        await _replacePendingOperation(operation);
      });
    } catch (error, stackTrace) {
      throw DatabaseException('Falha ao persistir meta.', error, stackTrace);
    }
  }

  Future<void> _replacePendingOperation(
    UserSyncOperationModel operation,
  ) async {
    final obsolete = await _isar.userSyncOperationModels
        .filter()
        .userIdEqualTo(operation.userId)
        .and()
        .resourceTypeEqualTo(operation.resourceType)
        .and()
        .resourceKeyEqualTo(operation.resourceKey)
        .and()
        .statusEqualTo('pending')
        .findAll();
    await _isar.userSyncOperationModels.deleteAll(
      obsolete.map((item) => item.id).toList(),
    );
    await _isar.userSyncOperationModels.put(operation);
  }
}
