import '../entities/learning_dashboard.dart';
import '../repositories/learning_dashboard_repository.dart';

final class ObserveLearningDashboard {
  const ObserveLearningDashboard(this._repository);

  final LearningDashboardRepository _repository;

  Stream<LearningDashboardSnapshot> call(
    String userId, {
    DashboardFilters filters = const DashboardFilters(),
  }) {
    return _repository.watchDashboard(userId, filters: filters);
  }
}
