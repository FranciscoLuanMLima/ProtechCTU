import 'student_model.dart';

class StudentService {
  const StudentService();

  StudentModel fallbackStudent() {
    return const StudentModel(
      name: 'Estudante ProTech',
      registration: '000000',
      entryYear: 2026,
    );
  }
}
