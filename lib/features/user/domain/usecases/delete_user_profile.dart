import '../repositories/user_repository.dart';

final class DeleteUserProfile {
  const DeleteUserProfile(this._repository);

  final UserRepository _repository;

  Future<void> call(String userId) => _repository.deleteProfile(userId);
}
