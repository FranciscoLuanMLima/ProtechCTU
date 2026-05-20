import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_model.dart';
import 'auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repository) : super(const AuthState());

  final AuthRepository _repository;

  void toggleMode() {
    emit(
      state.copyWith(
        mode: state.mode == AuthMode.login ? AuthMode.register : AuthMode.login,
        message: null,
      ),
    );
  }

  Future<void> login(String registration, String password) async {
    emit(state.copyWith(loading: true, message: null));
    try {
      final user = await _repository.login(registration, password);
      emit(state.copyWith(loading: false, user: user));
    } on StateError catch (error) {
      emit(state.copyWith(loading: false, message: error.message));
    }
  }

  Future<void> register(AuthModel user) async {
    emit(state.copyWith(loading: true, message: null));
    try {
      await _repository.register(user);
      emit(
        state.copyWith(
          loading: false,
          mode: AuthMode.login,
          message: 'Cadastro realizado com sucesso.',
        ),
      );
    } on StateError catch (error) {
      emit(state.copyWith(loading: false, message: error.message));
    }
  }
}
