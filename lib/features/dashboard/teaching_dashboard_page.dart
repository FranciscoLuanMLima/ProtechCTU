import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/widgets/app_card.dart';
import '../auth/auth_repository.dart';

class TeachingDashboardPage extends StatelessWidget {
  const TeachingDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard de Ensino'),
        actions: [
          IconButton(
            tooltip: 'Perfil',
            onPressed: () => context.push(AppRoute.profile.path),
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            user == null ? 'Continue seus estudos' : 'Ola, ${user.name}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Acesse seus assuntos, pratique e acompanhe sua jornada de aprendizagem.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Text(
            'Trilha de aprendizagem',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          _DashboardActionCard(
            icon: Icons.menu_book_outlined,
            title: 'Assuntos de programacao',
            description:
                'Consulte os conceitos da trilha e avance nos conteudos.',
            actionLabel: 'Abrir assuntos',
            onPressed: () => context.push(AppRoute.concepts.path),
          ),
          const SizedBox(height: 12),
          _DashboardActionCard(
            icon: Icons.code_outlined,
            title: 'Atividades praticas',
            description:
                'Resolva exercicios e construa sua pratica de programacao.',
            actionLabel: 'Continuar estudo',
            onPressed: () => context.push(AppRoute.activities.path),
          ),
          const SizedBox(height: 12),
          _DashboardActionCard(
            icon: Icons.quiz_outlined,
            title: 'Quiz gamificado',
            description:
                'Teste seu dominio, conquiste XP e moedas e mantenha sua ofensa ativa.',
            actionLabel: 'Responder quiz',
            onPressed: () => context.push(AppRoute.quiz.path),
          ),
          const SizedBox(height: 12),
          _DashboardActionCard(
            icon: Icons.school_outlined,
            title: 'Dados do estudante',
            description: 'Consulte suas informacoes academicas cadastradas.',
            actionLabel: 'Ver estudante',
            onPressed: () => context.push(AppRoute.student.path),
          ),
        ],
      ),
    );
  }
}

class _DashboardActionCard extends StatelessWidget {
  const _DashboardActionCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final String description;
  final String actionLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 12),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(description),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_forward),
            label: Text(actionLabel),
          ),
        ],
      ),
    );
  }
}
