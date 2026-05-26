abstract final class StorageKeys {
  static const String databaseName = 'protech_user_data';
  static const int schemaVersion = 2;

  static const String activeUserId = 'user.active_id';
  static const String profileCachePrefix = 'user.profile_cache.';
  static const String profileCacheTimestampPrefix = 'user.profile_cache_at.';
  static const String schemaVersionKey = 'database.schema_version';
  static const String lastBackupAt = 'database.last_backup_at';
}
