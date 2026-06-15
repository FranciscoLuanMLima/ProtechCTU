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
      classId: classIdFor(profile),
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

  String classIdFor(UserProfile profile) {
    final course = profile.institutional.course.trim().toLowerCase();
    final campus = profile.institutional.campus.trim().toLowerCase();
    final year = profile.institutional.startYear;
    final raw = [
      if (course.isNotEmpty) course else 'curso-nao-informado',
      if (campus.isNotEmpty) campus else 'campus-nao-informado',
      if (year > 0) '$year' else 'ano-nao-informado',
    ].join('-');
    return raw
        .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'-+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');
  }
}
