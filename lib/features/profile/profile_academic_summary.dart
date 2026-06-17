import '../user/domain/entities/user_profile.dart';

final class ProfileAcademicSummary {
  const ProfileAcademicSummary({
    required this.header,
    required this.progress,
    required this.statistics,
    required this.streak,
    required this.badges,
    required this.subjects,
    required this.timeline,
    required this.classroom,
    required this.advanced,
    required this.insights,
    required this.visuals,
    required this.settings,
  });

  final ProfileHeaderSummary header;
  final ProfileProgressSummary progress;
  final ProfileStatisticsSummary statistics;
  final ProfileStreakSummary streak;
  final List<ProfileBadgeSummary> badges;
  final List<ProfileSubjectSummary> subjects;
  final List<ProfileTimelineEvent> timeline;
  final ProfileClassroomSummary classroom;
  final ProfileAdvancedStatistics advanced;
  final List<String> insights;
  final ProfileVisualSummary visuals;
  final ProfileQuickSettings settings;
}

final class ProfileHeaderSummary {
  const ProfileHeaderSummary({
    required this.fullName,
    required this.nickname,
    required this.registration,
    required this.course,
    required this.campus,
    required this.currentPeriod,
    required this.entryDate,
    required this.level,
    required this.title,
  });

  final String fullName;
  final String nickname;
  final String registration;
  final String course;
  final String campus;
  final String currentPeriod;
  final String entryDate;
  final int level;
  final String title;
}

final class ProfileProgressSummary {
  const ProfileProgressSummary({
    required this.courseProgress,
    required this.currentXp,
    required this.totalXp,
    required this.nextLevelXp,
    required this.xpToNextLevel,
    required this.totalStudyTime,
    required this.totalStudySessions,
  });

  final double courseProgress;
  final int currentXp;
  final int totalXp;
  final int nextLevelXp;
  final int xpToNextLevel;
  final Duration totalStudyTime;
  final int totalStudySessions;
}

final class ProfileStatisticsSummary {
  const ProfileStatisticsSummary({
    required this.completedExercises,
    required this.correctExercises,
    required this.incorrectExercises,
    required this.accuracyRate,
    required this.averageActivityTime,
    required this.strongestSubject,
    required this.weakestSubject,
    required this.totalQuizzes,
    required this.completedChallenges,
  });

  final int completedExercises;
  final int correctExercises;
  final int incorrectExercises;
  final double accuracyRate;
  final Duration averageActivityTime;
  final String strongestSubject;
  final String weakestSubject;
  final int totalQuizzes;
  final int completedChallenges;
}

final class ProfileStreakSummary {
  const ProfileStreakSummary({
    required this.currentDays,
    required this.longestDays,
    required this.lastThirtyDays,
    required this.nextReward,
    required this.records,
  });

  final int currentDays;
  final int longestDays;
  final List<ProfileActivityDay> lastThirtyDays;
  final String nextReward;
  final List<String> records;
}

final class ProfileActivityDay {
  const ProfileActivityDay({required this.day, required this.active});

  final DateTime day;
  final bool active;
}

final class ProfileBadgeSummary {
  const ProfileBadgeSummary({
    required this.id,
    required this.name,
    required this.description,
    required this.rarity,
    required this.progress,
    required this.unlocked,
  });

  final String id;
  final String name;
  final String description;
  final AchievementRarity rarity;
  final double progress;
  final bool unlocked;
}

final class ProfileSubjectSummary {
  const ProfileSubjectSummary({
    required this.name,
    required this.masteryRate,
    required this.masteryStars,
    required this.studyTime,
    required this.lastActivity,
    required this.reviewSuggestion,
  });

  final String name;
  final double masteryRate;
  final int masteryStars;
  final Duration studyTime;
  final DateTime? lastActivity;
  final String reviewSuggestion;
}

final class ProfileTimelineEvent {
  const ProfileTimelineEvent({
    required this.title,
    required this.description,
    required this.occurredAt,
    required this.icon,
  });

  final String title;
  final String description;
  final DateTime occurredAt;
  final ProfileTimelineIcon icon;
}

enum ProfileTimelineIcon { level, badge, subject, challenge }

final class ProfileClassroomSummary {
  const ProfileClassroomSummary({
    required this.name,
    required this.studentCount,
    required this.classAverage,
    required this.internalRanking,
    required this.userPosition,
    required this.userXp,
    required this.classAverageXp,
    required this.userLevel,
    required this.classAverageLevel,
  });

  final String name;
  final int studentCount;
  final double classAverage;
  final int internalRanking;
  final int userPosition;
  final int userXp;
  final int classAverageXp;
  final int userLevel;
  final int classAverageLevel;
}

final class ProfileAdvancedStatistics {
  const ProfileAdvancedStatistics({
    required this.activeDays,
    required this.averageStudySequence,
    required this.frequentStudyHour,
    required this.weeklyEvolution,
    required this.monthlyEvolution,
    required this.xpEvolution,
    required this.performanceEvolution,
  });

  final int activeDays;
  final double averageStudySequence;
  final String frequentStudyHour;
  final double weeklyEvolution;
  final double monthlyEvolution;
  final double xpEvolution;
  final double performanceEvolution;
}

final class ProfileVisualSummary {
  const ProfileVisualSummary({
    required this.xpEvolution,
    required this.levelEvolution,
    required this.competencyRadar,
    required this.subjectDistribution,
  });

  final List<double> xpEvolution;
  final List<double> levelEvolution;
  final Map<String, double> competencyRadar;
  final Map<String, double> subjectDistribution;
}

final class ProfileQuickSettings {
  const ProfileQuickSettings({
    required this.notifications,
    required this.sounds,
    required this.vibration,
    required this.theme,
    required this.focusMode,
    required this.competitionMode,
  });

  final bool notifications;
  final bool sounds;
  final bool vibration;
  final String theme;
  final bool focusMode;
  final bool competitionMode;
}
