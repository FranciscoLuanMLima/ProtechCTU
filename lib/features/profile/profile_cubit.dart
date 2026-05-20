import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/auth_model.dart';
import 'profile_repository.dart';

class ProfileCubit extends Cubit<AuthModel?> {
  ProfileCubit(this._repository) : super(null);

  final ProfileRepository _repository;

  void load() {
    emit(_repository.load());
  }

  Future<void> logout() async {
    await _repository.logout();
    emit(null);
  }
}
