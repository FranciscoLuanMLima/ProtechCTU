import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../user/domain/entities/user_profile.dart';
import '../../user/providers/user_providers.dart';
import '../../../core/services/quiz_gamification_service.dart';
import '../data/datasources/quiz_catalog_datasource.dart';
import '../data/datasources/quiz_local_datasource.dart';
import '../data/repositories/quiz_repository_impl.dart';
import '../domain/entities/programming_quiz.dart';
import '../domain/repositories/quiz_repository.dart';

final quizCatalogDataSourceProvider = Provider<QuizCatalogDataSource>(
  (ref) => const QuizCatalogDataSource(),
);

final quizGamificationServiceProvider = Provider<QuizGamificationService>(
  (ref) => const QuizGamificationService(),
);

final quizLocalDataSourceProvider = FutureProvider<QuizLocalDataSource>((
  ref,
) async {
  await ref.watch(databaseMigrationProvider.future);
  final database = await ref.watch(databaseServiceProvider.future);
  return IsarQuizLocalDataSource(database.isar);
});

final quizRepositoryProvider = FutureProvider<QuizRepository>((ref) async {
  return QuizRepositoryImpl(
    catalog: ref.watch(quizCatalogDataSourceProvider),
    localDataSource: await ref.watch(quizLocalDataSourceProvider.future),
    userRepository: await ref.watch(userRepositoryProvider.future),
    backupService: await ref.watch(userBackupServiceProvider.future),
    gamification: ref.watch(quizGamificationServiceProvider),
  );
});

final programmingQuizzesProvider = FutureProvider<List<ProgrammingQuiz>>((
  ref,
) async {
  return (await ref.watch(quizRepositoryProvider.future)).loadQuizzes();
});

final programmingQuizProvider = FutureProvider.family<ProgrammingQuiz?, String>(
  (ref, quizId) async {
    return (await ref.watch(quizRepositoryProvider.future)).findQuiz(quizId);
  },
);

final ensureQuizLearnerProvider = FutureProvider.family<void, QuizLearner>((
  ref,
  learner,
) async {
  return (await ref.watch(
    quizRepositoryProvider.future,
  )).ensureLearnerProfile(learner);
});

final quizLearnerProfileProvider =
    StreamProvider.family<UserProfile?, QuizLearner>((ref, learner) async* {
      await ref.watch(ensureQuizLearnerProvider(learner).future);
      final repository = await ref.watch(quizRepositoryProvider.future);
      yield* repository.watchLearnerProfile(learner.userId);
    });

final quizAttemptsProvider = FutureProvider.family<List<QuizAttempt>, String>((
  ref,
  userId,
) async {
  return (await ref.watch(
    quizRepositoryProvider.future,
  )).attemptsForUser(userId);
});
