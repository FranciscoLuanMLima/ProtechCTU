import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/database/database_service.dart';
import '../../../core/services/backup_service.dart';
import '../../../core/services/cache_service.dart';
import '../../../core/services/adaptive_learning_service.dart';
import '../../../core/services/dashboard_analytics_service.dart';
import '../../../core/services/migration_service.dart';
import '../../../core/services/sync_service.dart';
import '../data/datasources/learning_dashboard_local_datasource.dart';
import '../data/datasources/user_local_datasource.dart';
import '../data/datasources/user_remote_datasource.dart';
import '../data/repositories/learning_dashboard_repository_impl.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/entities/learning_dashboard.dart';
import '../domain/entities/user_profile.dart';
import '../domain/repositories/learning_dashboard_repository.dart';
import '../domain/repositories/user_repository.dart';
import '../domain/usecases/delete_user_profile.dart';
import '../domain/usecases/get_learning_dashboard.dart';
import '../domain/usecases/get_user_profile.dart';
import '../domain/usecases/observe_learning_dashboard.dart';
import '../domain/usecases/observe_user_profile.dart';
import '../domain/usecases/record_study_activity.dart';
import '../domain/usecases/restore_user_backup.dart';
import '../domain/usecases/save_learning_goal.dart';
import '../domain/usecases/save_learning_topic_catalog.dart';
import '../domain/usecases/save_user_profile.dart';

final sharedPreferencesAsyncProvider = Provider<SharedPreferencesAsync>((ref) {
  return SharedPreferencesAsync();
});

final databaseServiceProvider = FutureProvider<DatabaseService>((ref) async {
  final database = await DatabaseService.open();
  ref.onDispose(database.close);
  return database;
});

final userCacheServiceProvider = Provider<UserCacheService>((ref) {
  return UserCacheService(ref.watch(sharedPreferencesAsyncProvider));
});

final userBackupServiceProvider = FutureProvider<UserBackupService>((
  ref,
) async {
  final database = await ref.watch(databaseServiceProvider.future);
  return UserBackupService(
    database.isar,
    ref.watch(sharedPreferencesAsyncProvider),
  );
});

final databaseMigrationProvider = FutureProvider<void>((ref) async {
  final database = await ref.watch(databaseServiceProvider.future);
  final backup = await ref.watch(userBackupServiceProvider.future);
  await DatabaseMigrationService(
    database.isar,
    ref.watch(sharedPreferencesAsyncProvider),
    backup,
  ).migrate();
});

final userLocalDataSourceProvider = FutureProvider<UserLocalDataSource>((
  ref,
) async {
  await ref.watch(databaseMigrationProvider.future);
  final database = await ref.watch(databaseServiceProvider.future);
  return IsarUserLocalDataSource(database.isar);
});

final userRepositoryProvider = FutureProvider<UserRepository>((ref) async {
  return UserRepositoryImpl(
    localDataSource: await ref.watch(userLocalDataSourceProvider.future),
    cache: ref.watch(userCacheServiceProvider),
    backupService: await ref.watch(userBackupServiceProvider.future),
  );
});

final adaptiveLearningServiceProvider = Provider<AdaptiveLearningService>(
  (ref) => const AdaptiveLearningService(),
);

final dashboardAnalyticsServiceProvider = Provider<DashboardAnalyticsService>(
  (ref) => const DashboardAnalyticsService(),
);

final learningDashboardLocalDataSourceProvider =
    FutureProvider<LearningDashboardLocalDataSource>((ref) async {
      await ref.watch(databaseMigrationProvider.future);
      final database = await ref.watch(databaseServiceProvider.future);
      return IsarLearningDashboardLocalDataSource(database.isar);
    });

final learningDashboardRepositoryProvider =
    FutureProvider<LearningDashboardRepository>((ref) async {
      return LearningDashboardRepositoryImpl(
        localDataSource: await ref.watch(
          learningDashboardLocalDataSourceProvider.future,
        ),
        userRepository: await ref.watch(userRepositoryProvider.future),
        adaptiveLearningService: ref.watch(adaptiveLearningServiceProvider),
        analyticsService: ref.watch(dashboardAnalyticsServiceProvider),
      );
    });

final getUserProfileProvider = FutureProvider<GetUserProfile>((ref) async {
  return GetUserProfile(await ref.watch(userRepositoryProvider.future));
});

final saveUserProfileProvider = FutureProvider<SaveUserProfile>((ref) async {
  return SaveUserProfile(await ref.watch(userRepositoryProvider.future));
});

final deleteUserProfileProvider = FutureProvider<DeleteUserProfile>((
  ref,
) async {
  return DeleteUserProfile(await ref.watch(userRepositoryProvider.future));
});

final observeUserProfileProvider = FutureProvider<ObserveUserProfile>((
  ref,
) async {
  return ObserveUserProfile(await ref.watch(userRepositoryProvider.future));
});

final restoreUserBackupProvider = FutureProvider<RestoreUserBackup>((
  ref,
) async {
  return RestoreUserBackup(await ref.watch(userRepositoryProvider.future));
});

final getLearningDashboardProvider = FutureProvider<GetLearningDashboard>((
  ref,
) async {
  return GetLearningDashboard(
    await ref.watch(learningDashboardRepositoryProvider.future),
  );
});

final observeLearningDashboardProvider =
    FutureProvider<ObserveLearningDashboard>((ref) async {
      return ObserveLearningDashboard(
        await ref.watch(learningDashboardRepositoryProvider.future),
      );
    });

final recordStudyActivityProvider = FutureProvider<RecordStudyActivity>((
  ref,
) async {
  return RecordStudyActivity(
    await ref.watch(learningDashboardRepositoryProvider.future),
  );
});

final saveLearningGoalProvider = FutureProvider<SaveLearningGoal>((ref) async {
  return SaveLearningGoal(
    await ref.watch(learningDashboardRepositoryProvider.future),
  );
});

final saveLearningTopicCatalogProvider =
    FutureProvider<SaveLearningTopicCatalog>((ref) async {
      return SaveLearningTopicCatalog(
        await ref.watch(learningDashboardRepositoryProvider.future),
      );
    });

/// Substitua este provider pelo datasource Firebase quando a nuvem for ativada.
final userRemoteDataSourceProvider = Provider<UserRemoteDataSource?>(
  (ref) => null,
);

final userSyncServiceProvider = FutureProvider<UserSyncService?>((ref) async {
  final remote = ref.watch(userRemoteDataSourceProvider);
  if (remote == null) {
    return null;
  }
  return UserSyncService(
    await ref.watch(userRepositoryProvider.future),
    remote,
  );
});

final watchedUserProfileProvider = StreamProvider.family<UserProfile?, String>((
  ref,
  userId,
) async* {
  final observe = await ref.watch(observeUserProfileProvider.future);
  yield* observe(userId);
});

final learningDashboardProvider =
    StreamProvider.family<LearningDashboardSnapshot, DashboardQuery>((
      ref,
      query,
    ) async* {
      final observe = await ref.watch(observeLearningDashboardProvider.future);
      yield* observe(query.userId, filters: query.filters);
    });

final class DashboardQuery {
  const DashboardQuery({
    required this.userId,
    this.filters = const DashboardFilters(),
  });

  final String userId;
  final DashboardFilters filters;

  @override
  bool operator ==(Object other) =>
      other is DashboardQuery &&
      other.userId == userId &&
      other.filters.searchTerm == filters.searchTerm &&
      other.filters.status == filters.status &&
      other.filters.difficulty == filters.difficulty &&
      other.filters.contentType == filters.contentType &&
      other.filters.sort == filters.sort;

  @override
  int get hashCode => Object.hash(
    userId,
    filters.searchTerm,
    filters.status,
    filters.difficulty,
    filters.contentType,
    filters.sort,
  );
}

final activeUserProfileProvider =
    AsyncNotifierProvider<ActiveUserProfileNotifier, UserProfile?>(
      ActiveUserProfileNotifier.new,
    );

final class ActiveUserProfileNotifier extends AsyncNotifier<UserProfile?> {
  late final UserRepository _repository;

  @override
  Future<UserProfile?> build() async {
    _repository = await ref.watch(userRepositoryProvider.future);
    final userId = await ref.watch(userCacheServiceProvider).readActiveUserId();
    if (userId == null) {
      return null;
    }
    return _repository.getProfile(userId);
  }

  Future<void> load(String userId) async {
    state = const AsyncLoading<UserProfile?>();
    state = await AsyncValue.guard(() => _repository.getProfile(userId));
  }

  Future<void> save(UserProfile profile) async {
    state = const AsyncLoading<UserProfile?>();
    state = await AsyncValue.guard(() async {
      await _repository.saveProfile(profile);
      return _repository.getProfile(profile.userId);
    });
  }

  Future<void> deleteActive() async {
    final profile = state.value;
    if (profile == null) {
      return;
    }
    state = const AsyncLoading<UserProfile?>();
    state = await AsyncValue.guard(() async {
      await _repository.deleteProfile(profile.userId);
      return null;
    });
  }
}
