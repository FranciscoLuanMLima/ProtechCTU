import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:protechctu/app/constants.dart';
import 'package:protechctu/core/services/adaptive_learning_service.dart';
import 'package:protechctu/core/services/dashboard_analytics_service.dart';
import 'package:protechctu/core/services/learning_catalog_seed.dart';
import 'package:protechctu/core/services/quiz_gamification_service.dart';
import 'package:protechctu/features/activities/activities_cubit.dart';
import 'package:protechctu/features/activities/activities_page.dart';
import 'package:protechctu/features/activities/activities_repository.dart';
import 'package:protechctu/features/activities/activity_editor_page.dart';
import 'package:protechctu/features/activities/python_exercise_runner.dart';
import 'package:protechctu/features/auth/auth_cubit.dart';
import 'package:protechctu/features/auth/auth_model.dart';
import 'package:protechctu/features/auth/auth_page.dart';
import 'package:protechctu/features/auth/auth_repository.dart';
import 'package:protechctu/features/concepts/concept_detail_page.dart';
import 'package:protechctu/features/concepts/concepts_cubit.dart';
import 'package:protechctu/features/concepts/concepts_page.dart';
import 'package:protechctu/features/concepts/concepts_repository.dart';
import 'package:protechctu/features/dashboard/teaching_dashboard_page.dart';
import 'package:protechctu/features/profile/profile_cubit.dart';
import 'package:protechctu/features/profile/profile_page.dart';
import 'package:protechctu/features/profile/profile_repository.dart';
import 'package:protechctu/features/quiz/data/datasources/quiz_catalog_datasource.dart';
import 'package:protechctu/features/quiz/domain/entities/programming_quiz.dart';
import 'package:protechctu/features/user/data/datasources/learning_dashboard_local_datasource.dart';
import 'package:protechctu/features/user/data/models/learning_dashboard_model.dart';
import 'package:protechctu/features/user/data/models/user_profile_model.dart';
import 'package:protechctu/features/user/data/repositories/learning_dashboard_repository_impl.dart';
import 'package:protechctu/features/user/domain/entities/learning_dashboard.dart';
import 'package:protechctu/features/user/domain/entities/user_profile.dart';
import 'package:protechctu/features/user/domain/repositories/user_repository.dart';

void main() {
  late Directory hiveDirectory;

  setUpAll(() async {
    hiveDirectory = await Directory.systemTemp.createTemp('protechctu_test_');
    Hive.init(hiveDirectory.path);
    for (final boxName in [
      AppConstants.hiveAppBox,
      AppConstants.hiveAuthBox,
      AppConstants.hiveStudentBox,
      AppConstants.hiveActivitiesBox,
    ]) {
      if (!Hive.isBoxOpen(boxName)) {
        await Hive.openBox(boxName);
      }
    }
  });

  tearDownAll(() async {
    await Hive.close();
    if (await hiveDirectory.exists()) {
      await hiveDirectory.delete(recursive: true);
    }
  });

  test('credencial persistida não contém senha em texto puro', () {
    final user = AuthModel.register(
      name: 'Ana Silva',
      registration: '2026001',
      password: 'Senha forte 123',
      gender: 'Feminino',
      entryYear: 2026,
    );

    expect(user.matches('2026001', 'Senha forte 123'), isTrue);
    expect(user.matches('2026001', 'senha errada'), isFalse);
    expect(user.toMap().containsKey('password'), isFalse);
    expect(user.toSessionMap().containsKey('passwordHash'), isFalse);
  });

  test('quiz perfeito concede recompensas gamificadas', () async {
    const gamification = QuizGamificationService();
    const learner = QuizLearner(
      userId: '2026001',
      name: 'Ana Silva',
      gender: 'Feminino',
      entryYear: 2026,
    );
    final profile = gamification.initialProfile(
      learner,
      DateTime.utc(2026, 5, 26),
    );
    final quiz = (await const QuizCatalogDataSource().findById(
      'quiz-variables',
    ))!;

    final result = gamification.apply(
      current: profile,
      quiz: quiz,
      correctAnswers: quiz.questions.length,
      duration: const Duration(minutes: 4),
      completedAt: DateTime.utc(2026, 5, 26, 10),
    );

    expect(result.xpEarned, 90);
    expect(result.coinsEarned, 15);
    expect(result.profile.streak.currentOffenseDays, 1);
    expect(profile.identification.birthDate.millisecondsSinceEpoch, 0);
    expect(profile.institutional.course, 'Não informado');
    expect(
      result.profile.achievements.unlockedAchievementIds,
      contains('quiz_perfeito_variables'),
    );
  });

  test('quiz e desafio concluido contam para progresso do assunto', () {
    const service = AdaptiveLearningService();
    final now = DateTime.utc(2026, 6, 13);
    const topic = LearningCatalogSeed.topics;
    final quizTopic = topic.firstWhere((item) => item.topicId == 'variables');
    final challengeTopic = topic.firstWhere(
      (item) => item.topicId == 'functions',
    );
    final initialQuizProgress = _progress('2026001', 'variables', now);
    final quizResult = service.apply(
      topic: quizTopic,
      current: initialQuizProgress,
      activity: _activity(
        userId: '2026001',
        topicId: 'variables',
        type: StudyEventType.quizCompleted,
        now: now,
      ),
    );
    final challengeResult = service.apply(
      topic: challengeTopic,
      current: _progress('2026001', 'functions', now),
      activity: _activity(
        userId: '2026001',
        topicId: 'functions',
        type: StudyEventType.challengeCompleted,
        now: now,
      ),
    );

    expect(quizResult.progress.completedExercises, 1);
    expect(quizResult.progress.completionRate, 0.5);
    expect(challengeResult.progress.completedExercises, 1);
    expect(challengeResult.progress.status, TopicStatus.completed);
  });

  test('executor Python processa entrada, condição, laço e função', () {
    const runner = PythonExerciseRunner();
    const code = '''
valor = int(input())
minutos = [20, 0, valor]
dias = 0

for tempo in minutos:
    if tempo > 0:
        dias += 1

def classificar(total):
    if total >= 2:
        return "Concluído"
    else:
        return "Revisar"

print(f"Dias ativos: {dias}")
print(classificar(dias))
print("Resultado:", dias)''';

    final result = runner.run(code: code, input: '15');

    expect(result.succeeded, isTrue);
    expect(result.output, 'Dias ativos: 2\nConcluído\nResultado: 2');
  });

  test('executor Python bloqueia comandos externos ao ambiente didático', () {
    const runner = PythonExerciseRunner();

    final result = runner.run(code: 'import os\nprint("teste")');

    expect(result.succeeded, isFalse);
    expect(result.error, contains('Comando não suportado'));
  });

  testWidgets('exibe formulario de login', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => AuthCubit(AuthRepository.instance),
          child: const AuthPage(),
        ),
      ),
    );

    expect(find.text('Entrar'), findsWidgets);
    expect(find.text('Matrícula'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Criar cadastro'), findsOneWidget);
  });

  testWidgets('abre assunto didático e volta para lista anterior', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: '/concepts',
      routes: [
        GoRoute(
          path: '/concepts',
          builder: (_, _) => BlocProvider(
            create: (_) => ConceptsCubit(ConceptsRepository.instance)..load(),
            child: const ConceptsPage(),
          ),
          routes: [
            GoRoute(
              path: ':id',
              builder: (_, state) =>
                  ConceptDetailPage(conceptId: state.pathParameters['id']!),
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(child: MaterialApp.router(routerConfig: router)),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Variáveis e tipos'));
    await tester.pumpAndSettle();

    expect(find.text('O que você vai aprender'), findsOneWidget);
    expect(find.text('Exemplo em Python'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Variáveis e tipos'), findsOneWidget);
  });

  testWidgets('atividade guiada preserva retorno para lista de práticas', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 3000));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final router = GoRouter(
      initialLocation: '/activities',
      routes: [
        GoRoute(
          path: '/activities',
          builder: (_, _) => BlocProvider(
            create: (_) => ActivitiesCubit()..load(),
            child: const ActivitiesPage(),
          ),
          routes: [
            GoRoute(
              path: 'editor',
              name: 'activityEditor',
              builder: (_, state) => ActivityEditorPage(
                activityId: state.uri.queryParameters['activityId'],
              ),
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(child: MaterialApp.router(routerConfig: router)),
    );
    await tester.pumpAndSettle();

    await tester.tap(
      find.widgetWithText(FilledButton, 'Iniciar prática').first,
    );
    await tester.pumpAndSettle();

    expect(find.text('Objetivo'), findsOneWidget);
    expect(find.text('Seu código'), findsOneWidget);
    expect(find.text('Entrada de teste'), findsOneWidget);
    expect(find.text('Executar código'), findsWidgets);
    expect(find.text('Autoavaliação antes de concluir:'), findsWidgets);
    expect(find.text('Registrar conclusão'), findsWidgets);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Pratica orientada'), findsOneWidget);
  });

  test('filtro de pendentes remove atividades concluidas', () async {
    final activities = await const ActivitiesRepository().load();

    final pending = filterPendingActivities(
      activities,
      completedTopicIds: const <String>{'variables'},
      legacyCompletedActivityIds: const <String>{'hello-world'},
    );

    expect(
      pending.map((activity) => activity.id),
      isNot(contains('hello-world')),
    );
    expect(pending.map((activity) => activity.id), isNot(contains('sum')));
    expect(pending.map((activity) => activity.id), contains('approval'));
  });

  testWidgets('dashboard separa navegacao de pendencias e revisoes', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 2200));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final router = GoRouter(
      initialLocation: '/dashboard',
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (_, _) => const TeachingDashboardPage(),
        ),
        GoRoute(
          path: '/activities',
          builder: (_, state) => BlocProvider(
            create: (_) => ActivitiesCubit()..load(),
            child: ActivitiesPage(filter: state.uri.queryParameters['filter']),
          ),
        ),
        GoRoute(
          path: '/profile',
          builder: (_, _) => BlocProvider(
            create: (_) => ProfileCubit(ProfileRepository.instance)..load(),
            child: const ProfilePage(),
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(child: MaterialApp.router(routerConfig: router)),
    );
    await tester.pumpAndSettle();

    expect(find.text('Desempenho por assunto'), findsOneWidget);

    await tester.tap(find.text('Atividades pendentes'));
    await tester.pumpAndSettle();

    expect(
      find.text('Continue os desafios praticos ainda em aberto na sua trilha.'),
      findsOneWidget,
    );

    router.go('/dashboard');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Revisoes agendadas'));
    await tester.pumpAndSettle();

    expect(
      find.text('Revise conteudos que precisam de reforco antes de avancar.'),
      findsOneWidget,
    );

    router.go('/dashboard');
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Perfil'));
    await tester.pumpAndSettle();

    expect(find.text('Perfil'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Desempenho por assunto'), findsOneWidget);
  });

  test(
    'dashboard emite snapshot inicial mesmo sem evento do watcher',
    () async {
      final repository = LearningDashboardRepositoryImpl(
        localDataSource: _DashboardLocalDataSourceWithoutWatchEvent(),
        userRepository: _EmptyUserRepository(),
        adaptiveLearningService: const AdaptiveLearningService(),
        analyticsService: const DashboardAnalyticsService(),
      );

      final snapshot = await repository
          .watchDashboard('2026001')
          .first
          .timeout(const Duration(seconds: 1));

      expect(snapshot.topics, isNotEmpty);
    },
  );

  testWidgets('atividade executa código e apresenta a saída no editor', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 3000));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: ActivityEditorPage(activityId: 'sum')),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const ValueKey('activity-code-editor')),
      '''xp_atividade_1 = int(input())
xp_atividade_2 = int(input())
xp_total = xp_atividade_1 + xp_atividade_2
print(f"XP total: {xp_total}")''',
    );
    await tester.tap(
      find.byKey(const ValueKey('activity-execute-button')).first,
    );
    await tester.pumpAndSettle();

    expect(find.text('Saída do programa'), findsOneWidget);
    expect(find.text('XP total: 65'), findsOneWidget);
  });
}

TopicLearningProgress _progress(String userId, String topicId, DateTime now) {
  return TopicLearningProgress(
    userId: userId,
    topicId: topicId,
    status: TopicStatus.notStarted,
    completionRate: 0,
    masteryRate: 0,
    previousMasteryRate: 0,
    completedExercises: 0,
    totalAttempts: 0,
    correctAttempts: 0,
    totalResponseTime: Duration.zero,
    totalStudyTime: Duration.zero,
    userDifficulty: null,
    unlockedBadgeIds: const <String>[],
    firstTryPerfect: false,
    lastAccess: null,
    unlockedAt: null,
    completedAt: null,
    updatedAt: now,
  );
}

StudyActivity _activity({
  required String userId,
  required String topicId,
  required StudyEventType type,
  required DateTime now,
}) {
  return StudyActivity(
    activityId: '$userId:$topicId:${type.name}',
    userId: userId,
    topicId: topicId,
    type: type,
    occurredAt: now,
    duration: const Duration(minutes: 5),
    responseTime: const Duration(seconds: 30),
    wasCorrect: true,
    wasFirstAttempt: true,
    masteryAfterEvent: 0,
  );
}

final class _DashboardLocalDataSourceWithoutWatchEvent
    implements LearningDashboardLocalDataSource {
  final _topics = <LearningTopicModel>[];

  @override
  Stream<void> watchDashboardChanges(String userId) => const Stream.empty();

  @override
  Future<List<LearningTopicModel>> findTopics() async => _topics;

  @override
  Future<LearningTopicModel?> findTopic(String topicId) async {
    for (final topic in _topics) {
      if (topic.topicId == topicId) return topic;
    }
    return null;
  }

  @override
  Future<List<UserTopicProgressModel>> findProgress(String userId) async =>
      const <UserTopicProgressModel>[];

  @override
  Future<UserTopicProgressModel?> findTopicProgress(
    String userId,
    String topicId,
  ) async => null;

  @override
  Future<List<StudyActivityModel>> findActivities(
    String userId, {
    required DateTime from,
  }) async => const <StudyActivityModel>[];

  @override
  Future<List<ReviewScheduleModel>> findReviews(String userId) async =>
      const <ReviewScheduleModel>[];

  @override
  Future<ReviewScheduleModel?> findReview(
    String userId,
    String topicId,
  ) async => null;

  @override
  Future<List<LearningGoalModel>> findGoals(String userId) async =>
      const <LearningGoalModel>[];

  @override
  Future<void> putTopics(List<LearningTopicModel> topics) async {
    _topics
      ..clear()
      ..addAll(topics);
  }

  @override
  Future<void> putActivityState({
    required UserTopicProgressModel progress,
    required StudyActivityModel activity,
    required ReviewScheduleModel review,
    required UserSyncOperationModel operation,
  }) async {}

  @override
  Future<void> putGoal(
    LearningGoalModel goal,
    UserSyncOperationModel operation,
  ) async {}

  @override
  Future<StudyActivityModel?> findActivity(String activityId) async => null;
}

final class _EmptyUserRepository implements UserRepository {
  @override
  Stream<UserProfile?> watchProfile(String userId) => const Stream.empty();

  @override
  Future<UserProfile?> getProfile(String userId) async => null;

  @override
  Future<UserProfile?> getCachedProfile(
    String userId, {
    Duration maxAge = const Duration(minutes: 5),
  }) async => null;

  @override
  Future<void> saveProfile(UserProfile profile) async {}

  @override
  Future<void> deleteProfile(String userId) async {}

  @override
  Future<List<UserProfile>> listBackups(String userId) async =>
      const <UserProfile>[];

  @override
  Future<void> restoreBackup(UserProfile backup) async {}

  @override
  Future<List<UserSyncOperation>> pendingSynchronizationOperations({
    int limit = 50,
  }) async => const <UserSyncOperation>[];

  @override
  Future<void> completeSynchronization(
    String operationId,
    String userId,
  ) async {}

  @override
  Future<void> failSynchronization(
    String operationId, {
    required String errorMessage,
    required DateTime retryAt,
  }) async {}
}
