import '../entities/learning_dashboard.dart';

abstract interface class LearningDashboardRepository {
  Stream<LearningDashboardSnapshot> watchDashboard(
    String userId, {
    DashboardFilters filters = const DashboardFilters(),
  });

  Future<LearningDashboardSnapshot> getDashboard(
    String userId, {
    DashboardFilters filters = const DashboardFilters(),
  });

  Future<void> saveTopicCatalog(List<LearningTopic> topics);

  Future<void> recordActivity(StudyActivity activity);

  Future<void> saveGoal(LearningGoal goal);
}
