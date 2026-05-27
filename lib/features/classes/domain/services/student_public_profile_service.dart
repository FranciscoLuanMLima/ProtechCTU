import '../../../user/domain/entities/user_profile.dart';
import '../entities/class_entities.dart';

final class StudentPublicProfileService {
  const StudentPublicProfileService();

  StudentPublicProfileEntity fromUserProfile(UserProfile profile) {
    final topicProgress = profile.adaptivity.topicProgress;
    final mastery = topicProgress.isEmpty
        ? 0.0
        : topicProgress.fold<double>(
                0,
                (total, topic) => total + topic.progress,
              ) /
              topicProgress.length;
    return StudentPublicProfileEntity(
      studentId: profile.userId,
      classId: profile.institutional.classId,
      name: profile.identification.name,
      level: profile.progression.level,
      totalXp: profile.progression.totalXp,
      streakDays: profile.streak.currentOffenseDays,
      overallProgress: mastery,
      accuracyRate: profile.statistics.accuracyRate,
      masteryRate: mastery,
      completedExercises: profile.statistics.totalExercises,
      totalStudyTime: profile.statistics.totalDuration,
      primaryBadgeIds: profile.achievements.unlockedAchievementIds
          .take(3)
          .toList(growable: false),
      topicMetrics: topicProgress
          .map(
            (topic) => StudentTopicMetric(
              topicId: topic.topicId,
              masteryRate: topic.progress,
              accuracyRate: topic.progress,
            ),
          )
          .toList(growable: false),
      updatedAt: profile.updatedAt,
    );
  }
}
