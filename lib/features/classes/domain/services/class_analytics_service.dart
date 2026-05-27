import '../entities/class_entities.dart';
import 'class_average_service.dart';
import 'ranking_service.dart';

final class ClassAnalyticsResult {
  const ClassAnalyticsResult({required this.ranking, required this.statistics});

  final ClassRankingEntity ranking;
  final ClassStatisticsEntity statistics;
}

final class ClassAnalyticsService {
  const ClassAnalyticsService({
    this.rankingService = const RankingService(),
    this.averageService = const ClassAverageService(),
  });

  final RankingService rankingService;
  final ClassAverageService averageService;

  ClassAnalyticsResult calculate(
    String classId,
    List<StudentPublicProfileEntity> students,
    DateTime at,
  ) {
    final ranking = rankingService.calculate(
      classId: classId,
      students: students,
      at: at,
    );
    return ClassAnalyticsResult(
      ranking: ranking,
      statistics: averageService.calculate(
        classId: classId,
        students: students,
        at: at,
        highlightStudentId: ranking.entries.firstOrNull?.student.studentId,
      ),
    );
  }
}
