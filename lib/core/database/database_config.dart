import 'package:isar_community/isar.dart';

import '../../features/user/data/models/user_profile_model.dart';
import '../../features/user/data/models/learning_dashboard_model.dart';
import '../../features/quiz/data/models/quiz_attempt_model.dart';
import '../constants/storage_keys.dart';

abstract final class DatabaseConfig {
  static const String name = StorageKeys.databaseName;

  static List<CollectionSchema<dynamic>> get schemas =>
      <CollectionSchema<dynamic>>[
        UserProfileModelSchema,
        UserSyncOperationModelSchema,
        UserBackupModelSchema,
        LearningTopicModelSchema,
        UserTopicProgressModelSchema,
        StudyActivityModelSchema,
        ReviewScheduleModelSchema,
        LearningGoalModelSchema,
        QuizAttemptModelSchema,
      ];
}
