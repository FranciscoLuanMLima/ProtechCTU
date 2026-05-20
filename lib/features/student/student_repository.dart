import 'student_model.dart';
import 'student_service.dart';

class StudentRepository {
  StudentRepository._({StudentService? service})
    : _service = service ?? const StudentService();

  static final instance = StudentRepository._();

  final StudentService _service;

  Future<StudentModel> load() async {
    return _service.fallbackStudent();
  }
}
