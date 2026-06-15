import '../entities/class_entities.dart';

abstract interface class ClassRepository {
  Future<void> storeClass(ClassEntity academicClass);

  Future<void> saveOwnPublicProfile(
    String requesterId,
    StudentPublicProfileEntity profile,
  );

  Future<ClassEntity?> getOwnClass(String requesterId);

  Future<List<StudentPublicProfileEntity>> listClassmates(String requesterId);

  Future<StudentComparisonEntity> compareWithClassmate(
    String requesterId,
    String comparedStudentId,
  );
}

abstract interface class RankingRepository {
  Future<ClassRankingEntity?> getRanking(String requesterId);

  Future<ClassStatisticsEntity?> getStatistics(String requesterId);

  Future<void> refreshClassAnalytics(String requesterId);
}
