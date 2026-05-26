import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class AuthModel {
  const AuthModel._({
    required this.name,
    required this.registration,
    required this.gender,
    required this.entryYear,
    required this.passwordHash,
    required this.passwordSalt,
    this.legacyPassword,
  });

  final String name;
  final String registration;
  final String gender;
  final int entryYear;
  final String passwordHash;
  final String passwordSalt;
  final String? legacyPassword;

  factory AuthModel.register({
    required String name,
    required String registration,
    required String password,
    required String gender,
    required int entryYear,
  }) {
    final salt = _createSalt();
    return AuthModel._(
      name: name,
      registration: registration,
      gender: gender,
      entryYear: entryYear,
      passwordHash: _hashPassword(password, salt),
      passwordSalt: salt,
    );
  }

  bool matches(String registration, String password) {
    if (this.registration != registration) return false;
    if (legacyPassword != null) return legacyPassword == password;
    return _hashPassword(password, passwordSalt) == passwordHash;
  }

  Map<String, Object> toMap() {
    return {
      'name': name,
      'registration': registration,
      'gender': gender,
      'entryYear': entryYear,
      'passwordHash': passwordHash,
      'passwordSalt': passwordSalt,
    };
  }

  Map<String, Object> toSessionMap() {
    return {
      'name': name,
      'registration': registration,
      'gender': gender,
      'entryYear': entryYear,
    };
  }

  AuthModel securedWith(String password) => AuthModel.register(
    name: name,
    registration: registration,
    password: password,
    gender: gender,
    entryYear: entryYear,
  );

  factory AuthModel.fromMap(Map<dynamic, dynamic> map) {
    return AuthModel._(
      name: map['name'] as String,
      registration: map['registration'] as String,
      gender: map['gender'] as String,
      entryYear: map['entryYear'] as int,
      passwordHash: (map['passwordHash'] as String?) ?? '',
      passwordSalt: (map['passwordSalt'] as String?) ?? '',
      legacyPassword: map['password'] as String?,
    );
  }

  factory AuthModel.fromSessionMap(Map<dynamic, dynamic> map) {
    return AuthModel._(
      name: map['name'] as String,
      registration: map['registration'] as String,
      gender: map['gender'] as String,
      entryYear: map['entryYear'] as int,
      passwordHash: '',
      passwordSalt: '',
    );
  }

  static String _createSalt() {
    final random = Random.secure();
    final bytes = List<int>.generate(24, (_) => random.nextInt(256));
    return base64UrlEncode(bytes);
  }

  static String _hashPassword(String password, String salt) {
    List<int> digest = utf8.encode('$salt:$password');
    for (var index = 0; index < 120000; index++) {
      digest = sha256.convert(digest).bytes;
    }
    return base64UrlEncode(digest);
  }
}
