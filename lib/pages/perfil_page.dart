import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'login_page.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  void _sair(BuildContext context) {
    AuthService.sair();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final usuario = AuthService.usuarioAtual;

    if (usuario == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Perfil')),
        body: const Center(child: Text('Nenhum usuario logado.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.account_circle, size: 96),
              const SizedBox(height: 24),
              _DadoPerfil(rotulo: 'Nome', valor: usuario.nome),
              _DadoPerfil(rotulo: 'Matricula', valor: usuario.matricula),
              _DadoPerfil(rotulo: 'Sexo', valor: usuario.sexo),
              _DadoPerfil(
                rotulo: 'Ano de entrada',
                valor: usuario.anoEntrada.toString(),
              ),
              const Spacer(),
              SizedBox(
                height: 48,
                child: FilledButton.icon(
                  onPressed: () => _sair(context),
                  icon: const Icon(Icons.logout),
                  label: const Text('Sair'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DadoPerfil extends StatelessWidget {
  const _DadoPerfil({required this.rotulo, required this.valor});

  final String rotulo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: rotulo,
          border: const OutlineInputBorder(),
        ),
        child: Text(valor, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
