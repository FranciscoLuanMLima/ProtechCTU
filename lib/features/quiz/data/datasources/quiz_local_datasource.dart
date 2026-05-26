import 'dart:convert';

import 'package:isar_community/isar.dart';

import '../../../../core/database/database_exception.dart';
import '../../../user/data/models/user_profile_model.dart';
import '../models/quiz_attempt_model.dart';

abstract interface class QuizLocalDataSource {
  Future<List<QuizAttemptModel>> findAttempts(String userId);

  Future<void> saveAttemptAndProfile({
    required QuizAttemptModel attempt,
    required UserProfileModel profile,
    required UserSyncOperationModel attemptOperation,
    required UserSyncOperationModel profileOperation,
  });
}

final class IsarQuizLocalDataSource implements QuizLocalDataSource {
  IsarQuizLocalDataSource(this._isar);

  final Isar _isar;

  @override
  Future<List<QuizAttemptModel>> findAttempts(String userId) async {
    try {
      return _isar.quizAttemptModels
          .filter()
          .userIdEqualTo(userId)
          .sortByCompletedAtDesc()
          .findAll();
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao consultar tentativas de quiz.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<void> saveAttemptAndProfile({
    required QuizAttemptModel attempt,
    required UserProfileModel profile,
    required UserSyncOperationModel attemptOperation,
    required UserSyncOperationModel profileOperation,
  }) async {
    try {
      await _isar.writeTxn(() async {
        final currentProfile = await _isar.userProfileModels
            .filter()
            .userIdEqualTo(profile.userId)
            .findFirst();
        if (currentProfile != null) {
          profile.id = currentProfile.id;
        }
        profile.hasPendingData = true;
        await _isar.quizAttemptModels.put(attempt);
        await _isar.userProfileModels.put(profile);
        await _replacePendingOperation(attemptOperation);
        await _replacePendingOperation(profileOperation);
      });
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao salvar resultado e recompensas do quiz.',
        error,
        stackTrace,
      );
    }
  }

  Future<void> _replacePendingOperation(
    UserSyncOperationModel operation,
  ) async {
    final pending = await _isar.userSyncOperationModels
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
      pending.map((entry) => entry.id).toList(),
    );
    if (operation.resourceType == 'quizAttempt') {
      operation.payloadJson = jsonEncode(<String, dynamic>{
        ...jsonDecode(operation.payloadJson) as Map<String, dynamic>,
        'syncStrategy': 'append_only',
      });
    }
    await _isar.userSyncOperationModels.put(operation);
  }
}
