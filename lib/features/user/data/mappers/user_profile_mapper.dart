import 'dart:convert';

import '../../domain/entities/user_profile.dart';
import '../models/user_profile_model.dart';

abstract final class UserProfileMapper {
  static UserProfile toEntity(UserProfileModel model) {
    return UserProfile(
      identification: UserIdentification(
        userId: model.userId,
        registration: model.registration,
        name: model.name,
        nickname: model.nickname,
        email: model.email,
        sex: Sex.values.byName(model.sex),
        birthDate: model.birthDate,
      ),
      institutional: InstitutionalData(
        classId: model.classId,
        className: model.className,
        course: model.course,
        startYear: model.startYear,
        currentPeriod: model.currentPeriod,
        shift: StudyShift.values.byName(model.shift),
        campus: model.campus,
      ),
      progression: Progression(
        level: model.level,
        currentXp: model.currentXp,
        totalXp: model.totalXp,
        nextLevelXp: model.nextLevelXp,
        title: model.title,
      ),
      streak: Streak(
        currentOffenseDays: model.currentOffenseDays,
        longestOffenseDays: model.longestOffenseDays,
        lastAccess: model.lastAccess,
        isFrozen: model.offenseFrozen,
      ),
      achievements: Achievements(
        unlockedAchievementIds: List<String>.unmodifiable(
          model.unlockedAchievementIds,
        ),
        inProgress: List<AchievementProgress>.unmodifiable(
          model.achievementsInProgress.map(
            (item) => AchievementProgress(
              achievementId: item.achievementId,
              progress: item.progress,
              target: item.target,
              rarity: AchievementRarity.values.byName(item.rarity),
              unlockedAt: item.unlockedAt,
            ),
          ),
        ),
        totalAchievements: model.totalAchievements,
        rarestUnlockedRarity: AchievementRarity.values.byName(
          model.rarestUnlockedRarity,
        ),
      ),
      economy: Economy(
        coins: model.coins,
        totalCoinsEarned: model.totalCoinsEarned,
        gems: model.gems,
        purchasedItemIds: List<String>.unmodifiable(model.purchasedItemIds),
        remainingHints: model.remainingHints,
      ),
      adaptivity: Adaptivity(
        topicProgress: List<TopicProgress>.unmodifiable(
          model.topicProgress.map(
            (item) => TopicProgress(
              topicId: item.topicId,
              progress: item.progress,
              masteryLevel: MasteryLevel.values.byName(item.masteryLevel),
              updatedAt: item.updatedAt,
            ),
          ),
        ),
        masteryLevel: MasteryLevel.values.byName(model.masteryLevel),
        unlockedTopicIds: List<String>.unmodifiable(model.unlockedTopicIds),
        blockedTopicIds: List<String>.unmodifiable(model.blockedTopicIds),
      ),
      statistics: UserStatistics(
        totalExercises: model.totalExercises,
        totalCorrectAnswers: model.totalCorrectAnswers,
        totalErrors: model.totalErrors,
        accuracyRate: model.accuracyRate,
        averageResponseTime: Duration(
          milliseconds: model.averageResponseTimeMilliseconds,
        ),
        totalSessions: model.totalSessions,
        totalDuration: Duration(milliseconds: model.totalDurationMilliseconds),
      ),
      rewards: Rewards(
        lastDailyReward: model.lastDailyReward,
        rewardSequence: model.rewardSequence,
        dailyMissions: List<Mission>.unmodifiable(
          model.dailyMissions.map(_missionToEntity),
        ),
        specialMissions: List<Mission>.unmodifiable(
          model.specialMissions.map(_missionToEntity),
        ),
      ),
      settings: UserSettings(
        notifications: model.notifications,
        sounds: model.sounds,
        vibration: model.vibration,
        animations: model.animations,
        theme: AppThemePreference.values.byName(model.theme),
        competitionMode: model.competitionMode,
        focusMode: model.focusMode,
        dashboardViewMode: DashboardViewMode.values.byName(
          model.dashboardViewMode,
        ),
        fontScale: FontScalePreference.values.byName(model.fontScale),
        highContrast: model.highContrast,
        colorVisionMode: ColorVisionMode.values.byName(model.colorVisionMode),
        dashboardWidgetOrder: List<String>.unmodifiable(
          model.dashboardWidgetOrder,
        ),
      ),
      synchronization: SynchronizationMetadata(
        lastSynchronization: model.lastSynchronization,
        localBackupEnabled: model.localBackupEnabled,
        hasPendingData: model.hasPendingData,
        localDataVersion: model.localDataVersion,
      ),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static UserProfileModel toModel(UserProfile entity) {
    return UserProfileModel()
      ..userId = entity.identification.userId
      ..registration = entity.identification.registration
      ..name = entity.identification.name
      ..nickname = entity.identification.nickname
      ..email = entity.identification.email
      ..sex = entity.identification.sex.name
      ..birthDate = entity.identification.birthDate.toUtc()
      ..course = entity.institutional.course
      ..classId = entity.institutional.classId
      ..className = entity.institutional.className
      ..startYear = entity.institutional.startYear
      ..currentPeriod = entity.institutional.currentPeriod
      ..shift = entity.institutional.shift.name
      ..campus = entity.institutional.campus
      ..level = entity.progression.level
      ..currentXp = entity.progression.currentXp
      ..totalXp = entity.progression.totalXp
      ..nextLevelXp = entity.progression.nextLevelXp
      ..title = entity.progression.title
      ..currentOffenseDays = entity.streak.currentOffenseDays
      ..longestOffenseDays = entity.streak.longestOffenseDays
      ..lastAccess = entity.streak.lastAccess?.toUtc()
      ..offenseFrozen = entity.streak.isFrozen
      ..unlockedAchievementIds = List<String>.from(
        entity.achievements.unlockedAchievementIds,
      )
      ..achievementsInProgress = entity.achievements.inProgress
          .map(
            (item) => AchievementProgressModel()
              ..achievementId = item.achievementId
              ..progress = item.progress
              ..target = item.target
              ..rarity = item.rarity.name
              ..unlockedAt = item.unlockedAt?.toUtc(),
          )
          .toList()
      ..totalAchievements = entity.achievements.totalAchievements
      ..rarestUnlockedRarity = entity.achievements.rarestUnlockedRarity.name
      ..coins = entity.economy.coins
      ..totalCoinsEarned = entity.economy.totalCoinsEarned
      ..gems = entity.economy.gems
      ..purchasedItemIds = List<String>.from(entity.economy.purchasedItemIds)
      ..remainingHints = entity.economy.remainingHints
      ..topicProgress = entity.adaptivity.topicProgress
          .map(
            (item) => TopicProgressModel()
              ..topicId = item.topicId
              ..progress = item.progress
              ..masteryLevel = item.masteryLevel.name
              ..updatedAt = item.updatedAt.toUtc(),
          )
          .toList()
      ..masteryLevel = entity.adaptivity.masteryLevel.name
      ..unlockedTopicIds = List<String>.from(entity.adaptivity.unlockedTopicIds)
      ..blockedTopicIds = List<String>.from(entity.adaptivity.blockedTopicIds)
      ..totalExercises = entity.statistics.totalExercises
      ..totalCorrectAnswers = entity.statistics.totalCorrectAnswers
      ..totalErrors = entity.statistics.totalErrors
      ..accuracyRate = entity.statistics.accuracyRate
      ..averageResponseTimeMilliseconds =
          entity.statistics.averageResponseTime.inMilliseconds
      ..totalSessions = entity.statistics.totalSessions
      ..totalDurationMilliseconds =
          entity.statistics.totalDuration.inMilliseconds
      ..lastDailyReward = entity.rewards.lastDailyReward?.toUtc()
      ..rewardSequence = entity.rewards.rewardSequence
      ..dailyMissions = entity.rewards.dailyMissions
          .map(_missionToModel)
          .toList()
      ..specialMissions = entity.rewards.specialMissions
          .map(_missionToModel)
          .toList()
      ..notifications = entity.settings.notifications
      ..sounds = entity.settings.sounds
      ..vibration = entity.settings.vibration
      ..animations = entity.settings.animations
      ..theme = entity.settings.theme.name
      ..competitionMode = entity.settings.competitionMode
      ..focusMode = entity.settings.focusMode
      ..dashboardViewMode = entity.settings.dashboardViewMode.name
      ..fontScale = entity.settings.fontScale.name
      ..highContrast = entity.settings.highContrast
      ..colorVisionMode = entity.settings.colorVisionMode.name
      ..dashboardWidgetOrder = List<String>.from(
        entity.settings.dashboardWidgetOrder,
      )
      ..lastSynchronization = entity.synchronization.lastSynchronization
          ?.toUtc()
      ..localBackupEnabled = entity.synchronization.localBackupEnabled
      ..hasPendingData = entity.synchronization.hasPendingData
      ..localDataVersion = entity.synchronization.localDataVersion
      ..createdAt = entity.createdAt.toUtc()
      ..updatedAt = entity.updatedAt.toUtc();
  }

  static UserSyncOperation toSyncEntity(UserSyncOperationModel model) {
    return UserSyncOperation(
      operationId: model.operationId,
      userId: model.userId,
      resourceType: model.resourceType,
      resourceKey: model.resourceKey,
      type: SyncOperationType.values.byName(model.type),
      status: SyncOperationStatus.values.byName(model.status),
      payload: (jsonDecode(model.payloadJson) as Map<Object?, Object?>)
          .cast<String, dynamic>(),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      attempts: model.attempts,
      nextAttemptAt: model.nextAttemptAt,
      errorMessage: model.errorMessage,
    );
  }

  static UserSyncOperationModel toSyncModel(UserSyncOperation entity) {
    return UserSyncOperationModel()
      ..operationId = entity.operationId
      ..userId = entity.userId
      ..resourceType = entity.resourceType
      ..resourceKey = entity.resourceKey
      ..type = entity.type.name
      ..status = entity.status.name
      ..payloadJson = jsonEncode(entity.payload)
      ..createdAt = entity.createdAt.toUtc()
      ..updatedAt = entity.updatedAt.toUtc()
      ..attempts = entity.attempts
      ..nextAttemptAt = entity.nextAttemptAt?.toUtc()
      ..errorMessage = entity.errorMessage;
  }

  static Mission _missionToEntity(MissionModel item) {
    return Mission(
      missionId: item.missionId,
      title: item.title,
      progress: item.progress,
      target: item.target,
      coinReward: item.coinReward,
      gemReward: item.gemReward,
      status: DailyMissionStatus.values.byName(item.status),
      expiresAt: item.expiresAt,
    );
  }

  static MissionModel _missionToModel(Mission item) {
    return MissionModel()
      ..missionId = item.missionId
      ..title = item.title
      ..progress = item.progress
      ..target = item.target
      ..coinReward = item.coinReward
      ..gemReward = item.gemReward
      ..status = item.status.name
      ..expiresAt = item.expiresAt.toUtc();
  }
}
