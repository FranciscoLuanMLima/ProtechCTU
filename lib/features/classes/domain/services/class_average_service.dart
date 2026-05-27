import '../entities/class_entities.dart';

final class ClassAverageService {
  const ClassAverageService();

  ClassStatisticsEntity calculate({
    required String classId,
    required List<StudentPublicProfileEntity> students,
    required DateTime at,
    String? highlightStudentId,
  }) {
    if (students.isEmpty) {
      return ClassStatisticsEntity(
        classId: classId,
        totalStudents: 0,
        averageXp: 0,
        averageProgress: 0,
        averageAccuracy: 0,
        averageStreak: 0,
        averageStudyTime: Duration.zero,
        totalCompletedExercises: 0,
        highlightStudentId: null,
        mostDifficultTopicId: null,
        mostMasteredTopicId: null,
        calculatedAt: at,
      );
    }
    var totalXp = 0;
    var totalProgress = 0.0;
    var totalAccuracy = 0.0;
    var totalStreak = 0;
    var totalStudyMilliseconds = 0;
    var totalCompletedExercises = 0;
    final topicMasteryTotals = <String, double>{};
    final topicSamples = <String, int>{};
    for (final student in students) {
      totalXp += student.totalXp;
      totalProgress += student.overallProgress;
      totalAccuracy += student.accuracyRate;
      totalStreak += student.streakDays;
      totalStudyMilliseconds += student.totalStudyTime.inMilliseconds;
      totalCompletedExercises += student.completedExercises;
      for (final metric in student.topicMetrics) {
        topicMasteryTotals[metric.topicId] =
            (topicMasteryTotals[metric.topicId] ?? 0) + metric.masteryRate;
        topicSamples[metric.topicId] = (topicSamples[metric.topicId] ?? 0) + 1;
      }
    }
    String? weakestTopic;
    String? strongestTopic;
    var lowestMastery = double.infinity;
    var highestMastery = -1.0;
    for (final entry in topicMasteryTotals.entries) {
      final mastery = entry.value / topicSamples[entry.key]!;
      if (mastery < lowestMastery) {
        lowestMastery = mastery;
        weakestTopic = entry.key;
      }
      if (mastery > highestMastery) {
        highestMastery = mastery;
        strongestTopic = entry.key;
      }
    }
    final size = students.length;
    return ClassStatisticsEntity(
      classId: classId,
      totalStudents: size,
      averageXp: totalXp / size,
      averageProgress: totalProgress / size,
      averageAccuracy: totalAccuracy / size,
      averageStreak: totalStreak / size,
      averageStudyTime: Duration(milliseconds: totalStudyMilliseconds ~/ size),
      totalCompletedExercises: totalCompletedExercises,
      highlightStudentId: highlightStudentId,
      mostDifficultTopicId: weakestTopic,
      mostMasteredTopicId: strongestTopic,
      calculatedAt: at,
    );
  }
}
