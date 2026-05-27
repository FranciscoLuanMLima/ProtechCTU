import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/auth_repository.dart';
import '../../user/providers/user_providers.dart';
import '../data/datasources/class_local_datasource.dart';
import '../data/repositories/class_repository_impl.dart';
import '../domain/entities/class_entities.dart';
import '../domain/services/class_analytics_service.dart';
import '../domain/services/student_comparison_service.dart';
import '../domain/services/student_public_profile_service.dart';

final classRepositoryProvider = FutureProvider<ClassRepositoryImpl>((
  ref,
) async {
  await ref.watch(databaseMigrationProvider.future);
  final database = await ref.watch(databaseServiceProvider.future);
  return ClassRepositoryImpl(
    localDataSource: ClassLocalDataSource(database.isar),
    analyticsService: const ClassAnalyticsService(),
    comparisonService: const StudentComparisonService(),
  );
});

final studentPublicProfileServiceProvider =
    Provider<StudentPublicProfileService>(
      (ref) => const StudentPublicProfileService(),
    );

final publishCurrentClassProfileProvider = FutureProvider<void>((ref) async {
  final profile = await ref.watch(activeUserProfileProvider.future);
  if (profile == null || profile.institutional.classId.isEmpty) return;
  final publicProfile = ref
      .watch(studentPublicProfileServiceProvider)
      .fromUserProfile(profile);
  await (await ref.watch(
    classRepositoryProvider.future,
  )).saveOwnPublicProfile(profile.userId, publicProfile);
});

final classProvider = FutureProvider.family<ClassEntity?, String>((
  ref,
  requesterId,
) async {
  return (await ref.watch(
    classRepositoryProvider.future,
  )).getOwnClass(requesterId);
});

final rankingProvider = FutureProvider.family<ClassRankingEntity?, String>((
  ref,
  requesterId,
) async {
  return (await ref.watch(
    classRepositoryProvider.future,
  )).getRanking(requesterId);
});

final classStatsProvider =
    FutureProvider.family<ClassStatisticsEntity?, String>((
      ref,
      requesterId,
    ) async {
      return (await ref.watch(
        classRepositoryProvider.future,
      )).getStatistics(requesterId);
    });

final classmatesProvider =
    FutureProvider.family<List<StudentPublicProfileEntity>, String>((
      ref,
      requesterId,
    ) async {
      return (await ref.watch(
        classRepositoryProvider.future,
      )).listClassmates(requesterId);
    });

final currentStudentIdProvider = Provider<String?>(
  (ref) => AuthRepository.instance.currentUser?.registration,
);

final currentClassProvider = FutureProvider<ClassEntity?>((ref) async {
  final id = ref.watch(currentStudentIdProvider);
  return id == null ? null : ref.watch(classProvider(id).future);
});

final currentClassRankingProvider = FutureProvider<ClassRankingEntity?>((
  ref,
) async {
  final id = ref.watch(currentStudentIdProvider);
  return id == null ? null : ref.watch(rankingProvider(id).future);
});

final currentClassStatsProvider = FutureProvider<ClassStatisticsEntity?>((
  ref,
) async {
  final id = ref.watch(currentStudentIdProvider);
  return id == null ? null : ref.watch(classStatsProvider(id).future);
});

final currentClassmatesProvider =
    FutureProvider<List<StudentPublicProfileEntity>>((ref) async {
      final id = ref.watch(currentStudentIdProvider);
      return id == null
          ? const <StudentPublicProfileEntity>[]
          : ref.watch(classmatesProvider(id).future);
    });
