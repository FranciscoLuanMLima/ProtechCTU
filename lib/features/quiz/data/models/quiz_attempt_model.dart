import 'package:isar_community/isar.dart';

part 'quiz_attempt_model.g.dart';

@collection
class QuizAttemptModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String attemptId = '';

  @Index()
  String userId = '';

  @Index()
  String quizId = '';

  String topicId = '';
  List<int> selectedOptionIndexes = <int>[];
  int correctAnswers = 0;
  int totalQuestions = 0;
  int xpEarned = 0;
  int coinsEarned = 0;
  DateTime startedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  DateTime completedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}
