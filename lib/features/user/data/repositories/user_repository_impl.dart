import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../../../core/database/database_exception.dart';
import '../../../../core/services/backup_service.dart';
import '../../../../core/services/cache_service.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_datasource.dart';
import '../mappers/user_profile_mapper.dart';
import '../models/user_profile_model.dart';

final class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required UserLocalDataSource localDataSource,
    required UserCacheService cache,
    required UserBackupService backupService,
    Uuid uuid = const Uuid(),
  }) : _localDataSource = localDataSource,
       _cache = cache,
       _backupService = backupService,
       _uuid = uuid;

  final UserLocalDataSource _localDataSource;
  final UserCacheService _cache;
  final UserBackupService _backupService;
  final Uuid _uuid;

  @override
  Stream<UserProfile?> watchProfile(String userId) {
    return _localDataSource.watchProfile(userId).asyncMap((model) async {
      if (model == null) {
        return null;
      }
      await _cache.writeProfile(userId, model.toMap());
      return UserProfileMapper.toEntity(model);
    });
  }

  @override
  Future<UserProfile?> getProfile(String userId) async {
    final model = await _localDataSource.findProfile(userId);
    if (model == null) {
      return null;
    }
    await _cache.writeProfile(userId, model.toMap());
    return UserProfileMapper.toEntity(model);
  }

  @override
  Future<UserProfile?> getCachedProfile(
    String userId, {
    Duration maxAge = const Duration(minutes: 5),
  }) async {
    final snapshot = await _cache.readProfile(userId);
    if (snapshot == null || !snapshot.isFresh(maxAge, DateTime.now().toUtc())) {
      return null;
    }
    return UserProfileMapper.toEntity(
      UserProfileModel.fromMap(snapshot.payload),
    );
  }

  @override
  Future<void> saveProfile(UserProfile profile) async {
    _validate(profile);
    final now = DateTime.now().toUtc();
    final persisted = profile.copyWith(
      updatedAt: now,
      synchronization: profile.synchronization.copyWith(hasPendingData: true),
    );
    final model = UserProfileMapper.toModel(persisted);
    final current = await _localDataSource.findProfile(profile.userId);
    if (current != null && profile.synchronization.localBackupEnabled) {
      await _backupService.createSnapshot(current, reason: 'before_update');
    }
    final operation = UserSyncOperationModel()
      ..operationId = _uuid.v4()
      ..userId = persisted.userId
      ..resourceType = 'profile'
      ..resourceKey = persisted.userId
      ..type = SyncOperationType.upsert.name
      ..status = SyncOperationStatus.pending.name
      ..payloadJson = model.toJson()
      ..createdAt = now
      ..updatedAt = now;
    await _localDataSource.upsertProfileAndQueue(model, operation);
    await _cache.writeProfile(persisted.userId, model.toMap());
  }

  @override
  Future<void> deleteProfile(String userId) async {
    if (userId.trim().isEmpty) {
      throw const DatabaseException(
        'O identificador do usuario e obrigatorio.',
      );
    }
    final now = DateTime.now().toUtc();
    final operation = UserSyncOperationModel()
      ..operationId = _uuid.v4()
      ..userId = userId
      ..resourceType = 'profile'
      ..resourceKey = userId
      ..type = SyncOperationType.delete.name
      ..status = SyncOperationStatus.pending.name
      ..payloadJson = jsonEncode(<String, String>{'userId': userId})
      ..createdAt = now
      ..updatedAt = now;
    await _localDataSource.deleteProfileAndQueue(userId, operation);
    await _cache.invalidateProfile(userId);
  }

  @override
  Future<List<UserProfile>> listBackups(String userId) async {
    final profiles = await _backupService.listRestorableProfiles(userId);
    return profiles.map(UserProfileMapper.toEntity).toList(growable: false);
  }

  @override
  Future<void> restoreBackup(UserProfile backup) {
    return saveProfile(
      backup.copyWith(
        synchronization: backup.synchronization.copyWith(hasPendingData: true),
      ),
    );
  }

  @override
  Future<List<UserSyncOperation>> pendingSynchronizationOperations({
    int limit = 50,
  }) async {
    if (limit < 1 || limit > 500) {
      throw const DatabaseException(
        'Limite da fila de sync fora do intervalo.',
      );
    }
    final operations = await _localDataSource.findPendingOperations(
      limit: limit,
    );
    return operations
        .map(UserProfileMapper.toSyncEntity)
        .toList(growable: false);
  }

  @override
  Future<void> completeSynchronization(String operationId, String userId) {
    return _localDataSource.completeOperation(operationId, userId);
  }

  @override
  Future<void> failSynchronization(
    String operationId, {
    required String errorMessage,
    required DateTime retryAt,
  }) {
    return _localDataSource.failOperation(
      operationId,
      errorMessage: errorMessage,
      retryAt: retryAt,
    );
  }

  void _validate(UserProfile profile) {
    if (profile.userId.trim().isEmpty ||
        profile.identification.registration.trim().isEmpty ||
        profile.identification.name.trim().isEmpty) {
      throw const DatabaseException(
        'Identificacao do usuario esta incompleta.',
      );
    }
    if (profile.progression.level < 1 ||
        profile.progression.currentXp < 0 ||
        profile.progression.totalXp < 0 ||
        profile.economy.coins < 0 ||
        profile.economy.gems < 0) {
      throw const DatabaseException(
        'Progressao ou economia contem valores invalidos.',
      );
    }
    if (profile.statistics.accuracyRate < 0 ||
        profile.statistics.accuracyRate > 1 ||
        profile.adaptivity.topicProgress.any(
          (topic) => topic.progress < 0 || topic.progress > 1,
        )) {
      throw const DatabaseException(
        'Metricas de desempenho fora do intervalo.',
      );
    }
  }
}
