import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/logger.dart';
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
    AppLogger.info('[LOGIN] iniciado');
    emit(state.copyWith(loading: true, message: null));
    try {
      final user = await _repository.login(registration, password);
      AppLogger.info('[LOGIN] autenticado');
      AppLogger.info('[LOGIN] emitindo usuario autenticado');
      emit(state.copyWith(loading: false, user: user));
    } on StateError catch (error) {
      AppLogger.info('[LOGIN] falhou', error: error);
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
