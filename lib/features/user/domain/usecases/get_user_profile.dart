import '../entities/user_profile.dart';
import '../repositories/user_repository.dart';

final class GetUserProfile {
  const GetUserProfile(this._repository);

  final UserRepository _repository;

  Future<UserProfile?> call(String userId) => _repository.getProfile(userId);
}
