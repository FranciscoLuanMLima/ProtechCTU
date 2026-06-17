import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/app.dart';
import 'core/services/hive_service.dart';
import 'core/services/logger.dart';
import 'core/services/push_notification_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    AppLogger.info('[INIT] Firebase inicializado');
  } catch (error, stackTrace) {
    AppLogger.info(
      '[INIT] falha ao inicializar Firebase',
      error: error,
      stackTrace: stackTrace,
    );
  }

  AppLogger.info('[INIT] iniciando Hive');
  await HiveService.instance.init();
  AppLogger.info('[INIT] Hive concluido');
  unawaited(PushNotificationService.instance.requestPermissionAndRegister());

  runApp(const ProviderScope(child: ProTechApp()));
}
