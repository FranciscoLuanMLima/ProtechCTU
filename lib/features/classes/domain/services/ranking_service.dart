import '../entities/class_entities.dart';

final class RankingService {
  const RankingService();

  ClassRankingEntity calculate({
    required String classId,
    required List<StudentPublicProfileEntity> students,
    required DateTime at,
  }) {
    final scored =
        students
            .map((student) => (student: student, score: _score(student)))
            .toList(growable: false)
          ..sort((a, b) {
            final byScore = b.score.compareTo(a.score);
            return byScore != 0
                ? byScore
                : b.student.totalXp.compareTo(a.student.totalXp);
          });
    return ClassRankingEntity(
      classId: classId,
      entries: List<StudentRankingEntry>.generate(
        scored.length,
        (index) => StudentRankingEntry(
          position: index + 1,
          student: scored[index].student,
          score: scored[index].score,
        ),
        growable: false,
      ),
      calculatedAt: at,
    );
  }

  double _score(StudentPublicProfileEntity student) {
    return (student.totalXp * 0.35) +
        (student.overallProgress * 1000 * 0.2) +
        (student.masteryRate * 1000 * 0.2) +
        (student.streakDays * 10 * 0.1) +
        (student.completedExercises * 0.15);
  }
}
