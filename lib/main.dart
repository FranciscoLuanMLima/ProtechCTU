import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/services/hive_service.dart';
import 'core/services/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.info('[INIT] iniciando Hive');
  await HiveService.instance.init();
  AppLogger.info('[INIT] Hive concluido');

  runApp(const ProviderScope(child: ProTechApp()));
}
