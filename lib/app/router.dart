import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/activities/activities_cubit.dart';
import '../features/activities/activities_page.dart';
import '../features/activities/activity_editor_page.dart';
import '../features/auth/auth_cubit.dart';
import '../features/auth/auth_page.dart';
import '../features/auth/auth_repository.dart';
import '../features/concepts/concept_detail_page.dart';
import '../features/concepts/concepts_cubit.dart';
import '../features/concepts/concepts_page.dart';
import '../features/concepts/concepts_repository.dart';
import '../features/dashboard/teaching_dashboard_page.dart';
import '../features/profile/profile_cubit.dart';
import '../features/profile/profile_page.dart';
import '../features/profile/profile_repository.dart';
import '../features/quiz/quiz_hub_page.dart';
import '../features/quiz/quiz_play_page.dart';
import '../features/questions/questions_cubit.dart';
import '../features/questions/questions_page.dart';
import '../features/splash/splash_cubit.dart';
import '../features/splash/splash_page.dart';
import '../features/student/student_cubit.dart';
import '../features/student/student_page.dart';
import '../features/student/student_repository.dart';
import '../features/triage/triage_cubit.dart';
import '../features/triage/triage_page.dart';

final appRouter = GoRouter(
  initialLocation: AppRoute.splash.path,
  routes: [
    GoRoute(
      path: AppRoute.splash.path,
      name: AppRoute.splash.name,
      builder: (context, state) =>
          BlocProvider(create: (_) => SplashCubit(), child: const SplashPage()),
    ),
    GoRoute(
      path: AppRoute.triage.path,
      name: AppRoute.triage.name,
      builder: (context, state) =>
          BlocProvider(create: (_) => TriageCubit(), child: const TriagePage()),
    ),
    GoRoute(
      path: AppRoute.auth.path,
      name: AppRoute.auth.name,
      builder: (context, state) => BlocProvider(
        create: (_) => AuthCubit(AuthRepository.instance),
        child: const AuthPage(),
      ),
    ),
    GoRoute(
      path: AppRoute.dashboard.path,
      name: AppRoute.dashboard.name,
      builder: (context, state) => const TeachingDashboardPage(),
    ),
    GoRoute(
      path: AppRoute.quiz.path,
      name: AppRoute.quiz.name,
      builder: (context, state) => const QuizHubPage(),
      routes: [
        GoRoute(
          path: ':id',
          name: AppRoute.quizPlay.name,
          builder: (context, state) =>
              QuizPlayPage(quizId: state.pathParameters['id'] ?? ''),
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.questions.path,
      name: AppRoute.questions.name,
      builder: (context, state) => BlocProvider(
        create: (_) => QuestionsCubit(),
        child: const QuestionsPage(),
      ),
    ),
    GoRoute(
      path: AppRoute.student.path,
      name: AppRoute.student.name,
      builder: (context, state) => BlocProvider(
        create: (_) => StudentCubit(StudentRepository.instance)..load(),
        child: const StudentPage(),
      ),
    ),
    GoRoute(
      path: AppRoute.concepts.path,
      name: AppRoute.concepts.name,
      builder: (context, state) => BlocProvider(
        create: (_) => ConceptsCubit(ConceptsRepository.instance)..load(),
        child: const ConceptsPage(),
      ),
      routes: [
        GoRoute(
          path: ':id',
          name: AppRoute.conceptDetail.name,
          builder: (context, state) =>
              ConceptDetailPage(conceptId: state.pathParameters['id'] ?? ''),
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.activities.path,
      name: AppRoute.activities.name,
      builder: (context, state) => BlocProvider(
        create: (_) => ActivitiesCubit()..load(),
        child: const ActivitiesPage(),
      ),
      routes: [
        GoRoute(
          path: 'editor',
          name: AppRoute.activityEditor.name,
          builder: (context, state) => ActivityEditorPage(
            activityId: state.uri.queryParameters['activityId'],
          ),
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.profile.path,
      name: AppRoute.profile.name,
      builder: (context, state) => BlocProvider(
        create: (_) => ProfileCubit(ProfileRepository.instance)..load(),
        child: const ProfilePage(),
      ),
    ),
  ],
);

enum AppRoute {
  splash('/'),
  triage('/triage'),
  auth('/auth'),
  dashboard('/dashboard'),
  quiz('/quiz'),
  quizPlay('/quiz/:id'),
  questions('/questions'),
  student('/student'),
  concepts('/concepts'),
  conceptDetail('/concepts/:id'),
  activities('/activities'),
  activityEditor('/activities/editor'),
  profile('/profile');

  const AppRoute(this.path);

  final String path;
}
