import 'package:hive_flutter/hive_flutter.dart';

import '../../app/constants.dart';

class HiveService {
  HiveService._();

  static final instance = HiveService._();

  Future<void> init() async {
    await Hive.initFlutter();
    await Future.wait([
      Hive.openBox(AppConstants.hiveAppBox),
      Hive.openBox(AppConstants.hiveAuthBox),
      Hive.openBox(AppConstants.hiveStudentBox),
      Hive.openBox(AppConstants.hiveActivitiesBox),
    ]);
  }

  Box box(String name) => Hive.box(name);
}
