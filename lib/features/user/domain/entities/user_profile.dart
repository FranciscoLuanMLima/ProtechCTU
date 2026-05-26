enum Sex { female, male, nonBinary, notInformed }

enum StudyShift { morning, afternoon, evening, fullTime }

enum AchievementRarity { common, uncommon, rare, epic, legendary }

enum MasteryLevel { beginner, developing, proficient, advanced, mastered }

enum AppThemePreference { system, light, dark }

enum DashboardViewMode { compactList, iconGrid, mindMap, learningTree }

enum FontScalePreference { small, medium, large, extraLarge }

enum ColorVisionMode { standard, protanopia, deuteranopia, tritanopia }

enum DailyMissionStatus { pending, inProgress, completed, claimed, expired }

enum SyncOperationType { upsert, delete }

enum SyncOperationStatus { pending, processing, failed }

final class UserIdentification {
  const UserIdentification({
    required this.userId,
    required this.registration,
    required this.name,
    required this.nickname,
    required this.email,
    required this.sex,
    required this.birthDate,
  });

  final String userId;
  final String registration;
  final String name;
  final String nickname;
  final String email;
  final Sex sex;
  final DateTime birthDate;
}

final class InstitutionalData {
  const InstitutionalData({
    required this.course,
    required this.startYear,
    required this.currentPeriod,
    required this.shift,
    required this.campus,
  });

  final String course;
  final int startYear;
  final int currentPeriod;
  final StudyShift shift;
  final String campus;
}

final class Progression {
  const Progression({
    required this.level,
    required this.currentXp,
    required this.totalXp,
    required this.nextLevelXp,
    required this.title,
  });

  final int level;
  final int currentXp;
  final int totalXp;
  final int nextLevelXp;
  final String title;
}

final class Streak {
  const Streak({
    required this.currentOffenseDays,
    required this.longestOffenseDays,
    required this.lastAccess,
    required this.isFrozen,
  });

  final int currentOffenseDays;
  final int longestOffenseDays;
  final DateTime? lastAccess;
  final bool isFrozen;
}

final class AchievementProgress {
  const AchievementProgress({
    required this.achievementId,
    required this.progress,
    required this.target,
    required this.rarity,
    this.unlockedAt,
  });

  final String achievementId;
  final int progress;
  final int target;
  final AchievementRarity rarity;
  final DateTime? unlockedAt;

  bool get isUnlocked => unlockedAt != null || progress >= target;
}

final class Achievements {
  const Achievements({
    required this.unlockedAchievementIds,
    required this.inProgress,
    required this.totalAchievements,
    required this.rarestUnlockedRarity,
  });

  final List<String> unlockedAchievementIds;
  final List<AchievementProgress> inProgress;
  final int totalAchievements;
  final AchievementRarity rarestUnlockedRarity;
}

final class Economy {
  const Economy({
    required this.coins,
    required this.totalCoinsEarned,
    required this.gems,
    required this.purchasedItemIds,
    required this.remainingHints,
  });

  final int coins;
  final int totalCoinsEarned;
  final int gems;
  final List<String> purchasedItemIds;
  final int remainingHints;
}

final class TopicProgress {
  const TopicProgress({
    required this.topicId,
    required this.progress,
    required this.masteryLevel,
    required this.updatedAt,
  });

  final String topicId;
  final double progress;
  final MasteryLevel masteryLevel;
  final DateTime updatedAt;
}

final class Adaptivity {
  const Adaptivity({
    required this.topicProgress,
    required this.masteryLevel,
    required this.unlockedTopicIds,
    required this.blockedTopicIds,
  });

  final List<TopicProgress> topicProgress;
  final MasteryLevel masteryLevel;
  final List<String> unlockedTopicIds;
  final List<String> blockedTopicIds;
}

final class UserStatistics {
  const UserStatistics({
    required this.totalExercises,
    required this.totalCorrectAnswers,
    required this.totalErrors,
    required this.accuracyRate,
    required this.averageResponseTime,
    required this.totalSessions,
    required this.totalDuration,
  });

  final int totalExercises;
  final int totalCorrectAnswers;
  final int totalErrors;
  final double accuracyRate;
  final Duration averageResponseTime;
  final int totalSessions;
  final Duration totalDuration;
}

final class Mission {
  const Mission({
    required this.missionId,
    required this.title,
    required this.progress,
    required this.target,
    required this.coinReward,
    required this.gemReward,
    required this.status,
    required this.expiresAt,
  });

  final String missionId;
  final String title;
  final int progress;
  final int target;
  final int coinReward;
  final int gemReward;
  final DailyMissionStatus status;
  final DateTime expiresAt;
}

final class Rewards {
  const Rewards({
    required this.lastDailyReward,
    required this.rewardSequence,
    required this.dailyMissions,
    required this.specialMissions,
  });

  final DateTime? lastDailyReward;
  final int rewardSequence;
  final List<Mission> dailyMissions;
  final List<Mission> specialMissions;
}

final class UserSettings {
  const UserSettings({
    required this.notifications,
    required this.sounds,
    required this.vibration,
    required this.animations,
    required this.theme,
    required this.competitionMode,
    required this.focusMode,
    required this.dashboardViewMode,
    required this.fontScale,
    required this.highContrast,
    required this.colorVisionMode,
    required this.dashboardWidgetOrder,
  });

  final bool notifications;
  final bool sounds;
  final bool vibration;
  final bool animations;
  final AppThemePreference theme;
  final bool competitionMode;
  final bool focusMode;
  final DashboardViewMode dashboardViewMode;
  final FontScalePreference fontScale;
  final bool highContrast;
  final ColorVisionMode colorVisionMode;
  final List<String> dashboardWidgetOrder;
}

final class SynchronizationMetadata {
  const SynchronizationMetadata({
    required this.lastSynchronization,
    required this.localBackupEnabled,
    required this.hasPendingData,
    required this.localDataVersion,
  });

  final DateTime? lastSynchronization;
  final bool localBackupEnabled;
  final bool hasPendingData;
  final int localDataVersion;

  SynchronizationMetadata copyWith({
    DateTime? lastSynchronization,
    bool? localBackupEnabled,
    bool? hasPendingData,
    int? localDataVersion,
  }) {
    return SynchronizationMetadata(
      lastSynchronization: lastSynchronization ?? this.lastSynchronization,
      localBackupEnabled: localBackupEnabled ?? this.localBackupEnabled,
      hasPendingData: hasPendingData ?? this.hasPendingData,
      localDataVersion: localDataVersion ?? this.localDataVersion,
    );
  }
}

final class UserProfile {
  const UserProfile({
    required this.identification,
    required this.institutional,
    required this.progression,
    required this.streak,
    required this.achievements,
    required this.economy,
    required this.adaptivity,
    required this.statistics,
    required this.rewards,
    required this.settings,
    required this.synchronization,
    required this.createdAt,
    required this.updatedAt,
  });

  final UserIdentification identification;
  final InstitutionalData institutional;
  final Progression progression;
  final Streak streak;
  final Achievements achievements;
  final Economy economy;
  final Adaptivity adaptivity;
  final UserStatistics statistics;
  final Rewards rewards;
  final UserSettings settings;
  final SynchronizationMetadata synchronization;
  final DateTime createdAt;
  final DateTime updatedAt;

  String get userId => identification.userId;

  UserProfile copyWith({
    UserIdentification? identification,
    InstitutionalData? institutional,
    Progression? progression,
    Streak? streak,
    Achievements? achievements,
    Economy? economy,
    Adaptivity? adaptivity,
    UserStatistics? statistics,
    Rewards? rewards,
    UserSettings? settings,
    SynchronizationMetadata? synchronization,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      identification: identification ?? this.identification,
      institutional: institutional ?? this.institutional,
      progression: progression ?? this.progression,
      streak: streak ?? this.streak,
      achievements: achievements ?? this.achievements,
      economy: economy ?? this.economy,
      adaptivity: adaptivity ?? this.adaptivity,
      statistics: statistics ?? this.statistics,
      rewards: rewards ?? this.rewards,
      settings: settings ?? this.settings,
      synchronization: synchronization ?? this.synchronization,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

final class UserSyncOperation {
  const UserSyncOperation({
    required this.operationId,
    required this.userId,
    required this.resourceType,
    required this.resourceKey,
    required this.type,
    required this.status,
    required this.payload,
    required this.createdAt,
    required this.updatedAt,
    required this.attempts,
    this.nextAttemptAt,
    this.errorMessage,
  });

  final String operationId;
  final String userId;
  final String resourceType;
  final String resourceKey;
  final SyncOperationType type;
  final SyncOperationStatus status;
  final Map<String, dynamic> payload;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int attempts;
  final DateTime? nextAttemptAt;
  final String? errorMessage;
}
