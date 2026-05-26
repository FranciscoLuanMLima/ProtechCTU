import '../../domain/entities/programming_quiz.dart';
import '../models/quiz_attempt_model.dart';

abstract final class QuizAttemptMapper {
  static QuizAttempt toEntity(QuizAttemptModel model) {
    return QuizAttempt(
      attemptId: model.attemptId,
      userId: model.userId,
      quizId: model.quizId,
      topicId: model.topicId,
      selectedOptionIndexes: List<int>.unmodifiable(
        model.selectedOptionIndexes,
      ),
      correctAnswers: model.correctAnswers,
      totalQuestions: model.totalQuestions,
      xpEarned: model.xpEarned,
      coinsEarned: model.coinsEarned,
      startedAt: model.startedAt,
      completedAt: model.completedAt,
    );
  }

  static QuizAttemptModel toModel(QuizAttempt entity) {
    return QuizAttemptModel()
      ..attemptId = entity.attemptId
      ..userId = entity.userId
      ..quizId = entity.quizId
      ..topicId = entity.topicId
      ..selectedOptionIndexes = List<int>.from(entity.selectedOptionIndexes)
      ..correctAnswers = entity.correctAnswers
      ..totalQuestions = entity.totalQuestions
      ..xpEarned = entity.xpEarned
      ..coinsEarned = entity.coinsEarned
      ..startedAt = entity.startedAt.toUtc()
      ..completedAt = entity.completedAt.toUtc();
  }
}
