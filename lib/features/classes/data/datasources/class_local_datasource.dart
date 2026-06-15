import 'package:isar_community/isar.dart';

import '../models/class_models.dart';

final class ClassLocalDataSource {
  ClassLocalDataSource(this._isar);

  final Isar _isar;

  Future<void> putClass(AcademicClassModel academicClass) =>
      _isar.writeTxn(() => _isar.academicClassModels.put(academicClass));

  Future<void> putProfile(StudentPublicProfileModel profile) =>
      _isar.writeTxn(() => _isar.studentPublicProfileModels.put(profile));

  Future<StudentPublicProfileModel?> profile(String studentId) => _isar
      .studentPublicProfileModels
      .filter()
      .studentIdEqualTo(studentId)
      .findFirst();

  Future<AcademicClassModel?> academicClass(String classId) =>
      _isar.academicClassModels.filter().classIdEqualTo(classId).findFirst();

  Future<List<StudentPublicProfileModel>> profilesInClass(String classId) =>
      _isar.studentPublicProfileModels
          .filter()
          .classIdEqualTo(classId)
          .findAll();

  Future<void> putAnalytics(
    ClassRankingModel ranking,
    ClassStatisticsModel statistics,
  ) => _isar.writeTxn(() async {
    await _isar.classRankingModels.put(ranking);
    await _isar.classStatisticsModels.put(statistics);
  });

  Future<ClassRankingModel?> ranking(String classId) =>
      _isar.classRankingModels.filter().classIdEqualTo(classId).findFirst();

  Future<ClassStatisticsModel?> statistics(String classId) =>
      _isar.classStatisticsModels.filter().classIdEqualTo(classId).findFirst();

  Future<void> putComparison(StudentComparisonModel comparison) =>
      _isar.writeTxn(() => _isar.studentComparisonModels.put(comparison));
}
