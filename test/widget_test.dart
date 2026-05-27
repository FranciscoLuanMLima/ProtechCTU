import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:protechctu/core/services/quiz_gamification_service.dart';
import 'package:protechctu/features/activities/activities_cubit.dart';
import 'package:protechctu/features/activities/activities_page.dart';
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
import 'package:protechctu/features/classes/domain/entities/class_entities.dart';
import 'package:protechctu/features/classes/domain/services/class_analytics_service.dart';
import 'package:protechctu/features/quiz/data/datasources/quiz_catalog_datasource.dart';
import 'package:protechctu/features/quiz/domain/entities/programming_quiz.dart';
import 'package:protechctu/features/user/data/datasources/learning_topic_catalog_datasource.dart';

void main() {
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

  test('catalogo adaptativo inclui novos assuntos e pre-requisitos', () {
    final topics = const LearningTopicCatalogDataSource().load();
    final ids = topics.map((topic) => topic.topicId).toSet();

    expect(
      ids,
      containsAll(<String>['lists-tuples', 'exceptions', 'scope', 'debugging']),
    );
    final debugging = topics.firstWhere(
      (topic) => topic.topicId == 'debugging',
    );
    expect(
      debugging.prerequisiteTopicIds,
      containsAll(<String>['exceptions', 'scope']),
    );
    expect(debugging.challenges, isNotEmpty);
    expect(debugging.badges, isNotEmpty);
  });

  test('executor Python suporta colecoes e tratamento de entrada invalida', () {
    const runner = PythonExerciseRunner();
    const code = '''
notas = [7, 8]
notas.append(9)
extremos = (min(notas), max(notas))
print(extremos)
try:
    valor = int(input())
    print(valor)
except ValueError:
    print("Nota invalida")''';

    final result = runner.run(code: code, input: 'abc');

    expect(result.succeeded, isTrue);
    expect(result.output, '(7, 9)\nNota invalida');
  });

  test('analytics de turma calcula medias e ranking', () {
    final students = <StudentPublicProfileEntity>[
      StudentPublicProfileEntity(
        studentId: '1',
        classId: 't1',
        name: 'Ana',
        level: 3,
        totalXp: 300,
        streakDays: 4,
        overallProgress: 0.8,
        accuracyRate: 0.9,
        masteryRate: 0.85,
        completedExercises: 20,
        totalStudyTime: const Duration(minutes: 100),
        primaryBadgeIds: const <String>['b1'],
        topicMetrics: const <StudentTopicMetric>[
          StudentTopicMetric(
            topicId: 'scope',
            masteryRate: 0.8,
            accuracyRate: 0.9,
          ),
        ],
        updatedAt: DateTime.utc(2026, 5, 27),
      ),
      StudentPublicProfileEntity(
        studentId: '2',
        classId: 't1',
        name: 'Bia',
        level: 2,
        totalXp: 100,
        streakDays: 2,
        overallProgress: 0.4,
        accuracyRate: 0.5,
        masteryRate: 0.45,
        completedExercises: 10,
        totalStudyTime: const Duration(minutes: 40),
        primaryBadgeIds: const <String>[],
        topicMetrics: const <StudentTopicMetric>[
          StudentTopicMetric(
            topicId: 'scope',
            masteryRate: 0.4,
            accuracyRate: 0.5,
          ),
        ],
        updatedAt: DateTime.utc(2026, 5, 27),
      ),
    ];

    final result = const ClassAnalyticsService().calculate(
      't1',
      students,
      DateTime.utc(2026, 5, 27),
    );

    expect(result.statistics.averageXp, 200);
    expect(result.statistics.averageAccuracy, closeTo(0.7, 0.001));
    expect(result.statistics.totalCompletedExercises, 30);
    expect(result.ranking.entries.first.student.studentId, '1');
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

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
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

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
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

    expect(find.text('Prática orientada'), findsOneWidget);
  });

  testWidgets('atividade executa código e apresenta a saída no editor', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 3000));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      const MaterialApp(home: ActivityEditorPage(activityId: 'sum')),
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
