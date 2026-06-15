import '../entities/class_entities.dart';

final class StudentComparisonService {
  const StudentComparisonService();

  StudentComparisonEntity compare({
    required StudentPublicProfileEntity requester,
    required StudentPublicProfileEntity colleague,
    required DateTime at,
  }) {
    if (requester.classId.isEmpty || requester.classId != colleague.classId) {
      throw StateError('Comparacao permitida apenas na mesma turma.');
    }
    return StudentComparisonEntity(
      classId: requester.classId,
      requesterId: requester.studentId,
      comparedStudentId: colleague.studentId,
      xpDifference: requester.totalXp - colleague.totalXp,
      progressDifference: requester.overallProgress - colleague.overallProgress,
      masteryDifference: requester.masteryRate - colleague.masteryRate,
      streakDifference: requester.streakDays - colleague.streakDays,
      calculatedAt: at,
    );
  }
}
