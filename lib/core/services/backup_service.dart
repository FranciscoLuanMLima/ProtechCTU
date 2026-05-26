import 'package:isar_community/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/user/data/models/user_profile_model.dart';
import '../constants/storage_keys.dart';
import '../database/database_exception.dart';

final class UserBackupService {
  UserBackupService(this._isar, this._preferences);

  static const int _maximumSnapshotsPerUser = 10;

  final Isar _isar;
  final SharedPreferencesAsync _preferences;

  Future<void> createSnapshot(
    UserProfileModel profile, {
    required String reason,
  }) async {
    try {
      final snapshot = UserBackupModel()
        ..userId = profile.userId
        ..createdAt = DateTime.now().toUtc()
        ..localDataVersion = profile.localDataVersion
        ..reason = reason
        ..payloadJson = profile.toJson();
      await _isar.writeTxn(() async {
        await _isar.userBackupModels.put(snapshot);
        final excess = await _isar.userBackupModels
            .filter()
            .userIdEqualTo(profile.userId)
            .sortByCreatedAtDesc()
            .offset(_maximumSnapshotsPerUser)
            .findAll();
        await _isar.userBackupModels.deleteAll(
          excess.map((entry) => entry.id).toList(),
        );
      });
      await _preferences.setString(
        StorageKeys.lastBackupAt,
        snapshot.createdAt.toIso8601String(),
      );
    } catch (error, stackTrace) {
      throw BackupException('Falha ao gerar backup local.', error, stackTrace);
    }
  }

  Future<List<UserProfileModel>> listRestorableProfiles(String userId) async {
    try {
      final snapshots = await _isar.userBackupModels
          .filter()
          .userIdEqualTo(userId)
          .sortByCreatedAtDesc()
          .findAll();
      return snapshots
          .map((snapshot) => UserProfileModel.fromJson(snapshot.payloadJson))
          .toList(growable: false);
    } catch (error, stackTrace) {
      throw BackupException('Falha ao ler backups locais.', error, stackTrace);
    }
  }
}
