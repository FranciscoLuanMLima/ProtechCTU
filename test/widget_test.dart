import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:protechctu/core/services/quiz_gamification_service.dart';
import 'package:protechctu/features/activities/activities_cubit.dart';
import 'package:protechctu/features/activities/activities_page.dart';
import 'package:protechctu/features/activities/activity_editor_page.dart';
import 'package:protechctu/features/auth/auth_cubit.dart';
import 'package:protechctu/features/auth/auth_page.dart';
import 'package:protechctu/features/auth/auth_repository.dart';
import 'package:protechctu/features/concepts/concept_detail_page.dart';
import 'package:protechctu/features/concepts/concepts_cubit.dart';
import 'package:protechctu/features/concepts/concepts_page.dart';
import 'package:protechctu/features/concepts/concepts_repository.dart';
import 'package:protechctu/features/quiz/data/datasources/quiz_catalog_datasource.dart';
import 'package:protechctu/features/quiz/domain/entities/programming_quiz.dart';

void main() {
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
    expect(
      result.profile.achievements.unlockedAchievementIds,
      contains('quiz_perfeito_variables'),
    );
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
    expect(find.text('Matricula'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Criar cadastro'), findsOneWidget);
  });

  testWidgets('abre assunto didatico e volta para lista anterior', (
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

    await tester.tap(find.text('Variaveis e tipos'));
    await tester.pumpAndSettle();

    expect(find.text('O que voce vai aprender'), findsOneWidget);
    expect(find.text('Exemplo em Python'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Variaveis e tipos'), findsOneWidget);
  });

  testWidgets('atividade guiada preserva retorno para lista de praticas', (
    tester,
  ) async {
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
      find.widgetWithText(FilledButton, 'Iniciar pratica').first,
    );
    await tester.pumpAndSettle();

    expect(find.text('Objetivo'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Seu codigo'), 300);
    expect(find.text('Seu codigo'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Pratica orientada'), findsOneWidget);
  });
}
