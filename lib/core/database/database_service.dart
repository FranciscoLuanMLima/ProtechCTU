import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'database_config.dart';
import 'database_exception.dart';

final class DatabaseService {
  DatabaseService._(this.isar);

  final Isar isar;

  static Future<DatabaseService> open() async {
    try {
      final directory = await getApplicationSupportDirectory();
      final isar = await Isar.open(
        DatabaseConfig.schemas,
        directory: directory.path,
        name: DatabaseConfig.name,
      );
      return DatabaseService._(isar);
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Não foi possível abrir o banco local ISAR.',
        error,
        stackTrace,
      );
    }
  }

  Future<void> close({bool deleteFromDisk = false}) async {
    try {
      await isar.close(deleteFromDisk: deleteFromDisk);
    } catch (error, stackTrace) {
      throw DatabaseException(
        'Não foi possível fechar o banco local ISAR.',
        error,
        stackTrace,
      );
    }
  }
}
