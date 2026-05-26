import 'package:isar_community/isar.dart';

import '../../../../core/database/database_exception.dart';
import '../models/user_profile_model.dart';

abstract interface class UserLocalDataSource {
  Stream<UserProfileModel?> watchProfile(String userId);

  Future<UserProfileModel?> findProfile(String userId);

  Future<void> upsertProfileAndQueue(
    UserProfileModel profile,
    UserSyncOperationModel operation,
  );

  Future<void> deleteProfileAndQueue(
    String userId,
    UserSyncOperationModel operation,
  );

  Future<List<UserSyncOperationModel>> findPendingOperations({
    required int limit,
  });

  Future<void> completeOperation(String operationId, String userId);

  Future<void> failOperation(
    String operationId, {
    required String errorMessage,
    required DateTime retryAt,
  });
}

final class IsarUserLocalDataSource implements UserLocalDataSource {
  IsarUserLocalDataSource(this._isar);

  final Isar _isar;

  @override
  Stream<UserProfileModel?> watchProfile(String userId) {
    return _isar.userProfileModels
        .filter()
        .userIdEqualTo(userId)
        .watch(fireImmediately: true)
        .map((items) => items.firstOrNull);
  }

  @override
  Future<UserProfileModel?> findProfile(String userId) async {
    try {
      return await _isar.userProfileModels
          .filter()
          .userIdEqualTo(userId)
          .findFirst();
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao consultar perfil local.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<void> upsertProfileAndQueue(
    UserProfileModel profile,
    UserSyncOperationModel operation,
  ) async {
    try {
      await _isar.writeTxn(() async {
        final current = await _isar.userProfileModels
            .filter()
            .userIdEqualTo(profile.userId)
            .findFirst();
        if (current != null) {
          profile.id = current.id;
        }
        profile.hasPendingData = true;
        await _isar.userProfileModels.put(profile);
        await _replacePendingUpsert(profile.userId, operation);
      });
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao persistir perfil local.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<void> deleteProfileAndQueue(
    String userId,
    UserSyncOperationModel operation,
  ) async {
    try {
      await _isar.writeTxn(() async {
        final profile = await _isar.userProfileModels
            .filter()
            .userIdEqualTo(userId)
            .findFirst();
        if (profile != null) {
          await _isar.userProfileModels.delete(profile.id);
        }
        final obsolete = await _isar.userSyncOperationModels
            .filter()
            .userIdEqualTo(userId)
            .findAll();
        await _isar.userSyncOperationModels.deleteAll(
          obsolete.map((item) => item.id).toList(),
        );
        await _isar.userSyncOperationModels.put(operation);
      });
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao remover perfil local.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<List<UserSyncOperationModel>> findPendingOperations({
    required int limit,
  }) async {
    try {
      return _isar.userSyncOperationModels
          .filter()
          .statusEqualTo('pending')
          .and()
          .group(
            (query) => query.nextAttemptAtIsNull().or().nextAttemptAtLessThan(
              DateTime.now().toUtc(),
            ),
          )
          .sortByCreatedAt()
          .limit(limit)
          .findAll();
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao consultar fila de sincronizacao.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<void> completeOperation(String operationId, String userId) async {
    try {
      await _isar.writeTxn(() async {
        final operation = await _isar.userSyncOperationModels
            .filter()
            .operationIdEqualTo(operationId)
            .findFirst();
        if (operation == null) {
          return;
        }
        await _isar.userSyncOperationModels.delete(operation.id);
        final remaining = await _isar.userSyncOperationModels
            .filter()
            .userIdEqualTo(userId)
            .count();
        final profile = await _isar.userProfileModels
            .filter()
            .userIdEqualTo(userId)
            .findFirst();
        if (profile != null) {
          profile
            ..hasPendingData = remaining > 0
            ..lastSynchronization = DateTime.now().toUtc();
          await _isar.userProfileModels.put(profile);
        }
      });
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao concluir operacao sincronizada.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<void> failOperation(
    String operationId, {
    required String errorMessage,
    required DateTime retryAt,
  }) async {
    try {
      await _isar.writeTxn(() async {
        final operation = await _isar.userSyncOperationModels
            .filter()
            .operationIdEqualTo(operationId)
            .findFirst();
        if (operation == null) {
          return;
        }
        operation
          ..status = 'pending'
          ..attempts += 1
          ..updatedAt = DateTime.now().toUtc()
          ..nextAttemptAt = retryAt.toUtc()
          ..errorMessage = errorMessage;
        await _isar.userSyncOperationModels.put(operation);
      });
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Falha ao reagendar operacao sincronizada.',
        error,
        stackTrace,
      );
    }
  }

  Future<void> _replacePendingUpsert(
    String userId,
    UserSyncOperationModel operation,
  ) async {
    final previousUpserts = await _isar.userSyncOperationModels
        .filter()
        .userIdEqualTo(userId)
        .and()
        .resourceTypeEqualTo('profile')
        .and()
        .typeEqualTo('upsert')
        .and()
        .statusEqualTo('pending')
        .findAll();
    await _isar.userSyncOperationModels.deleteAll(
      previousUpserts.map((item) => item.id).toList(),
    );
    await _isar.userSyncOperationModels.put(operation);
  }
}
