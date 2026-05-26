import '../../features/user/data/datasources/user_remote_datasource.dart';
import '../../features/user/domain/repositories/user_repository.dart';
import '../database/database_exception.dart';

final class UserSyncResult {
  const UserSyncResult({required this.synchronized, required this.failed});

  final int synchronized;
  final int failed;
}

final class UserSyncService {
  UserSyncService(this._repository, this._remoteDataSource);

  final UserRepository _repository;
  final UserRemoteDataSource _remoteDataSource;

  Future<UserSyncResult> synchronizePending({int batchSize = 50}) async {
    var synchronized = 0;
    var failed = 0;
    final operations = await _repository.pendingSynchronizationOperations(
      limit: batchSize,
    );
    for (final operation in operations) {
      try {
        await _remoteDataSource.pushOperation(operation);
        await _repository.completeSynchronization(
          operation.operationId,
          operation.userId,
        );
        synchronized++;
      } catch (error, stackTrace) {
        failed++;
        final retryAt = DateTime.now().toUtc().add(
          Duration(minutes: _retryDelayMinutes(operation.attempts + 1)),
        );
        await _repository.failSynchronization(
          operation.operationId,
          errorMessage: error.toString(),
          retryAt: retryAt,
        );
        if (error is DataLayerException) {
          Error.throwWithStackTrace(error, stackTrace);
        }
      }
    }
    return UserSyncResult(synchronized: synchronized, failed: failed);
  }

  int _retryDelayMinutes(int attempts) {
    final exponential = 1 << attempts.clamp(0, 8);
    return exponential.clamp(2, 360);
  }
}
