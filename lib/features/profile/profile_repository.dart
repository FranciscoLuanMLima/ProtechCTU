import '../auth/auth_model.dart';
import '../auth/auth_repository.dart';

class ProfileRepository {
  ProfileRepository._();

  static final instance = ProfileRepository._();

  AuthModel? load() => AuthRepository.instance.currentUser;

  Future<void> logout() => AuthRepository.instance.logout();
}
