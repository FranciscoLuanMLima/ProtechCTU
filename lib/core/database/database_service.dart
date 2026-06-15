import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'database_config.dart';
import 'database_exception.dart';
import '../services/logger.dart';

final class DatabaseService {
  DatabaseService._(this.isar);

  final Isar isar;
  static Future<DatabaseService>? _instance;

  static Future<DatabaseService> open() async {
    final current = _instance;
    if (current != null) {
      AppLogger.info('[ISAR] reutilizando instancia compartilhada');
      return current;
    }

    AppLogger.info('[ISAR] abrindo instancia compartilhada');
    _instance = _open();
    return _instance!;
  }

  static Future<DatabaseService> _open() async {
    try {
      final directory = await getApplicationSupportDirectory();
      final isar = await Isar.open(
        DatabaseConfig.schemas,
        directory: directory.path,
        name: DatabaseConfig.name,
      );
      AppLogger.info('[ISAR] instancia aberta');
      return DatabaseService._(isar);
    } catch (error, stackTrace) {
      _instance = null;
      AppLogger.info(
        '[ISAR] falha ao abrir',
        error: error,
        stackTrace: stackTrace,
      );
      throw DatabaseException(
        'Nao foi possivel abrir o banco local ISAR.',
        error,
        stackTrace,
      );
    }
  }

  Future<void> close({bool deleteFromDisk = false}) async {
    if (!deleteFromDisk) {
      return;
    }

    try {
      await isar.close(deleteFromDisk: deleteFromDisk);
      _instance = null;
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Nao foi possivel fechar o banco local ISAR.',
        error,
        stackTrace,
      );
    }
  }
}
