class AuthModel {
  const AuthModel({
    required this.name,
    required this.registration,
    required this.password,
    required this.gender,
    required this.entryYear,
  });

  final String name;
  final String registration;
  final String password;
  final String gender;
  final int entryYear;

  bool matches(String registration, String password) {
    return this.registration == registration && this.password == password;
  }

  Map<String, Object> toMap() {
    return {
      'name': name,
      'registration': registration,
      'password': password,
      'gender': gender,
      'entryYear': entryYear,
    };
  }

  factory AuthModel.fromMap(Map<dynamic, dynamic> map) {
    return AuthModel(
      name: map['name'] as String,
      registration: map['registration'] as String,
      password: map['password'] as String,
      gender: map['gender'] as String,
      entryYear: map['entryYear'] as int,
    );
  }
}
