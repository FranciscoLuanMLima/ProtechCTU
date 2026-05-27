import 'package:isar_community/isar.dart';

part 'learning_dashboard_model.g.dart';

@collection
class LearningTopicModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String topicId = '';

  @Index(caseSensitive: false)
  String name = '';

  String description = '';
  String category = 'python';
  String? parentTopicId;
  List<String> prerequisiteTopicIds = <String>[];
  List<String> contentTypes = <String>[];
  String difficulty = 'easy';
  int order = 0;
  int totalExercises = 0;
  int xpReward = 0;
  int coinReward = 0;
  String theoryJson = '[]';
  String exercisesJson = '[]';
  String challengesJson = '[]';
  String badgesJson = '[]';
  bool isActive = true;
}

@collection
class UserTopicProgressModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String recordKey = '';

  @Index()
  String userId = '';

  @Index()
  String topicId = '';

  String status = 'notStarted';
  double completionRate = 0;
  double masteryRate = 0;
  double previousMasteryRate = 0;
  int completedExercises = 0;
  int totalAttempts = 0;
  int correctAttempts = 0;
  int totalResponseTimeMilliseconds = 0;
  int totalStudyTimeMilliseconds = 0;
  String? userDifficulty;
  List<String> unlockedBadgeIds = <String>[];
  bool firstTryPerfect = false;
  DateTime? lastAccess;
  DateTime? unlockedAt;
  DateTime? completedAt;
  DateTime updatedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}

@collection
class StudyActivityModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String activityId = '';

  @Index()
  String userId = '';

  @Index()
  String topicId = '';

  String type = 'contentViewed';
  DateTime occurredAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  int durationMilliseconds = 0;
  int? responseTimeMilliseconds;
  bool? wasCorrect;
  bool wasFirstAttempt = false;
  double masteryAfterEvent = 0;
}

@collection
class ReviewScheduleModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String recordKey = '';

  @Index()
  String userId = '';

  @Index()
  String topicId = '';

  @Index()
  DateTime dueAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  DateTime? lastReviewedAt;
  int intervalDays = 1;
  double easeFactor = 2.5;
  int repetitions = 0;
  int lapses = 0;
  String urgency = 'scheduled';
}

@collection
class LearningGoalModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String goalId = '';

  @Index()
  String userId = '';

  String? topicId;
  String description = '';
  double targetCompletionRate = 1;
  DateTime deadline = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  String status = 'active';
  DateTime createdAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}
