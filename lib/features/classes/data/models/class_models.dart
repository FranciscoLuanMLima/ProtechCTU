import 'package:isar_community/isar.dart';

part 'class_models.g.dart';

@collection
class AcademicClassModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String classId = '';

  String name = '';
  String course = '';
  int period = 0;
  String campus = '';
  DateTime updatedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}

@collection
class StudentPublicProfileModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String studentId = '';

  @Index()
  String classId = '';

  String name = '';
  int level = 1;
  int totalXp = 0;
  int streakDays = 0;
  double overallProgress = 0;
  double accuracyRate = 0;
  double masteryRate = 0;
  int completedExercises = 0;
  int totalStudyTimeMilliseconds = 0;
  List<String> primaryBadgeIds = <String>[];
  String topicMetricsJson = '[]';
  DateTime updatedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}

@collection
class ClassRankingModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String classId = '';

  String entriesJson = '[]';
  DateTime calculatedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}

@collection
class ClassStatisticsModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String classId = '';

  int totalStudents = 0;
  double averageXp = 0;
  double averageProgress = 0;
  double averageAccuracy = 0;
  double averageStreak = 0;
  int averageStudyTimeMilliseconds = 0;
  int totalCompletedExercises = 0;
  String? highlightStudentId;
  String? mostDifficultTopicId;
  String? mostMasteredTopicId;
  DateTime calculatedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}

@collection
class StudentComparisonModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String comparisonKey = '';

  @Index()
  String classId = '';

  String requesterId = '';
  String comparedStudentId = '';
  int xpDifference = 0;
  double progressDifference = 0;
  double masteryDifference = 0;
  int streakDifference = 0;
  DateTime calculatedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}
