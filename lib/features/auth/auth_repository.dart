import 'dart:async';

import '../../app/constants.dart';
import '../../core/services/hive_service.dart';
import 'auth_model.dart';

class AuthRepository {
  AuthRepository._();

  static final instance = AuthRepository._();

  static const _usersKey = 'users';
  static const _currentUserKey = 'currentUser';
  static const _pendingPreferencesKey = 'pendingLearningPreferences';
  static const _preferencesPrefix = 'learningPreferences.';

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
    final box = HiveService.instance.box(AppConstants.hiveAuthBox);
    final raw = box.get(_currentUserKey);
    if (raw == null) return null;
    final map = Map<dynamic, dynamic>.from(raw as Map);
    final user = AuthModel.fromSessionMap(map);
    if (map.containsKey('password') ||
        map.containsKey('passwordHash') ||
        map.containsKey('passwordSalt')) {
      unawaited(box.put(_currentUserKey, user.toSessionMap()));
    }
    return user;
  }

  Map<String, String> get learningPreferences {
    final key = currentUser == null
        ? _pendingPreferencesKey
        : '$_preferencesPrefix${currentUser!.registration}';
    final raw = HiveService.instance.box(AppConstants.hiveAuthBox).get(key);
    if (raw == null) return const <String, String>{};
    return Map<String, String>.from(raw as Map);
  }

  Future<void> saveLearningPreferences(Map<String, String> answers) async {
    final key = currentUser == null
        ? _pendingPreferencesKey
        : '$_preferencesPrefix${currentUser!.registration}';
    await HiveService.instance
        .box(AppConstants.hiveAuthBox)
        .put(key, Map<String, String>.from(answers));
  }

  Future<void> register(AuthModel user) async {
    final allUsers = users;
    if (allUsers.any((item) => item.registration == user.registration)) {
      throw StateError('Esta matrícula já está cadastrada.');
    }

    allUsers.add(user);
    await HiveService.instance
        .box(AppConstants.hiveAuthBox)
        .put(_usersKey, allUsers.map((item) => item.toMap()).toList());
  }

  Future<AuthModel> login(String registration, String password) async {
    final allUsers = users;
    final matching = allUsers.where(
      (item) => item.matches(registration, password),
    );
    if (matching.isEmpty) {
      throw StateError('Matrícula ou senha inválidos.');
    }

    final found = matching.first;
    final user = found.legacyPassword == null
        ? found
        : found.securedWith(password);
    if (found.legacyPassword != null) {
      final index = allUsers.indexOf(found);
      allUsers[index] = user;
      await HiveService.instance
          .box(AppConstants.hiveAuthBox)
          .put(_usersKey, allUsers.map((item) => item.toMap()).toList());
    }
    await HiveService.instance
        .box(AppConstants.hiveAuthBox)
        .put(_currentUserKey, user.toSessionMap());
    await _bindPendingPreferences(user.registration);
    return user;
  }

  Future<void> logout() async {
    await HiveService.instance
        .box(AppConstants.hiveAuthBox)
        .delete(_currentUserKey);
  }

  Future<void> _bindPendingPreferences(String registration) async {
    final box = HiveService.instance.box(AppConstants.hiveAuthBox);
    final pending = box.get(_pendingPreferencesKey);
    if (pending == null) return;
    await box.put(
      '$_preferencesPrefix$registration',
      Map<String, String>.from(pending as Map),
    );
    await box.delete(_pendingPreferencesKey);
  }
}
