import '../entities/learning_dashboard.dart';
import '../repositories/learning_dashboard_repository.dart';

final class SaveLearningTopicCatalog {
  const SaveLearningTopicCatalog(this._repository);

  final LearningDashboardRepository _repository;

  Future<void> call(List<LearningTopic> topics) =>
      _repository.saveTopicCatalog(topics);
}
