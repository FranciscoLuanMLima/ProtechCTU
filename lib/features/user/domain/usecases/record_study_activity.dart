import '../entities/learning_dashboard.dart';
import '../repositories/learning_dashboard_repository.dart';

final class RecordStudyActivity {
  const RecordStudyActivity(this._repository);

  final LearningDashboardRepository _repository;

  Future<void> call(StudyActivity activity) =>
      _repository.recordActivity(activity);
}
