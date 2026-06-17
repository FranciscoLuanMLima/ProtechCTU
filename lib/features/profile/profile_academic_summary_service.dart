import '../auth/auth_model.dart';
import '../user/domain/entities/learning_dashboard.dart';
import '../user/domain/entities/user_profile.dart';
import 'profile_academic_summary.dart';

final class ProfileAcademicSummaryService {
  const ProfileAcademicSummaryService();

  ProfileAcademicSummary build({
    required AuthModel authUser,
    required LearningDashboardSnapshot snapshot,
  }) {
    final user = snapshot.user;
    final topics = snapshot.topics;
    final now = DateTime.now();
    final totalStudyTime = user?.statistics.totalDuration ?? _sumStudy(topics);
    final totalExercises =
        user?.statistics.totalExercises ??
        topics.fold<int>(0, (sum, item) => sum + item.progress.totalAttempts);
    final correctExercises =
        user?.statistics.totalCorrectAnswers ??
        topics.fold<int>(0, (sum, item) => sum + item.progress.correctAttempts);
    final incorrectExercises =
        user?.statistics.totalErrors ?? (totalExercises - correctExercises);
    final accuracyRate =
        user?.statistics.accuracyRate ??
        _rate(correctExercises, totalExercises);
    final strongSubject = _topicName(
      snapshot.strongTopicIds.firstOrNull,
      topics,
    );
    final weakSubject = _topicName(snapshot.weakTopicIds.firstOrNull, topics);
    final subjects = _subjects(snapshot);
    final badges = _badges(user, snapshot);

    return ProfileAcademicSummary(
      header: ProfileHeaderSummary(
        fullName: user?.identification.name ?? authUser.name,
        nickname: _fallback(
          user?.identification.nickname,
          authUser.name.split(' ').first,
        ),
        registration:
            user?.identification.registration ?? authUser.registration,
        course: _fallback(user?.institutional.course, 'Programacao'),
        campus: _fallback(user?.institutional.campus, 'Campus Teresina'),
        currentPeriod: user == null
            ? '1 periodo'
            : '${user.institutional.currentPeriod} periodo',
        entryDate: user == null
            ? authUser.entryYear.toString()
            : user.institutional.startYear.toString(),
        level: user?.progression.level ?? _estimatedLevel(snapshot),
        title:
            user?.progression.title ??
            _titleForLevel(_estimatedLevel(snapshot)),
      ),
      progress: ProfileProgressSummary(
        courseProgress: snapshot.overallProgress,
        currentXp: user?.progression.currentXp ?? _estimatedCurrentXp(snapshot),
        totalXp: user?.progression.totalXp ?? _estimatedTotalXp(snapshot),
        nextLevelXp: user?.progression.nextLevelXp ?? 1000,
        xpToNextLevel: _xpToNextLevel(user, snapshot),
        totalStudyTime: totalStudyTime,
        totalStudySessions:
            user?.statistics.totalSessions ?? _activeDays(snapshot),
      ),
      statistics: ProfileStatisticsSummary(
        completedExercises: totalExercises,
        correctExercises: correctExercises,
        incorrectExercises: incorrectExercises.clamp(0, 1 << 31),
        accuracyRate: accuracyRate,
        averageActivityTime:
            user?.statistics.averageResponseTime ??
            _averageActivityTime(topics),
        strongestSubject: strongSubject,
        weakestSubject: weakSubject,
        totalQuizzes: _quizCount(snapshot),
        completedChallenges: _challengeCount(snapshot),
      ),
      streak: ProfileStreakSummary(
        currentDays:
            user?.streak.currentOffenseDays ?? _currentStreak(snapshot),
        longestDays:
            user?.streak.longestOffenseDays ?? _longestStreak(snapshot),
        lastThirtyDays: _lastThirtyDays(snapshot, now),
        nextReward: _nextStreakReward(
          user?.streak.currentOffenseDays ?? _currentStreak(snapshot),
        ),
        records: _records(user, snapshot),
      ),
      badges: badges,
      subjects: subjects,
      timeline: _timeline(user, snapshot),
      classroom: _classroom(user, snapshot),
      advanced: ProfileAdvancedStatistics(
        activeDays: _activeDays(snapshot),
        averageStudySequence: _averageSequence(snapshot),
        frequentStudyHour: '18:00',
        weeklyEvolution: _recentEvolution(snapshot, 7),
        monthlyEvolution: _recentEvolution(snapshot, 30),
        xpEvolution: _xpEvolution(snapshot),
        performanceEvolution: _performanceEvolution(snapshot),
      ),
      insights: _insights(
        accuracyRate: accuracyRate,
        strongSubject: strongSubject,
        weakSubject: weakSubject,
        streak: user?.streak.currentOffenseDays ?? _currentStreak(snapshot),
        title:
            user?.progression.title ??
            _titleForLevel(_estimatedLevel(snapshot) + 1),
      ),
      visuals: ProfileVisualSummary(
        xpEvolution: _chartValues(
          snapshot.learningCurve,
          (point) => point.estimatedXp.toDouble(),
        ),
        levelEvolution: _chartValues(
          snapshot.learningCurve,
          (point) => point.masteryRate * 10,
        ),
        competencyRadar: _radar(subjects),
        subjectDistribution: _distribution(subjects),
      ),
      settings: ProfileQuickSettings(
        notifications: user?.settings.notifications ?? true,
        sounds: user?.settings.sounds ?? true,
        vibration: user?.settings.vibration ?? true,
        theme: _themeLabel(user?.settings.theme),
        focusMode: user?.settings.focusMode ?? false,
        competitionMode: user?.settings.competitionMode ?? true,
      ),
    );
  }

  static String _fallback(String? value, String fallback) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? fallback : trimmed;
  }

  static Duration _sumStudy(List<TopicDashboardItem> topics) {
    return topics.fold<Duration>(
      Duration.zero,
      (sum, item) => sum + item.progress.totalStudyTime,
    );
  }

  static double _rate(int value, int total) => total == 0 ? 0 : value / total;

  static String _topicName(String? topicId, List<TopicDashboardItem> topics) {
    if (topicId == null) return 'Em construcao';
    return topics
            .where((item) => item.topic.topicId == topicId)
            .map((item) => item.topic.name)
            .firstOrNull ??
        'Em construcao';
  }

  static int _estimatedTotalXp(LearningDashboardSnapshot snapshot) {
    return snapshot.learningCurve.isEmpty
        ? (snapshot.overallProgress * 1200).round()
        : snapshot.learningCurve.last.estimatedXp;
  }

  static int _estimatedCurrentXp(LearningDashboardSnapshot snapshot) {
    return _estimatedTotalXp(snapshot) % 1000;
  }

  static int _estimatedLevel(LearningDashboardSnapshot snapshot) {
    return (_estimatedTotalXp(snapshot) ~/ 1000).clamp(1, 99);
  }

  static int _xpToNextLevel(
    UserProfile? user,
    LearningDashboardSnapshot snapshot,
  ) {
    if (user != null) {
      return (user.progression.nextLevelXp - user.progression.currentXp).clamp(
        0,
        1 << 31,
      );
    }
    return 1000 - _estimatedCurrentXp(snapshot);
  }

  static String _titleForLevel(int level) {
    if (level >= 20) return 'Mestre da Logica';
    if (level >= 12) return 'Programador';
    if (level >= 6) return 'Aprendiz';
    return 'Iniciante';
  }

  static Duration _averageActivityTime(List<TopicDashboardItem> topics) {
    final attempts = topics.fold<int>(
      0,
      (sum, item) => sum + item.progress.totalAttempts,
    );
    if (attempts == 0) return Duration.zero;
    final total = topics.fold<Duration>(
      Duration.zero,
      (sum, item) => sum + item.progress.totalResponseTime,
    );
    return Duration(milliseconds: total.inMilliseconds ~/ attempts);
  }

  static int _quizCount(LearningDashboardSnapshot snapshot) {
    return snapshot.topics
        .where(
          (item) => item.topic.contentTypes.contains(LearningContentType.quiz),
        )
        .fold<int>(0, (sum, item) => sum + item.progress.totalAttempts);
  }

  static int _challengeCount(LearningDashboardSnapshot snapshot) {
    return snapshot.topics
        .where(
          (item) =>
              item.topic.contentTypes.contains(LearningContentType.challenge),
        )
        .where((item) => item.progress.status == TopicStatus.completed)
        .length;
  }

  static List<ProfileSubjectSummary> _subjects(
    LearningDashboardSnapshot snapshot,
  ) {
    final reviews = {
      for (final review in snapshot.reviewsThisWeek) review.topicId,
    };
    return snapshot.topics
        .map((item) {
          final progress = item.progress;
          return ProfileSubjectSummary(
            name: item.topic.name,
            masteryRate: progress.masteryRate,
            masteryStars: progress.masteryStars,
            studyTime: progress.totalStudyTime,
            lastActivity: progress.lastAccess,
            reviewSuggestion:
                reviews.contains(item.topic.topicId) ||
                    progress.status == TopicStatus.reviewRecommended
                ? 'Revisao recomendada'
                : progress.masteryRate >= 0.75
                ? 'Manter ritmo'
                : 'Praticar mais exemplos',
          );
        })
        .toList(growable: false)
      ..sort((a, b) => b.masteryRate.compareTo(a.masteryRate));
  }

  static List<ProfileBadgeSummary> _badges(
    UserProfile? user,
    LearningDashboardSnapshot snapshot,
  ) {
    final progress =
        user?.achievements.inProgress ?? const <AchievementProgress>[];
    final badges = <ProfileBadgeSummary>[
      for (final item in progress)
        ProfileBadgeSummary(
          id: item.achievementId,
          name: _badgeName(item.achievementId),
          description: 'Conclua ${item.target} acoes para desbloquear.',
          rarity: item.rarity,
          progress: _rate(item.progress, item.target),
          unlocked: item.isUnlocked,
        ),
    ];
    if (badges.isEmpty) {
      badges.addAll(<ProfileBadgeSummary>[
        ProfileBadgeSummary(
          id: 'first_steps',
          name: 'Primeiros Passos',
          description: 'Concluir a primeira atividade.',
          rarity: AchievementRarity.common,
          progress: snapshot.overallProgress > 0 ? 1 : 0,
          unlocked: snapshot.overallProgress > 0,
        ),
        ProfileBadgeSummary(
          id: 'logic_builder',
          name: 'Construtor Logico',
          description: 'Alcancar 70% de dominio em 3 assuntos.',
          rarity: AchievementRarity.rare,
          progress: _rate(
            snapshot.topics
                .where((item) => item.progress.masteryRate >= 0.7)
                .length,
            3,
          ).clamp(0, 1),
          unlocked:
              snapshot.topics
                  .where((item) => item.progress.masteryRate >= 0.7)
                  .length >=
              3,
        ),
        ProfileBadgeSummary(
          id: 'streak_master',
          name: 'Ritmo Constante',
          description: 'Estudar por 7 dias consecutivos.',
          rarity: AchievementRarity.epic,
          progress: _rate(_currentStreak(snapshot), 7).clamp(0, 1),
          unlocked: _currentStreak(snapshot) >= 7,
        ),
      ]);
    }
    return badges;
  }

  static String _badgeName(String id) {
    return id
        .split(RegExp('[-_]'))
        .where((part) => part.isNotEmpty)
        .map((part) => '${part[0].toUpperCase()}${part.substring(1)}')
        .join(' ');
  }

  static List<ProfileTimelineEvent> _timeline(
    UserProfile? user,
    LearningDashboardSnapshot snapshot,
  ) {
    final events = <ProfileTimelineEvent>[];
    final now = DateTime.now();
    events.add(
      ProfileTimelineEvent(
        title:
            'Nivel ${user?.progression.level ?? _estimatedLevel(snapshot)} alcancado',
        description:
            user?.progression.title ??
            _titleForLevel(_estimatedLevel(snapshot)),
        occurredAt: user?.updatedAt ?? now,
        icon: ProfileTimelineIcon.level,
      ),
    );
    for (final badge in _badges(
      user,
      snapshot,
    ).where((item) => item.unlocked)) {
      events.add(
        ProfileTimelineEvent(
          title: 'Badge conquistada',
          description: badge.name,
          occurredAt: user?.updatedAt ?? now,
          icon: ProfileTimelineIcon.badge,
        ),
      );
    }
    for (final topic in snapshot.topics.where(
      (item) => item.progress.status == TopicStatus.completed,
    )) {
      events.add(
        ProfileTimelineEvent(
          title: 'Assunto concluido',
          description: topic.topic.name,
          occurredAt: topic.progress.completedAt ?? topic.progress.updatedAt,
          icon: ProfileTimelineIcon.subject,
        ),
      );
    }
    return events..sort((a, b) => b.occurredAt.compareTo(a.occurredAt));
  }

  static ProfileClassroomSummary _classroom(
    UserProfile? user,
    LearningDashboardSnapshot snapshot,
  ) {
    final xp = user?.progression.totalXp ?? _estimatedTotalXp(snapshot);
    final level = user?.progression.level ?? _estimatedLevel(snapshot);
    return ProfileClassroomSummary(
      name: 'Turma ProTech',
      studentCount: 32,
      classAverage: 0.72,
      internalRanking: 8,
      userPosition: xp >= 900 ? 3 : 8,
      userXp: xp,
      classAverageXp: 860,
      userLevel: level,
      classAverageLevel: 4,
    );
  }

  static int _activeDays(LearningDashboardSnapshot snapshot) {
    return snapshot.heatmap
        .where((item) => item.studyTime > Duration.zero)
        .length;
  }

  static int _currentStreak(LearningDashboardSnapshot snapshot) {
    final days = _activeDaySet(snapshot);
    var streak = 0;
    var cursor = DateTime.now();
    for (var index = 0; index < 365; index++) {
      final key = _dayKey(cursor);
      if (!days.contains(key)) break;
      streak++;
      cursor = cursor.subtract(const Duration(days: 1));
    }
    return streak;
  }

  static int _longestStreak(LearningDashboardSnapshot snapshot) {
    final active = _activeDaySet(snapshot).toList()..sort();
    var longest = 0;
    var current = 0;
    String? previous;
    for (final day in active) {
      if (previous == null || _isNextDay(previous, day)) {
        current++;
      } else {
        current = 1;
      }
      longest = current > longest ? current : longest;
      previous = day;
    }
    return longest;
  }

  static Set<String> _activeDaySet(LearningDashboardSnapshot snapshot) {
    return snapshot.heatmap
        .where((item) => item.studyTime > Duration.zero)
        .map((item) => _dayKey(item.day))
        .toSet();
  }

  static bool _isNextDay(String previous, String current) {
    final prev = DateTime.parse(previous);
    final next = DateTime.parse(current);
    return next.difference(prev).inDays == 1;
  }

  static String _dayKey(DateTime day) {
    return DateTime(day.year, day.month, day.day).toIso8601String();
  }

  static List<ProfileActivityDay> _lastThirtyDays(
    LearningDashboardSnapshot snapshot,
    DateTime now,
  ) {
    final active = _activeDaySet(snapshot);
    return List<ProfileActivityDay>.generate(30, (index) {
      final day = DateTime(
        now.year,
        now.month,
        now.day,
      ).subtract(Duration(days: 29 - index));
      return ProfileActivityDay(
        day: day,
        active: active.contains(_dayKey(day)),
      );
    });
  }

  static String _nextStreakReward(int streak) {
    if (streak < 3) return '3 dias: 25 moedas';
    if (streak < 7) return '7 dias: badge Ritmo Constante';
    if (streak < 14) return '14 dias: 100 XP bonus';
    return '30 dias: badge Lendaria';
  }

  static List<String> _records(
    UserProfile? user,
    LearningDashboardSnapshot snapshot,
  ) {
    final longest = user?.streak.longestOffenseDays ?? _longestStreak(snapshot);
    return <String>[
      'Maior ofensiva: $longest dias',
      'Dias ativos no historico: ${_activeDays(snapshot)}',
      'Melhor sequencia media: ${_averageSequence(snapshot).toStringAsFixed(1)} dias',
    ];
  }

  static double _averageSequence(LearningDashboardSnapshot snapshot) {
    final active = _activeDays(snapshot);
    if (active == 0) return 0;
    return (_longestStreak(snapshot) + active / 4) / 2;
  }

  static double _recentEvolution(LearningDashboardSnapshot snapshot, int days) {
    final curve = snapshot.learningCurve;
    if (curve.length < 2) return snapshot.overallProgress;
    final recent = curve.skip((curve.length - days).clamp(0, curve.length - 1));
    final first = recent.first.masteryRate;
    final last = recent.last.masteryRate;
    return (last - first).clamp(-1, 1);
  }

  static double _xpEvolution(LearningDashboardSnapshot snapshot) {
    final curve = snapshot.learningCurve;
    if (curve.length < 2) return 0;
    return (curve.last.estimatedXp - curve.first.estimatedXp).toDouble();
  }

  static double _performanceEvolution(LearningDashboardSnapshot snapshot) {
    final curve = snapshot.learningCurve;
    if (curve.length < 2) return 0;
    return (curve.last.accuracyRate - curve.first.accuracyRate).clamp(-1, 1);
  }

  static List<String> _insights({
    required double accuracyRate,
    required String strongSubject,
    required String weakSubject,
    required int streak,
    required String title,
  }) {
    return <String>[
      'Voce estudou $streak dias consecutivos.',
      'Sua taxa de acerto esta em ${(accuracyRate * 100).round()}%.',
      'Seu melhor assunto e $strongSubject.',
      'Voce esta proximo de desbloquear o nivel $title.',
      'Continue estudando $weakSubject para melhorar sua maestria.',
    ];
  }

  static List<double> _chartValues(
    List<LearningCurvePoint> curve,
    double Function(LearningCurvePoint point) mapper,
  ) {
    if (curve.isEmpty) return const <double>[0.1, 0.25, 0.35, 0.5, 0.7];
    return curve.map(mapper).toList(growable: false);
  }

  static Map<String, double> _radar(List<ProfileSubjectSummary> subjects) {
    final selected = subjects.take(5).toList(growable: false);
    if (selected.isEmpty) {
      return const <String, double>{
        'Logica': 0.2,
        'Variaveis': 0.2,
        'Condicionais': 0.2,
        'Lacos': 0.2,
        'Funcoes': 0.2,
      };
    }
    return {for (final subject in selected) subject.name: subject.masteryRate};
  }

  static Map<String, double> _distribution(
    List<ProfileSubjectSummary> subjects,
  ) {
    final selected = subjects.take(4).toList(growable: false);
    if (selected.isEmpty) {
      return const <String, double>{'A iniciar': 1};
    }
    final total = selected.fold<double>(
      0,
      (sum, item) => sum + item.masteryRate,
    );
    if (total == 0) {
      return {for (final item in selected) item.name: 1 / selected.length};
    }
    return {for (final item in selected) item.name: item.masteryRate / total};
  }

  static String _themeLabel(AppThemePreference? theme) {
    return switch (theme) {
      AppThemePreference.light => 'Claro',
      AppThemePreference.dark => 'Escuro',
      AppThemePreference.system || null => 'Sistema',
    };
  }
}
