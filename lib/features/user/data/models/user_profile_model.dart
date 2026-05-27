import 'dart:convert';

import 'package:isar_community/isar.dart';

part 'user_profile_model.g.dart';

@embedded
class AchievementProgressModel {
  String achievementId = '';
  int progress = 0;
  int target = 0;
  String rarity = 'common';
  DateTime? unlockedAt;

  Map<String, dynamic> toMap() => <String, dynamic>{
    'achievementId': achievementId,
    'progress': progress,
    'target': target,
    'rarity': rarity,
    'unlockedAt': unlockedAt?.toIso8601String(),
  };

  factory AchievementProgressModel.fromMap(Map<String, dynamic> map) {
    return AchievementProgressModel()
      ..achievementId = map['achievementId'] as String
      ..progress = map['progress'] as int
      ..target = map['target'] as int
      ..rarity = map['rarity'] as String
      ..unlockedAt = _nullableDate(map['unlockedAt']);
  }

  AchievementProgressModel();
}

@embedded
class TopicProgressModel {
  String topicId = '';
  double progress = 0;
  String masteryLevel = 'beginner';
  DateTime updatedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

  Map<String, dynamic> toMap() => <String, dynamic>{
    'topicId': topicId,
    'progress': progress,
    'masteryLevel': masteryLevel,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory TopicProgressModel.fromMap(Map<String, dynamic> map) {
    return TopicProgressModel()
      ..topicId = map['topicId'] as String
      ..progress = (map['progress'] as num).toDouble()
      ..masteryLevel = map['masteryLevel'] as String
      ..updatedAt = DateTime.parse(map['updatedAt'] as String).toUtc();
  }

  TopicProgressModel();
}

@embedded
class MissionModel {
  String missionId = '';
  String title = '';
  int progress = 0;
  int target = 0;
  int coinReward = 0;
  int gemReward = 0;
  String status = 'pending';
  DateTime expiresAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

  Map<String, dynamic> toMap() => <String, dynamic>{
    'missionId': missionId,
    'title': title,
    'progress': progress,
    'target': target,
    'coinReward': coinReward,
    'gemReward': gemReward,
    'status': status,
    'expiresAt': expiresAt.toIso8601String(),
  };

  factory MissionModel.fromMap(Map<String, dynamic> map) {
    return MissionModel()
      ..missionId = map['missionId'] as String
      ..title = map['title'] as String
      ..progress = map['progress'] as int
      ..target = map['target'] as int
      ..coinReward = map['coinReward'] as int
      ..gemReward = map['gemReward'] as int
      ..status = map['status'] as String
      ..expiresAt = DateTime.parse(map['expiresAt'] as String).toUtc();
  }

  MissionModel();
}

@collection
class UserProfileModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String userId = '';

  String registration = '';
  String name = '';
  String nickname = '';
  String email = '';
  String sex = 'notInformed';
  DateTime birthDate = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

  String course = '';
  String classId = '';
  String className = '';
  int startYear = 0;
  int currentPeriod = 0;
  String shift = 'morning';
  String campus = '';

  int level = 1;
  int currentXp = 0;
  int totalXp = 0;
  int nextLevelXp = 0;
  String title = '';

  int currentOffenseDays = 0;
  int longestOffenseDays = 0;
  DateTime? lastAccess;
  bool offenseFrozen = false;

  List<String> unlockedAchievementIds = <String>[];
  List<AchievementProgressModel> achievementsInProgress =
      <AchievementProgressModel>[];
  int totalAchievements = 0;
  String rarestUnlockedRarity = 'common';

  int coins = 0;
  int totalCoinsEarned = 0;
  int gems = 0;
  List<String> purchasedItemIds = <String>[];
  int remainingHints = 0;

  List<TopicProgressModel> topicProgress = <TopicProgressModel>[];
  String masteryLevel = 'beginner';
  List<String> unlockedTopicIds = <String>[];
  List<String> blockedTopicIds = <String>[];

  int totalExercises = 0;
  int totalCorrectAnswers = 0;
  int totalErrors = 0;
  double accuracyRate = 0;
  int averageResponseTimeMilliseconds = 0;
  int totalSessions = 0;
  int totalDurationMilliseconds = 0;

  DateTime? lastDailyReward;
  int rewardSequence = 0;
  List<MissionModel> dailyMissions = <MissionModel>[];
  List<MissionModel> specialMissions = <MissionModel>[];

  bool notifications = true;
  bool sounds = true;
  bool vibration = true;
  bool animations = true;
  String theme = 'system';
  bool competitionMode = false;
  bool focusMode = false;
  String dashboardViewMode = 'learningTree';
  String fontScale = 'medium';
  bool highContrast = false;
  String colorVisionMode = 'standard';
  List<String> dashboardWidgetOrder = <String>[];

  DateTime? lastSynchronization;
  bool localBackupEnabled = true;
  bool hasPendingData = false;
  int localDataVersion = 1;

  DateTime createdAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  DateTime updatedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

  Map<String, dynamic> toMap() => <String, dynamic>{
    'userId': userId,
    'registration': registration,
    'name': name,
    'nickname': nickname,
    'email': email,
    'sex': sex,
    'birthDate': birthDate.toIso8601String(),
    'course': course,
    'classId': classId,
    'className': className,
    'startYear': startYear,
    'currentPeriod': currentPeriod,
    'shift': shift,
    'campus': campus,
    'level': level,
    'currentXp': currentXp,
    'totalXp': totalXp,
    'nextLevelXp': nextLevelXp,
    'title': title,
    'currentOffenseDays': currentOffenseDays,
    'longestOffenseDays': longestOffenseDays,
    'lastAccess': lastAccess?.toIso8601String(),
    'offenseFrozen': offenseFrozen,
    'unlockedAchievementIds': unlockedAchievementIds,
    'achievementsInProgress': achievementsInProgress
        .map((item) => item.toMap())
        .toList(),
    'totalAchievements': totalAchievements,
    'rarestUnlockedRarity': rarestUnlockedRarity,
    'coins': coins,
    'totalCoinsEarned': totalCoinsEarned,
    'gems': gems,
    'purchasedItemIds': purchasedItemIds,
    'remainingHints': remainingHints,
    'topicProgress': topicProgress.map((item) => item.toMap()).toList(),
    'masteryLevel': masteryLevel,
    'unlockedTopicIds': unlockedTopicIds,
    'blockedTopicIds': blockedTopicIds,
    'totalExercises': totalExercises,
    'totalCorrectAnswers': totalCorrectAnswers,
    'totalErrors': totalErrors,
    'accuracyRate': accuracyRate,
    'averageResponseTimeMilliseconds': averageResponseTimeMilliseconds,
    'totalSessions': totalSessions,
    'totalDurationMilliseconds': totalDurationMilliseconds,
    'lastDailyReward': lastDailyReward?.toIso8601String(),
    'rewardSequence': rewardSequence,
    'dailyMissions': dailyMissions.map((item) => item.toMap()).toList(),
    'specialMissions': specialMissions.map((item) => item.toMap()).toList(),
    'notifications': notifications,
    'sounds': sounds,
    'vibration': vibration,
    'animations': animations,
    'theme': theme,
    'competitionMode': competitionMode,
    'focusMode': focusMode,
    'dashboardViewMode': dashboardViewMode,
    'fontScale': fontScale,
    'highContrast': highContrast,
    'colorVisionMode': colorVisionMode,
    'dashboardWidgetOrder': dashboardWidgetOrder,
    'lastSynchronization': lastSynchronization?.toIso8601String(),
    'localBackupEnabled': localBackupEnabled,
    'hasPendingData': hasPendingData,
    'localDataVersion': localDataVersion,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  String toJson() => jsonEncode(toMap());

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel()
      ..userId = map['userId'] as String
      ..registration = map['registration'] as String
      ..name = map['name'] as String
      ..nickname = map['nickname'] as String
      ..email = map['email'] as String
      ..sex = map['sex'] as String
      ..birthDate = DateTime.parse(map['birthDate'] as String).toUtc()
      ..course = map['course'] as String
      ..classId = map['classId'] as String? ?? ''
      ..className = map['className'] as String? ?? ''
      ..startYear = map['startYear'] as int
      ..currentPeriod = map['currentPeriod'] as int
      ..shift = map['shift'] as String
      ..campus = map['campus'] as String
      ..level = map['level'] as int
      ..currentXp = map['currentXp'] as int
      ..totalXp = map['totalXp'] as int
      ..nextLevelXp = map['nextLevelXp'] as int
      ..title = map['title'] as String
      ..currentOffenseDays = map['currentOffenseDays'] as int
      ..longestOffenseDays = map['longestOffenseDays'] as int
      ..lastAccess = _nullableDate(map['lastAccess'])
      ..offenseFrozen = map['offenseFrozen'] as bool
      ..unlockedAchievementIds =
          (map['unlockedAchievementIds'] as List<Object?>).cast<String>()
      ..achievementsInProgress =
          (map['achievementsInProgress'] as List<Object?>)
              .cast<Map<String, dynamic>>()
              .map(AchievementProgressModel.fromMap)
              .toList()
      ..totalAchievements = map['totalAchievements'] as int
      ..rarestUnlockedRarity = map['rarestUnlockedRarity'] as String
      ..coins = map['coins'] as int
      ..totalCoinsEarned = map['totalCoinsEarned'] as int
      ..gems = map['gems'] as int
      ..purchasedItemIds = (map['purchasedItemIds'] as List<Object?>)
          .cast<String>()
      ..remainingHints = map['remainingHints'] as int
      ..topicProgress = (map['topicProgress'] as List<Object?>)
          .cast<Map<String, dynamic>>()
          .map(TopicProgressModel.fromMap)
          .toList()
      ..masteryLevel = map['masteryLevel'] as String
      ..unlockedTopicIds = (map['unlockedTopicIds'] as List<Object?>)
          .cast<String>()
      ..blockedTopicIds = (map['blockedTopicIds'] as List<Object?>)
          .cast<String>()
      ..totalExercises = map['totalExercises'] as int
      ..totalCorrectAnswers = map['totalCorrectAnswers'] as int
      ..totalErrors = map['totalErrors'] as int
      ..accuracyRate = (map['accuracyRate'] as num).toDouble()
      ..averageResponseTimeMilliseconds =
          map['averageResponseTimeMilliseconds'] as int
      ..totalSessions = map['totalSessions'] as int
      ..totalDurationMilliseconds = map['totalDurationMilliseconds'] as int
      ..lastDailyReward = _nullableDate(map['lastDailyReward'])
      ..rewardSequence = map['rewardSequence'] as int
      ..dailyMissions = (map['dailyMissions'] as List<Object?>)
          .cast<Map<String, dynamic>>()
          .map(MissionModel.fromMap)
          .toList()
      ..specialMissions = (map['specialMissions'] as List<Object?>)
          .cast<Map<String, dynamic>>()
          .map(MissionModel.fromMap)
          .toList()
      ..notifications = map['notifications'] as bool
      ..sounds = map['sounds'] as bool
      ..vibration = map['vibration'] as bool
      ..animations = map['animations'] as bool
      ..theme = map['theme'] as String
      ..competitionMode = map['competitionMode'] as bool
      ..focusMode = map['focusMode'] as bool
      ..dashboardViewMode =
          map['dashboardViewMode'] as String? ?? 'learningTree'
      ..fontScale = map['fontScale'] as String? ?? 'medium'
      ..highContrast = map['highContrast'] as bool? ?? false
      ..colorVisionMode = map['colorVisionMode'] as String? ?? 'standard'
      ..dashboardWidgetOrder =
          (map['dashboardWidgetOrder'] as List<Object?>? ?? const <Object?>[])
              .cast<String>()
      ..lastSynchronization = _nullableDate(map['lastSynchronization'])
      ..localBackupEnabled = map['localBackupEnabled'] as bool
      ..hasPendingData = map['hasPendingData'] as bool
      ..localDataVersion = map['localDataVersion'] as int
      ..createdAt = DateTime.parse(map['createdAt'] as String).toUtc()
      ..updatedAt = DateTime.parse(map['updatedAt'] as String).toUtc();
  }

  factory UserProfileModel.fromJson(String value) {
    return UserProfileModel.fromMap(
      (jsonDecode(value) as Map<Object?, Object?>).cast<String, dynamic>(),
    );
  }

  UserProfileModel();
}

@collection
class UserSyncOperationModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String operationId = '';

  @Index()
  String userId = '';

  String resourceType = 'profile';
  String resourceKey = '';
  String type = 'upsert';
  String status = 'pending';
  String payloadJson = '{}';
  DateTime createdAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  DateTime updatedAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  int attempts = 0;
  DateTime? nextAttemptAt;
  String? errorMessage;
}

@collection
class UserBackupModel {
  Id id = Isar.autoIncrement;

  @Index()
  String userId = '';

  @Index()
  DateTime createdAt = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

  int localDataVersion = 1;
  String reason = '';
  String payloadJson = '{}';
}

DateTime? _nullableDate(Object? value) {
  return value == null ? null : DateTime.parse(value as String).toUtc();
}
