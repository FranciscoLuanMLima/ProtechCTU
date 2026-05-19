import 'package:flutter/material.dart';

import '../models/config_usuario.dart';
import 'login_page.dart';

class DefinicaoPage extends StatefulWidget {
  const DefinicaoPage({super.key});

  @override
  State<DefinicaoPage> createState() => _DefinicaoPageState();
}

class _DefinicaoPageState extends State<DefinicaoPage> {
  final List<String> _niveisProgramacao = [
    'Nada',
    'Pouco',
    'Médio',
    'Avançado',
  ];

  final List<String> _linguagens = ['C++', 'Python', 'JavaScript', 'Java'];

  String? _nivelSelecionado;
  String? _linguagemSelecionada;
  bool _notificacoesAtivadas = false;

  void _continuar() {
    // Validacao simples para garantir que as duas perguntas foram respondidas.
    if (_nivelSelecionado == null || _linguagemSelecionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Responda todas as perguntas antes de continuar.'),
        ),
      );
      return;
    }

    // Simula o salvamento local em memoria usando um objeto de configuracao.
    final configUsuario = ConfigUsuario(
      nivelProgramacao: _nivelSelecionado!,
      linguagemDesejada: _linguagemSelecionada!,
      notificacoesAtivadas: _notificacoesAtivadas,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Respostas salvas: ${configUsuario.nivelProgramacao}, '
          '${configUsuario.linguagemDesejada}, '
          'notificações: ${configUsuario.notificacoesAtivadas ? 'sim' : 'não'}',
        ),
      ),
    );

    debugPrint(
      'ConfigUsuario('
      'nivelProgramacao: ${configUsuario.nivelProgramacao}, '
      'linguagemDesejada: ${configUsuario.linguagemDesejada}, '
      'notificacoesAtivadas: ${configUsuario.notificacoesAtivadas}'
      ')',
    );

    // Navega para a tela de Login placeholder apos coletar as respostas.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Definição de Perfil'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'O quanto você sabe programar?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: _nivelSelecionado,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Selecione seu nível',
                ),
                items: _niveisProgramacao
                    .map(
                      (nivel) => DropdownMenuItem<String>(
                        value: nivel,
                        child: Text(nivel),
                      ),
                    )
                    .toList(),
                // O setState atualiza a tela sempre que o usuario escolhe uma opcao.
                onChanged: (valor) {
                  setState(() {
                    _nivelSelecionado = valor;
                  });
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Qual linguagem você quer aprender?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: _linguagemSelecionada,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Selecione uma linguagem',
                ),
                items: _linguagens
                    .map(
                      (linguagem) => DropdownMenuItem<String>(
                        value: linguagem,
                        child: Text(linguagem),
                      ),
                    )
                    .toList(),
                onChanged: (valor) {
                  setState(() {
                    _linguagemSelecionada = valor;
                  });
                },
              ),
              const SizedBox(height: 24),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Ative as notificações para um melhor estudo!',
                ),
                value: _notificacoesAtivadas,
                onChanged: (valor) {
                  setState(() {
                    _notificacoesAtivadas = valor;
                  });
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 48,
                child: FilledButton(
                  onPressed: _continuar,
                  child: const Text('Continuar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
