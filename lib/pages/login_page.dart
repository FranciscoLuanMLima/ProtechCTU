import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'cadastro_page.dart';
import 'perfil_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _matriculaController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _matriculaController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _entrar() {
    if (!_formKey.currentState!.validate()) return;

    final usuario = AuthService.fazerLogin(
      _matriculaController.text.trim(),
      _senhaController.text,
    );

    if (usuario == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Matricula ou senha invalidos.')),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const PerfilPage()),
    );
  }

  void _abrirCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CadastroPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.lock, size: 80),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _matriculaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Matricula',
                    prefixIcon: Icon(Icons.badge),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (valor) {
                    if (valor == null || valor.trim().isEmpty) {
                      return 'Informe a matricula.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _senhaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.password),
                  ),
                  obscureText: true,
                  onFieldSubmitted: (_) => _entrar(),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Informe a senha.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 48,
                  child: FilledButton(
                    onPressed: _entrar,
                    child: const Text('Entrar'),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: _abrirCadastro,
                  child: const Text('Criar cadastro'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
