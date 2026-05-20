import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  static void info(String message, {Object? error, StackTrace? stackTrace}) {
    if (!kDebugMode) return;
    debugPrint('[ProTech] $message');
    if (error != null) debugPrint('Error: $error');
    if (stackTrace != null) debugPrint(stackTrace.toString());
  }
}
