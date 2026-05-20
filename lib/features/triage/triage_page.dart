import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/constants.dart';
import '../../app/router.dart';
import '../../core/widgets/app_button.dart';

class TriagePage extends StatelessWidget {
  const TriagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppConstants.logoPath, height: 112),
                  const SizedBox(height: 32),
                  Text(
                    AppConstants.appName,
                    textAlign: TextAlign.center,
                    style: textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Bem-vindo ao seu ambiente de apoio ao aprendizado em tecnologia.',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.76),
                    ),
                  ),
                  const SizedBox(height: 36),
                  AppButton(
                    label: 'Entrar',
                    icon: Icons.login,
                    onPressed: () => context.go(AppRoute.auth.path),
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    label: 'Responder perguntas',
                    icon: Icons.quiz_outlined,
                    outlined: true,
                    onPressed: () => context.go(AppRoute.questions.path),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
