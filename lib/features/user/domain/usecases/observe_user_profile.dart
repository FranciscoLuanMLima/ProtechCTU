import '../entities/user_profile.dart';
import '../repositories/user_repository.dart';

final class ObserveUserProfile {
  const ObserveUserProfile(this._repository);

  final UserRepository _repository;

  Stream<UserProfile?> call(String userId) => _repository.watchProfile(userId);
}
