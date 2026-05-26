import '../entities/user_profile.dart';

abstract interface class UserRepository {
  Stream<UserProfile?> watchProfile(String userId);

  Future<UserProfile?> getProfile(String userId);

  Future<UserProfile?> getCachedProfile(
    String userId, {
    Duration maxAge = const Duration(minutes: 5),
  });

  Future<void> saveProfile(UserProfile profile);

  Future<void> deleteProfile(String userId);

  Future<List<UserProfile>> listBackups(String userId);

  Future<void> restoreBackup(UserProfile backup);

  Future<List<UserSyncOperation>> pendingSynchronizationOperations({
    int limit = 50,
  });

  Future<void> completeSynchronization(String operationId, String userId);

  Future<void> failSynchronization(
    String operationId, {
    required String errorMessage,
    required DateTime retryAt,
  });
}
