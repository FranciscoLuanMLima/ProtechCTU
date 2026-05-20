import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_card.dart';
import '../auth/auth_model.dart';
import 'profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<void> _logout(BuildContext context) async {
    await context.read<ProfileCubit>().logout();
    if (context.mounted) context.go(AppRoute.auth.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: BlocBuilder<ProfileCubit, AuthModel?>(
        builder: (context, user) {
          if (user == null) {
            return Center(
              child: AppButton(
                label: 'Entrar',
                icon: Icons.login,
                onPressed: () => context.go(AppRoute.auth.path),
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const Icon(Icons.account_circle, size: 96),
              const SizedBox(height: 24),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProfileRow(label: 'Nome', value: user.name),
                    _ProfileRow(label: 'Matricula', value: user.registration),
                    _ProfileRow(label: 'Sexo', value: user.gender),
                    _ProfileRow(
                      label: 'Ano de entrada',
                      value: user.entryYear.toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              AppButton(
                label: 'Sair',
                icon: Icons.logout,
                outlined: true,
                onPressed: () => _logout(context),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.68)),
            ),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.titleSmall),
          ),
        ],
      ),
    );
  }
}
