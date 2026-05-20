import 'auth_model.dart';

enum AuthMode { login, register }

class AuthState {
  const AuthState({
    this.mode = AuthMode.login,
    this.loading = false,
    this.user,
    this.message,
  });

  final AuthMode mode;
  final bool loading;
  final AuthModel? user;
  final String? message;

  AuthState copyWith({
    AuthMode? mode,
    bool? loading,
    AuthModel? user,
    String? message,
  }) {
    return AuthState(
      mode: mode ?? this.mode,
      loading: loading ?? this.loading,
      user: user ?? this.user,
      message: message,
    );
  }
}
