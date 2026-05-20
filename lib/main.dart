import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/services/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.instance.init();

  runApp(const ProTechApp());
}
