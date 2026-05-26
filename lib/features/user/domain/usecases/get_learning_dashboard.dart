import '../entities/learning_dashboard.dart';
import '../repositories/learning_dashboard_repository.dart';

final class GetLearningDashboard {
  const GetLearningDashboard(this._repository);

  final LearningDashboardRepository _repository;

  Future<LearningDashboardSnapshot> call(
    String userId, {
    DashboardFilters filters = const DashboardFilters(),
  }) {
    return _repository.getDashboard(userId, filters: filters);
  }
}
