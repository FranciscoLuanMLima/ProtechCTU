import '../entities/user_profile.dart';
import '../repositories/user_repository.dart';

final class RestoreUserBackup {
  const RestoreUserBackup(this._repository);

  final UserRepository _repository;

  Future<List<UserProfile>> available(String userId) {
    return _repository.listBackups(userId);
  }

  Future<void> call(UserProfile backup) => _repository.restoreBackup(backup);
}
