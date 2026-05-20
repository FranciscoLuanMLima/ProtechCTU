import '../../app/constants.dart';
import '../../core/services/hive_service.dart';
import 'auth_model.dart';

class AuthRepository {
  AuthRepository._();

  static final instance = AuthRepository._();

  static const _usersKey = 'users';
  static const _currentUserKey = 'currentUser';

  List<AuthModel> get users {
    final rawUsers =
        HiveService.instance
                .box(AppConstants.hiveAuthBox)
                .get(_usersKey, defaultValue: <Map<String, Object>>[])
            as List;

    return rawUsers
        .map((raw) => AuthModel.fromMap(Map<dynamic, dynamic>.from(raw as Map)))
        .toList();
  }

  AuthModel? get currentUser {
    final raw = HiveService.instance
        .box(AppConstants.hiveAuthBox)
        .get(_currentUserKey);
    if (raw == null) return null;
    return AuthModel.fromMap(Map<dynamic, dynamic>.from(raw as Map));
  }

  Future<void> register(AuthModel user) async {
    final allUsers = users;
    if (allUsers.any((item) => item.registration == user.registration)) {
      throw StateError('Esta matricula ja esta cadastrada.');
    }

    allUsers.add(user);
    await HiveService.instance
        .box(AppConstants.hiveAuthBox)
        .put(_usersKey, allUsers.map((item) => item.toMap()).toList());
  }

  Future<AuthModel> login(String registration, String password) async {
    final user = users.where((item) => item.matches(registration, password));
    if (user.isEmpty) {
      throw StateError('Matricula ou senha invalidos.');
    }

    await HiveService.instance
        .box(AppConstants.hiveAuthBox)
        .put(_currentUserKey, user.first.toMap());
    return user.first;
  }

  Future<void> logout() async {
    await HiveService.instance
        .box(AppConstants.hiveAuthBox)
        .delete(_currentUserKey);
  }
}
