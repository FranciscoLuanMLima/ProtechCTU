import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/storage_keys.dart';
import '../database/database_exception.dart';

final class CacheSnapshot {
  const CacheSnapshot({required this.payload, required this.cachedAt});

  final Map<String, dynamic> payload;
  final DateTime cachedAt;

  bool isFresh(Duration ttl, DateTime now) => now.difference(cachedAt) <= ttl;
}

final class UserCacheService {
  UserCacheService(this._preferences);

  final SharedPreferencesAsync _preferences;

  Future<void> writeProfile(String userId, Map<String, dynamic> payload) async {
    try {
      final now = DateTime.now().toUtc();
      await _preferences.setString(
        '${StorageKeys.profileCachePrefix}$userId',
        jsonEncode(payload),
      );
      await _preferences.setString(
        '${StorageKeys.profileCacheTimestampPrefix}$userId',
        now.toIso8601String(),
      );
      await _preferences.setString(StorageKeys.activeUserId, userId);
    } catch (error, stackTrace) {
      throw CacheException(
        'Falha ao gravar cache do perfil.',
        error,
        stackTrace,
      );
    }
  }

  Future<CacheSnapshot?> readProfile(String userId) async {
    try {
      final raw = await _preferences.getString(
        '${StorageKeys.profileCachePrefix}$userId',
      );
      final timestamp = await _preferences.getString(
        '${StorageKeys.profileCacheTimestampPrefix}$userId',
      );
      if (raw == null || timestamp == null) {
        return null;
      }
      return CacheSnapshot(
        payload: (jsonDecode(raw) as Map<Object?, Object?>)
            .cast<String, dynamic>(),
        cachedAt: DateTime.parse(timestamp).toUtc(),
      );
    } catch (error, stackTrace) {
      throw CacheException('Falha ao ler cache do perfil.', error, stackTrace);
    }
  }

  Future<String?> readActiveUserId() =>
      _preferences.getString(StorageKeys.activeUserId);

  Future<void> invalidateProfile(String userId) async {
    await _preferences.remove('${StorageKeys.profileCachePrefix}$userId');
    await _preferences.remove(
      '${StorageKeys.profileCacheTimestampPrefix}$userId',
    );
  }
}
