final class ClassEntity {
  const ClassEntity({
    required this.classId,
    required this.name,
    required this.course,
    required this.period,
    required this.campus,
    required this.updatedAt,
  });

  final String classId;
  final String name;
  final String course;
  final int period;
  final String campus;
  final DateTime updatedAt;
}

final class StudentTopicMetric {
  const StudentTopicMetric({
    required this.topicId,
    required this.masteryRate,
    required this.accuracyRate,
  });

  final String topicId;
  final double masteryRate;
  final double accuracyRate;
}

final class StudentPublicProfileEntity {
  const StudentPublicProfileEntity({
    required this.studentId,
    required this.classId,
    required this.name,
    required this.level,
    required this.totalXp,
    required this.streakDays,
    required this.overallProgress,
    required this.accuracyRate,
    required this.masteryRate,
    required this.completedExercises,
    required this.totalStudyTime,
    required this.primaryBadgeIds,
    required this.topicMetrics,
    required this.updatedAt,
  });

  final String studentId;
  final String classId;
  final String name;
  final int level;
  final int totalXp;
  final int streakDays;
  final double overallProgress;
  final double accuracyRate;
  final double masteryRate;
  final int completedExercises;
  final Duration totalStudyTime;
  final List<String> primaryBadgeIds;
  final List<StudentTopicMetric> topicMetrics;
  final DateTime updatedAt;
}

final class StudentRankingEntry {
  const StudentRankingEntry({
    required this.position,
    required this.student,
    required this.score,
  });

  final int position;
  final StudentPublicProfileEntity student;
  final double score;
}

final class ClassRankingEntity {
  const ClassRankingEntity({
    required this.classId,
    required this.entries,
    required this.calculatedAt,
  });

  final String classId;
  final List<StudentRankingEntry> entries;
  final DateTime calculatedAt;

  StudentRankingEntry? entryFor(String studentId) {
    for (final entry in entries) {
      if (entry.student.studentId == studentId) return entry;
    }
    return null;
  }
}

final class ClassStatisticsEntity {
  const ClassStatisticsEntity({
    required this.classId,
    required this.totalStudents,
    required this.averageXp,
    required this.averageProgress,
    required this.averageAccuracy,
    required this.averageStreak,
    required this.averageStudyTime,
    required this.totalCompletedExercises,
    required this.highlightStudentId,
    required this.mostDifficultTopicId,
    required this.mostMasteredTopicId,
    required this.calculatedAt,
  });

  final String classId;
  final int totalStudents;
  final double averageXp;
  final double averageProgress;
  final double averageAccuracy;
  final double averageStreak;
  final Duration averageStudyTime;
  final int totalCompletedExercises;
  final String? highlightStudentId;
  final String? mostDifficultTopicId;
  final String? mostMasteredTopicId;
  final DateTime calculatedAt;
}

final class StudentComparisonEntity {
  const StudentComparisonEntity({
    required this.classId,
    required this.requesterId,
    required this.comparedStudentId,
    required this.xpDifference,
    required this.progressDifference,
    required this.masteryDifference,
    required this.streakDifference,
    required this.calculatedAt,
  });

  final String classId;
  final String requesterId;
  final String comparedStudentId;
  final int xpDifference;
  final double progressDifference;
  final double masteryDifference;
  final int streakDifference;
  final DateTime calculatedAt;
}
