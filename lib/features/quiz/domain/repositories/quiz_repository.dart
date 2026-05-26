import '../../../user/domain/entities/user_profile.dart';
import '../entities/programming_quiz.dart';

abstract interface class QuizRepository {
  Future<void> ensureLearnerProfile(QuizLearner learner);

  Future<UserProfile?> getLearnerProfile(String userId);

  Stream<UserProfile?> watchLearnerProfile(String userId);

  Future<List<ProgrammingQuiz>> loadQuizzes();

  Future<ProgrammingQuiz?> findQuiz(String quizId);

  Future<List<QuizAttempt>> attemptsForUser(String userId);

  Future<QuizCompletion> submit({
    required QuizLearner learner,
    required ProgrammingQuiz quiz,
    required List<int> selectedOptionIndexes,
    required DateTime startedAt,
  });
}
