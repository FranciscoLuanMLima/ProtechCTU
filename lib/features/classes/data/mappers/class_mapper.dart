import 'dart:convert';

import '../../domain/entities/class_entities.dart';
import '../models/class_models.dart';

abstract final class ClassMapper {
  static ClassEntity classToEntity(AcademicClassModel model) => ClassEntity(
    classId: model.classId,
    name: model.name,
    course: model.course,
    period: model.period,
    campus: model.campus,
    updatedAt: model.updatedAt,
  );

  static AcademicClassModel classToModel(ClassEntity entity) =>
      AcademicClassModel()
        ..classId = entity.classId
        ..name = entity.name
        ..course = entity.course
        ..period = entity.period
        ..campus = entity.campus
        ..updatedAt = entity.updatedAt.toUtc();

  static StudentPublicProfileEntity profileToEntity(
    StudentPublicProfileModel model,
  ) => StudentPublicProfileEntity(
    studentId: model.studentId,
    classId: model.classId,
    name: model.name,
    level: model.level,
    totalXp: model.totalXp,
    streakDays: model.streakDays,
    overallProgress: model.overallProgress,
    accuracyRate: model.accuracyRate,
    masteryRate: model.masteryRate,
    completedExercises: model.completedExercises,
    totalStudyTime: Duration(milliseconds: model.totalStudyTimeMilliseconds),
    primaryBadgeIds: List<String>.unmodifiable(model.primaryBadgeIds),
    topicMetrics: _decodeTopicMetrics(model.topicMetricsJson),
    updatedAt: model.updatedAt,
  );

  static StudentPublicProfileModel profileToModel(
    StudentPublicProfileEntity entity,
  ) => StudentPublicProfileModel()
    ..studentId = entity.studentId
    ..classId = entity.classId
    ..name = entity.name
    ..level = entity.level
    ..totalXp = entity.totalXp
    ..streakDays = entity.streakDays
    ..overallProgress = entity.overallProgress
    ..accuracyRate = entity.accuracyRate
    ..masteryRate = entity.masteryRate
    ..completedExercises = entity.completedExercises
    ..totalStudyTimeMilliseconds = entity.totalStudyTime.inMilliseconds
    ..primaryBadgeIds = List<String>.from(entity.primaryBadgeIds)
    ..topicMetricsJson = jsonEncode(
      entity.topicMetrics
          .map(
            (metric) => <String, Object>{
              'topicId': metric.topicId,
              'masteryRate': metric.masteryRate,
              'accuracyRate': metric.accuracyRate,
            },
          )
          .toList(growable: false),
    )
    ..updatedAt = entity.updatedAt.toUtc();

  static ClassStatisticsEntity statisticsToEntity(ClassStatisticsModel model) =>
      ClassStatisticsEntity(
        classId: model.classId,
        totalStudents: model.totalStudents,
        averageXp: model.averageXp,
        averageProgress: model.averageProgress,
        averageAccuracy: model.averageAccuracy,
        averageStreak: model.averageStreak,
        averageStudyTime: Duration(
          milliseconds: model.averageStudyTimeMilliseconds,
        ),
        totalCompletedExercises: model.totalCompletedExercises,
        highlightStudentId: model.highlightStudentId,
        mostDifficultTopicId: model.mostDifficultTopicId,
        mostMasteredTopicId: model.mostMasteredTopicId,
        calculatedAt: model.calculatedAt,
      );

  static ClassStatisticsModel statisticsToModel(ClassStatisticsEntity entity) =>
      ClassStatisticsModel()
        ..classId = entity.classId
        ..totalStudents = entity.totalStudents
        ..averageXp = entity.averageXp
        ..averageProgress = entity.averageProgress
        ..averageAccuracy = entity.averageAccuracy
        ..averageStreak = entity.averageStreak
        ..averageStudyTimeMilliseconds = entity.averageStudyTime.inMilliseconds
        ..totalCompletedExercises = entity.totalCompletedExercises
        ..highlightStudentId = entity.highlightStudentId
        ..mostDifficultTopicId = entity.mostDifficultTopicId
        ..mostMasteredTopicId = entity.mostMasteredTopicId
        ..calculatedAt = entity.calculatedAt.toUtc();

  static ClassRankingModel rankingToModel(ClassRankingEntity entity) =>
      ClassRankingModel()
        ..classId = entity.classId
        ..entriesJson = jsonEncode(
          entity.entries
              .map(
                (entry) => <String, Object>{
                  'studentId': entry.student.studentId,
                  'position': entry.position,
                  'score': entry.score,
                },
              )
              .toList(growable: false),
        )
        ..calculatedAt = entity.calculatedAt.toUtc();

  static ClassRankingEntity rankingToEntity(
    ClassRankingModel model,
    Map<String, StudentPublicProfileEntity> profiles,
  ) {
    final encoded = (jsonDecode(model.entriesJson) as List<Object?>)
        .cast<Map<String, dynamic>>();
    final entries = <StudentRankingEntry>[];
    for (final item in encoded) {
      final profile = profiles[item['studentId'] as String];
      if (profile != null) {
        entries.add(
          StudentRankingEntry(
            position: item['position'] as int,
            student: profile,
            score: (item['score'] as num).toDouble(),
          ),
        );
      }
    }
    return ClassRankingEntity(
      classId: model.classId,
      entries: List<StudentRankingEntry>.unmodifiable(entries),
      calculatedAt: model.calculatedAt,
    );
  }

  static StudentComparisonModel comparisonToModel(
    StudentComparisonEntity entity,
  ) => StudentComparisonModel()
    ..comparisonKey =
        '${entity.classId}::${entity.requesterId}::${entity.comparedStudentId}'
    ..classId = entity.classId
    ..requesterId = entity.requesterId
    ..comparedStudentId = entity.comparedStudentId
    ..xpDifference = entity.xpDifference
    ..progressDifference = entity.progressDifference
    ..masteryDifference = entity.masteryDifference
    ..streakDifference = entity.streakDifference
    ..calculatedAt = entity.calculatedAt.toUtc();

  static List<StudentTopicMetric> _decodeTopicMetrics(String json) {
    return (jsonDecode(json) as List<Object?>)
        .cast<Map<String, dynamic>>()
        .map(
          (item) => StudentTopicMetric(
            topicId: item['topicId'] as String,
            masteryRate: (item['masteryRate'] as num).toDouble(),
            accuracyRate: (item['accuracyRate'] as num).toDouble(),
          ),
        )
        .toList(growable: false);
  }
}
