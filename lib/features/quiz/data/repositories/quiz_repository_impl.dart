import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../../../core/database/database_exception.dart';
import '../../../../core/services/backup_service.dart';
import '../../../../core/services/quiz_gamification_service.dart';
import '../../../user/data/mappers/user_profile_mapper.dart';
import '../../../user/data/models/user_profile_model.dart';
import '../../../user/domain/entities/learning_dashboard.dart';
import '../../../user/domain/entities/user_profile.dart';
import '../../../user/domain/repositories/learning_dashboard_repository.dart';
import '../../../user/domain/repositories/user_repository.dart';
import '../../domain/entities/programming_quiz.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/quiz_catalog_datasource.dart';
import '../datasources/quiz_local_datasource.dart';
import '../mappers/quiz_attempt_mapper.dart';

final class QuizRepositoryImpl implements QuizRepository {
  QuizRepositoryImpl({
    required QuizCatalogDataSource catalog,
    required QuizLocalDataSource localDataSource,
    required UserRepository userRepository,
    required LearningDashboardRepository learningDashboardRepository,
    required UserBackupService backupService,
    required QuizGamificationService gamification,
    Uuid uuid = const Uuid(),
  }) : _catalog = catalog,
       _localDataSource = localDataSource,
       _userRepository = userRepository,
       _learningDashboardRepository = learningDashboardRepository,
       _backupService = backupService,
       _gamification = gamification,
       _uuid = uuid;

  final QuizCatalogDataSource _catalog;
  final QuizLocalDataSource _localDataSource;
  final UserRepository _userRepository;
  final LearningDashboardRepository _learningDashboardRepository;
  final UserBackupService _backupService;
  final QuizGamificationService _gamification;
  final Uuid _uuid;

  @override
  Future<void> ensureLearnerProfile(QuizLearner learner) async {
    final existing = await _userRepository.getProfile(learner.userId);
    if (existing == null) {
      await _userRepository.saveProfile(
        _gamification.initialProfile(learner, DateTime.now().toUtc()),
      );
    }
  }

  @override
  Future<UserProfile?> getLearnerProfile(String userId) =>
      _userRepository.getProfile(userId);

  @override
  Stream<UserProfile?> watchLearnerProfile(String userId) =>
      _userRepository.watchProfile(userId);

  @override
  Future<List<ProgrammingQuiz>> loadQuizzes() => _catalog.load();

  @override
  Future<ProgrammingQuiz?> findQuiz(String quizId) => _catalog.findById(quizId);

  @override
  Future<List<QuizAttempt>> attemptsForUser(String userId) async {
    final attempts = await _localDataSource.findAttempts(userId);
    return attempts.map(QuizAttemptMapper.toEntity).toList(growable: false);
  }

  @override
  Future<QuizCompletion> submit({
    required QuizLearner learner,
    required ProgrammingQuiz quiz,
    required List<int> selectedOptionIndexes,
    required DateTime startedAt,
  }) async {
    if (selectedOptionIndexes.length != quiz.questions.length) {
      throw const DatabaseException('Responda todas as questões do quiz.');
    }
    await ensureLearnerProfile(learner);
    final profile = await _userRepository.getProfile(learner.userId);
    if (profile == null) {
      throw const DatabaseException('Perfil gamificado indisponível.');
    }
    var correctAnswers = 0;
    for (var index = 0; index < quiz.questions.length; index++) {
      if (selectedOptionIndexes[index] ==
          quiz.questions[index].correctOptionIndex) {
        correctAnswers++;
      }
    }
    final completedAt = DateTime.now().toUtc();
    final attempt = QuizAttempt(
      attemptId: _uuid.v4(),
      userId: learner.userId,
      quizId: quiz.quizId,
      topicId: quiz.topicId,
      selectedOptionIndexes: List<int>.unmodifiable(selectedOptionIndexes),
      correctAnswers: correctAnswers,
      totalQuestions: quiz.questions.length,
      xpEarned: 0,
      coinsEarned: 0,
      startedAt: startedAt.toUtc(),
      completedAt: completedAt,
    );
    final reward = _gamification.apply(
      current: profile,
      quiz: quiz,
      correctAnswers: correctAnswers,
      duration: completedAt.difference(startedAt),
      completedAt: completedAt,
    );
    final rewardedAttempt = QuizAttempt(
      attemptId: attempt.attemptId,
      userId: attempt.userId,
      quizId: attempt.quizId,
      topicId: attempt.topicId,
      selectedOptionIndexes: attempt.selectedOptionIndexes,
      correctAnswers: attempt.correctAnswers,
      totalQuestions: attempt.totalQuestions,
      xpEarned: reward.xpEarned,
      coinsEarned: reward.coinsEarned,
      startedAt: attempt.startedAt,
      completedAt: attempt.completedAt,
    );
    final profileModel = UserProfileMapper.toModel(reward.profile);
    if (profile.synchronization.localBackupEnabled) {
      await _backupService.createSnapshot(
        UserProfileMapper.toModel(profile),
        reason: 'before_quiz_reward',
      );
    }
    await _localDataSource.saveAttemptAndProfile(
      attempt: QuizAttemptMapper.toModel(rewardedAttempt),
      profile: profileModel,
      attemptOperation: _operation(
        learner.userId,
        'quizAttempt',
        rewardedAttempt.attemptId,
        <String, dynamic>{
          'attemptId': rewardedAttempt.attemptId,
          'quizId': quiz.quizId,
          'topicId': quiz.topicId,
          'correctAnswers': correctAnswers,
          'totalQuestions': quiz.questions.length,
          'xpEarned': reward.xpEarned,
          'coinsEarned': reward.coinsEarned,
          'completedAt': completedAt.toIso8601String(),
        },
      ),
      profileOperation: _operation(
        learner.userId,
        'profile',
        learner.userId,
        profileModel.toMap(),
      ),
    );
    await _learningDashboardRepository.recordActivity(
      StudyActivity(
        activityId: 'quiz:${learner.userId}:${rewardedAttempt.attemptId}',
        userId: learner.userId,
        topicId: quiz.topicId,
        type: StudyEventType.quizCompleted,
        occurredAt: completedAt,
        duration: completedAt.difference(startedAt.toUtc()),
        responseTime: null,
        wasCorrect: correctAnswers == quiz.questions.length,
        wasFirstAttempt: true,
        masteryAfterEvent: 0,
      ),
    );
    return QuizCompletion(
      attempt: rewardedAttempt,
      newLevel: reward.profile.progression.level,
      totalXp: reward.profile.progression.totalXp,
      coinsBalance: reward.profile.economy.coins,
      streakDays: reward.profile.streak.currentOffenseDays,
      didLevelUp: reward.didLevelUp,
    );
  }

  UserSyncOperationModel _operation(
    String userId,
    String resourceType,
    String resourceKey,
    Map<String, dynamic> payload,
  ) {
    final now = DateTime.now().toUtc();
    return UserSyncOperationModel()
      ..operationId = _uuid.v4()
      ..userId = userId
      ..resourceType = resourceType
      ..resourceKey = resourceKey
      ..type = SyncOperationType.upsert.name
      ..status = SyncOperationStatus.pending.name
      ..payloadJson = jsonEncode(payload)
      ..createdAt = now
      ..updatedAt = now;
  }
}
