import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class ProTechApp extends StatelessWidget {
  const ProTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ProTech',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkBlue,
      routerConfig: appRouter,
    );
  }
}
