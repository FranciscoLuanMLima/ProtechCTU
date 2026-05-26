import '../../features/quiz/domain/entities/programming_quiz.dart';
import '../../features/user/domain/entities/user_profile.dart';

final class QuizRewardApplication {
  const QuizRewardApplication({
    required this.profile,
    required this.xpEarned,
    required this.coinsEarned,
    required this.didLevelUp,
  });

  final UserProfile profile;
  final int xpEarned;
  final int coinsEarned;
  final bool didLevelUp;
}

final class QuizGamificationService {
  const QuizGamificationService();

  UserProfile initialProfile(QuizLearner learner, DateTime now) {
    return UserProfile(
      identification: UserIdentification(
        userId: learner.userId,
        registration: learner.userId,
        name: learner.name,
        nickname: learner.name.split(' ').first,
        email: '',
        sex: _sex(learner.gender),
        birthDate: DateTime.utc(learner.entryYear - 17),
      ),
      institutional: InstitutionalData(
        course: 'Tecnologia',
        startYear: learner.entryYear,
        currentPeriod: 1,
        shift: StudyShift.morning,
        campus: 'UESPI',
      ),
      progression: const Progression(
        level: 1,
        currentXp: 0,
        totalXp: 0,
        nextLevelXp: 100,
        title: 'Aprendiz',
      ),
      streak: const Streak(
        currentOffenseDays: 0,
        longestOffenseDays: 0,
        lastAccess: null,
        isFrozen: false,
      ),
      achievements: const Achievements(
        unlockedAchievementIds: <String>[],
        inProgress: <AchievementProgress>[],
        totalAchievements: 12,
        rarestUnlockedRarity: AchievementRarity.common,
      ),
      economy: const Economy(
        coins: 0,
        totalCoinsEarned: 0,
        gems: 0,
        purchasedItemIds: <String>[],
        remainingHints: 3,
      ),
      adaptivity: const Adaptivity(
        topicProgress: <TopicProgress>[],
        masteryLevel: MasteryLevel.beginner,
        unlockedTopicIds: <String>['logic', 'variables'],
        blockedTopicIds: <String>['conditions', 'loops', 'functions'],
      ),
      statistics: const UserStatistics(
        totalExercises: 0,
        totalCorrectAnswers: 0,
        totalErrors: 0,
        accuracyRate: 0,
        averageResponseTime: Duration.zero,
        totalSessions: 0,
        totalDuration: Duration.zero,
      ),
      rewards: const Rewards(
        lastDailyReward: null,
        rewardSequence: 0,
        dailyMissions: <Mission>[],
        specialMissions: <Mission>[],
      ),
      settings: const UserSettings(
        notifications: true,
        sounds: true,
        vibration: true,
        animations: true,
        theme: AppThemePreference.system,
        competitionMode: false,
        focusMode: false,
        dashboardViewMode: DashboardViewMode.learningTree,
        fontScale: FontScalePreference.medium,
        highContrast: false,
        colorVisionMode: ColorVisionMode.standard,
        dashboardWidgetOrder: <String>[],
      ),
      synchronization: const SynchronizationMetadata(
        lastSynchronization: null,
        localBackupEnabled: true,
        hasPendingData: true,
        localDataVersion: 2,
      ),
      createdAt: now.toUtc(),
      updatedAt: now.toUtc(),
    );
  }

  QuizRewardApplication apply({
    required UserProfile current,
    required ProgrammingQuiz quiz,
    required int correctAnswers,
    required Duration duration,
    required DateTime completedAt,
  }) {
    final perfect = correctAnswers == quiz.questions.length;
    final xpEarned =
        (correctAnswers * quiz.xpRewardPerCorrectAnswer) +
        (perfect ? quiz.perfectBonusXp : 0);
    final coinsEarned = correctAnswers * quiz.coinRewardPerCorrectAnswer;
    final progression = _progression(current.progression, xpEarned);
    final streak = _streak(current.streak, completedAt);
    final totalExercises =
        current.statistics.totalExercises + quiz.questions.length;
    final totalCorrect =
        current.statistics.totalCorrectAnswers + correctAnswers;
    final totalErrors =
        current.statistics.totalErrors + quiz.questions.length - correctAnswers;
    final totalDuration = current.statistics.totalDuration + duration;
    final topicAccuracy = quiz.questions.isEmpty
        ? 0.0
        : correctAnswers / quiz.questions.length;
    final topicProgress = TopicProgress(
      topicId: quiz.topicId,
      progress: topicAccuracy,
      masteryLevel: _mastery(topicAccuracy),
      updatedAt: completedAt.toUtc(),
    );
    final previousTopics =
        current.adaptivity.topicProgress
            .where((topic) => topic.topicId != quiz.topicId)
            .toList(growable: true)
          ..add(topicProgress);
    final unlockedAchievements = <String>{
      ...current.achievements.unlockedAchievementIds,
      if (perfect) 'quiz_perfeito_${quiz.topicId}',
    }.toList(growable: false);
    final updated = current.copyWith(
      progression: progression,
      streak: streak,
      achievements: Achievements(
        unlockedAchievementIds: unlockedAchievements,
        inProgress: current.achievements.inProgress,
        totalAchievements: current.achievements.totalAchievements,
        rarestUnlockedRarity: perfect
            ? AchievementRarity.rare
            : current.achievements.rarestUnlockedRarity,
      ),
      economy: Economy(
        coins: current.economy.coins + coinsEarned,
        totalCoinsEarned: current.economy.totalCoinsEarned + coinsEarned,
        gems: current.economy.gems,
        purchasedItemIds: current.economy.purchasedItemIds,
        remainingHints: current.economy.remainingHints,
      ),
      adaptivity: Adaptivity(
        topicProgress: List<TopicProgress>.unmodifiable(previousTopics),
        masteryLevel: _mastery(topicAccuracy),
        unlockedTopicIds: current.adaptivity.unlockedTopicIds,
        blockedTopicIds: current.adaptivity.blockedTopicIds,
      ),
      statistics: UserStatistics(
        totalExercises: totalExercises,
        totalCorrectAnswers: totalCorrect,
        totalErrors: totalErrors,
        accuracyRate: totalExercises == 0 ? 0.0 : totalCorrect / totalExercises,
        averageResponseTime: totalExercises == 0
            ? Duration.zero
            : Duration(
                milliseconds: totalDuration.inMilliseconds ~/ totalExercises,
              ),
        totalSessions: current.statistics.totalSessions + 1,
        totalDuration: totalDuration,
      ),
      synchronization: current.synchronization.copyWith(hasPendingData: true),
      updatedAt: completedAt.toUtc(),
    );
    return QuizRewardApplication(
      profile: updated,
      xpEarned: xpEarned,
      coinsEarned: coinsEarned,
      didLevelUp: progression.level > current.progression.level,
    );
  }

  Progression _progression(Progression current, int earnedXp) {
    final total = current.totalXp + earnedXp;
    var remaining = total;
    var level = 1;
    var requirement = 100;
    while (remaining >= requirement) {
      remaining -= requirement;
      level++;
      requirement = 100 + ((level - 1) * 50);
    }
    return Progression(
      level: level,
      currentXp: remaining,
      totalXp: total,
      nextLevelXp: requirement,
      title: level >= 8
          ? 'Especialista'
          : level >= 5
          ? 'Programador'
          : level >= 3
          ? 'Aprendiz Avancado'
          : 'Aprendiz',
    );
  }

  Streak _streak(Streak current, DateTime completedAt) {
    final today = DateTime.utc(
      completedAt.year,
      completedAt.month,
      completedAt.day,
    );
    final last = current.lastAccess;
    var days = current.currentOffenseDays;
    if (last == null) {
      days = 1;
    } else {
      final lastDay = DateTime.utc(last.year, last.month, last.day);
      final difference = today.difference(lastDay).inDays;
      if (difference == 1) {
        days++;
      } else if (difference > 1) {
        days = 1;
      }
    }
    return Streak(
      currentOffenseDays: days,
      longestOffenseDays: days > current.longestOffenseDays
          ? days
          : current.longestOffenseDays,
      lastAccess: completedAt.toUtc(),
      isFrozen: false,
    );
  }

  MasteryLevel _mastery(double accuracy) {
    if (accuracy >= 1) {
      return MasteryLevel.mastered;
    }
    if (accuracy >= 0.8) {
      return MasteryLevel.advanced;
    }
    if (accuracy >= 0.6) {
      return MasteryLevel.proficient;
    }
    if (accuracy >= 0.4) {
      return MasteryLevel.developing;
    }
    return MasteryLevel.beginner;
  }

  Sex _sex(String value) {
    switch (value.toLowerCase()) {
      case 'masculino':
        return Sex.male;
      case 'feminino':
        return Sex.female;
      case 'outro':
        return Sex.nonBinary;
      default:
        return Sex.notInformed;
    }
  }
}
