import '../entities/user_profile.dart';
import '../repositories/user_repository.dart';

final class SaveUserProfile {
  const SaveUserProfile(this._repository);

  final UserRepository _repository;

  Future<void> call(UserProfile profile) => _repository.saveProfile(profile);
}
