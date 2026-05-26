enum QuizDifficulty { beginner, intermediate, advanced }

final class QuizQuestion {
  const QuizQuestion({
    required this.questionId,
    required this.prompt,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });

  final String questionId;
  final String prompt;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;
}

final class ProgrammingQuiz {
  const ProgrammingQuiz({
    required this.quizId,
    required this.topicId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.xpRewardPerCorrectAnswer,
    required this.coinRewardPerCorrectAnswer,
    required this.perfectBonusXp,
    required this.questions,
  });

  final String quizId;
  final String topicId;
  final String title;
  final String description;
  final QuizDifficulty difficulty;
  final int xpRewardPerCorrectAnswer;
  final int coinRewardPerCorrectAnswer;
  final int perfectBonusXp;
  final List<QuizQuestion> questions;
}

final class QuizLearner {
  const QuizLearner({
    required this.userId,
    required this.name,
    required this.gender,
    required this.entryYear,
  });

  final String userId;
  final String name;
  final String gender;
  final int entryYear;

  @override
  bool operator ==(Object other) =>
      other is QuizLearner &&
      other.userId == userId &&
      other.name == name &&
      other.gender == gender &&
      other.entryYear == entryYear;

  @override
  int get hashCode => Object.hash(userId, name, gender, entryYear);
}

final class QuizAttempt {
  const QuizAttempt({
    required this.attemptId,
    required this.userId,
    required this.quizId,
    required this.topicId,
    required this.selectedOptionIndexes,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.xpEarned,
    required this.coinsEarned,
    required this.startedAt,
    required this.completedAt,
  });

  final String attemptId;
  final String userId;
  final String quizId;
  final String topicId;
  final List<int> selectedOptionIndexes;
  final int correctAnswers;
  final int totalQuestions;
  final int xpEarned;
  final int coinsEarned;
  final DateTime startedAt;
  final DateTime completedAt;

  bool get isPerfect => correctAnswers == totalQuestions;
  double get accuracyRate =>
      totalQuestions == 0 ? 0 : correctAnswers / totalQuestions;
}

final class QuizCompletion {
  const QuizCompletion({
    required this.attempt,
    required this.newLevel,
    required this.totalXp,
    required this.coinsBalance,
    required this.streakDays,
    required this.didLevelUp,
  });

  final QuizAttempt attempt;
  final int newLevel;
  final int totalXp;
  final int coinsBalance;
  final int streakDays;
  final bool didLevelUp;
}
