import 'package:isar_community/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/user/data/models/user_profile_model.dart';
import '../../features/user/data/models/learning_dashboard_model.dart';
import '../constants/storage_keys.dart';
import '../database/database_exception.dart';
import 'backup_service.dart';

final class DatabaseMigrationService {
  DatabaseMigrationService(this._isar, this._preferences, this._backupService);

  final Isar _isar;
  final SharedPreferencesAsync _preferences;
  final UserBackupService _backupService;

  Future<void> migrate() async {
    final storedVersion =
        await _preferences.getInt(StorageKeys.schemaVersionKey) ?? 0;
    if (storedVersion > StorageKeys.schemaVersion) {
      throw const DatabaseException(
        'Versao local de dados e mais recente que a suportada pelo aplicativo.',
      );
    }
    if (storedVersion < 1) {
      await _migrateToVersion1();
    }
    if (storedVersion < 2) {
      await _migrateToVersion2();
    }
    if (storedVersion < 3) {
      await _migrateToVersion3();
    }
    await _preferences.setInt(
      StorageKeys.schemaVersionKey,
      StorageKeys.schemaVersion,
    );
  }

  Future<void> _migrateToVersion1() async {
    final profiles = await _isar.userProfileModels.where().findAll();
    for (final profile in profiles) {
      await _backupService.createSnapshot(profile, reason: 'migration_v1');
    }
    await _isar.writeTxn(() async {
      for (final profile in profiles) {
        profile
          ..localDataVersion = 1
          ..localBackupEnabled = true;
        await _isar.userProfileModels.put(profile);
      }
    });
  }

  Future<void> _migrateToVersion2() async {
    final profiles = await _isar.userProfileModels.where().findAll();
    for (final profile in profiles) {
      await _backupService.createSnapshot(profile, reason: 'migration_v2');
    }
    await _isar.writeTxn(() async {
      for (final profile in profiles) {
        for (final topic in profile.topicProgress) {
          final recordKey = '${profile.userId}::${topic.topicId}';
          final existing = await _isar.userTopicProgressModels
              .filter()
              .recordKeyEqualTo(recordKey)
              .findFirst();
          if (existing != null) {
            continue;
          }
          final model = UserTopicProgressModel()
            ..recordKey = recordKey
            ..userId = profile.userId
            ..topicId = topic.topicId
            ..status = topic.progress >= 1 ? 'completed' : 'inProgress'
            ..completionRate = topic.progress
            ..masteryRate = topic.progress
            ..previousMasteryRate = topic.progress
            ..updatedAt = topic.updatedAt.toUtc();
          await _isar.userTopicProgressModels.put(model);
        }
        profile.localDataVersion = StorageKeys.schemaVersion;
        await _isar.userProfileModels.put(profile);
      }
    });
  }

  Future<void> _migrateToVersion3() async {
    final profiles = await _isar.userProfileModels.where().findAll();
    await _isar.writeTxn(() async {
      for (final profile in profiles) {
        profile.localDataVersion = StorageKeys.schemaVersion;
        await _isar.userProfileModels.put(profile);
      }
    });
  }
}
