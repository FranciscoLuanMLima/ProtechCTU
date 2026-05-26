import '../auth/auth_repository.dart';
import 'student_model.dart';

class StudentRepository {
  StudentRepository._({AuthRepository? authRepository})
    : _authRepository = authRepository ?? AuthRepository.instance;

  static final instance = StudentRepository._();

  final AuthRepository _authRepository;

  Future<StudentModel?> load() async {
    final user = _authRepository.currentUser;
    if (user == null) return null;
    return StudentModel(
      name: user.name,
      registration: user.registration,
      entryYear: user.entryYear,
    );
  }
}
