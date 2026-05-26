import '../entities/learning_dashboard.dart';
import '../repositories/learning_dashboard_repository.dart';

final class SaveLearningGoal {
  const SaveLearningGoal(this._repository);

  final LearningDashboardRepository _repository;

  Future<void> call(LearningGoal goal) => _repository.saveGoal(goal);
}
