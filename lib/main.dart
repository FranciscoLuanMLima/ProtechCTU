import 'package:flutter/material.dart';

import 'pages/splash_page.dart';

void main() {
  runApp(const ProtechCtuApp());
}

class ProtechCtuApp extends StatelessWidget {
  const ProtechCtuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Protech CTU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // A rota inicial do app e a tela de Splash.
      home: const SplashPage(),
    );
  }
}
