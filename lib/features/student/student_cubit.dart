import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_model.dart';
import 'student_repository.dart';

class StudentCubit extends Cubit<StudentModel?> {
  StudentCubit(this._repository) : super(null);

  final StudentRepository _repository;

  Future<void> load() async {
    emit(await _repository.load());
  }
}
