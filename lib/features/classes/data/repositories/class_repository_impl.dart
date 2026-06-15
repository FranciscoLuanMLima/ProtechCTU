import '../../../../core/database/database_exception.dart';
import '../../domain/entities/class_entities.dart';
import '../../domain/repositories/class_repository.dart';
import '../../domain/services/class_analytics_service.dart';
import '../../domain/services/student_comparison_service.dart';
import '../datasources/class_local_datasource.dart';
import '../mappers/class_mapper.dart';

final class ClassRepositoryImpl implements ClassRepository, RankingRepository {
  ClassRepositoryImpl({
    required ClassLocalDataSource localDataSource,
    required ClassAnalyticsService analyticsService,
    required StudentComparisonService comparisonService,
  }) : _localDataSource = localDataSource,
       _analyticsService = analyticsService,
       _comparisonService = comparisonService;

  final ClassLocalDataSource _localDataSource;
  final ClassAnalyticsService _analyticsService;
  final StudentComparisonService _comparisonService;

  @override
  Future<void> storeClass(ClassEntity academicClass) async {
    if (academicClass.classId.trim().isEmpty ||
        academicClass.name.trim().isEmpty ||
        academicClass.course.trim().isEmpty ||
        academicClass.period < 1 ||
        academicClass.campus.trim().isEmpty) {
      throw const DatabaseException('Dados da turma invalidos.');
    }
    await _localDataSource.putClass(ClassMapper.classToModel(academicClass));
  }

  @override
  Future<void> saveOwnPublicProfile(
    String requesterId,
    StudentPublicProfileEntity profile,
  ) async {
    if (requesterId != profile.studentId ||
        profile.classId.trim().isEmpty ||
        profile.name.trim().isEmpty ||
        profile.level < 1 ||
        profile.totalXp < 0 ||
        profile.streakDays < 0 ||
        !_isRate(profile.overallProgress) ||
        !_isRate(profile.accuracyRate) ||
        !_isRate(profile.masteryRate)) {
      throw const DatabaseException('Perfil publico de estudante invalido.');
    }
    if (await _localDataSource.academicClass(profile.classId) == null) {
      throw const DatabaseException('Turma vinculada nao encontrada.');
    }
    await _localDataSource.putProfile(ClassMapper.profileToModel(profile));
    await refreshClassAnalytics(requesterId);
  }

  @override
  Future<ClassEntity?> getOwnClass(String requesterId) async {
    final ownProfile = await _membership(requesterId);
    if (ownProfile == null) return null;
    final model = await _localDataSource.academicClass(ownProfile.classId);
    return model == null ? null : ClassMapper.classToEntity(model);
  }

  @override
  Future<List<StudentPublicProfileEntity>> listClassmates(
    String requesterId,
  ) async {
    final ownProfile = await _requireMembership(requesterId);
    final members = await _localDataSource.profilesInClass(ownProfile.classId);
    return members.map(ClassMapper.profileToEntity).toList(growable: false);
  }

  @override
  Future<StudentComparisonEntity> compareWithClassmate(
    String requesterId,
    String comparedStudentId,
  ) async {
    final members = await listClassmates(requesterId);
    final own = _findMember(members, requesterId);
    final compared = _findMember(members, comparedStudentId);
    final result = _comparisonService.compare(
      requester: own,
      colleague: compared,
      at: DateTime.now().toUtc(),
    );
    await _localDataSource.putComparison(ClassMapper.comparisonToModel(result));
    return result;
  }

  @override
  Future<void> refreshClassAnalytics(String requesterId) async {
    final members = await listClassmates(requesterId);
    final result = _analyticsService.calculate(
      members.first.classId,
      members,
      DateTime.now().toUtc(),
    );
    await _localDataSource.putAnalytics(
      ClassMapper.rankingToModel(result.ranking),
      ClassMapper.statisticsToModel(result.statistics),
    );
  }

  @override
  Future<ClassRankingEntity?> getRanking(String requesterId) async {
    final ownProfile = await _membership(requesterId);
    if (ownProfile == null) return null;
    var stored = await _localDataSource.ranking(ownProfile.classId);
    if (stored == null) {
      await refreshClassAnalytics(requesterId);
      stored = await _localDataSource.ranking(ownProfile.classId);
    }
    if (stored == null) return null;
    final classmates = await _localDataSource.profilesInClass(
      ownProfile.classId,
    );
    final byId = <String, StudentPublicProfileEntity>{
      for (final profile in classmates)
        profile.studentId: ClassMapper.profileToEntity(profile),
    };
    return ClassMapper.rankingToEntity(stored, byId);
  }

  @override
  Future<ClassStatisticsEntity?> getStatistics(String requesterId) async {
    final ownProfile = await _membership(requesterId);
    if (ownProfile == null) return null;
    var stored = await _localDataSource.statistics(ownProfile.classId);
    if (stored == null) {
      await refreshClassAnalytics(requesterId);
      stored = await _localDataSource.statistics(ownProfile.classId);
    }
    return stored == null ? null : ClassMapper.statisticsToEntity(stored);
  }

  Future<StudentPublicProfileEntity?> _membership(String requesterId) async {
    if (requesterId.trim().isEmpty) {
      throw const DatabaseException('Usuario solicitante invalido.');
    }
    final profile = await _localDataSource.profile(requesterId);
    return profile == null ? null : ClassMapper.profileToEntity(profile);
  }

  Future<StudentPublicProfileEntity> _requireMembership(
    String requesterId,
  ) async {
    final profile = await _membership(requesterId);
    if (profile == null || profile.classId.isEmpty) {
      throw const DatabaseException('Usuario nao possui turma vinculada.');
    }
    return profile;
  }

  StudentPublicProfileEntity _findMember(
    List<StudentPublicProfileEntity> members,
    String studentId,
  ) {
    for (final member in members) {
      if (member.studentId == studentId) return member;
    }
    throw const DatabaseException('Colega nao pertence a turma do usuario.');
  }

  bool _isRate(double value) => value >= 0 && value <= 1;
}
