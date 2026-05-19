import 'package:flutter/material.dart';

import '../models/usuario.dart';
import '../services/auth_service.dart';
import 'login_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _senhaController = TextEditingController();
  final _anoEntradaController = TextEditingController();
  final List<String> _opcoesSexo = ['Masculino', 'Feminino', 'Outro'];

  String? _sexoSelecionado;

  @override
  void dispose() {
    _nomeController.dispose();
    _matriculaController.dispose();
    _senhaController.dispose();
    _anoEntradaController.dispose();
    super.dispose();
  }

  void _cadastrar() {
    if (!_formKey.currentState!.validate()) return;

    final matricula = _matriculaController.text.trim();

    if (AuthService.matriculaJaCadastrada(matricula)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Esta matricula ja esta cadastrada.')),
      );
      return;
    }

    final usuario = Usuario(
      nome: _nomeController.text.trim(),
      matricula: matricula,
      senha: _senhaController.text,
      sexo: _sexoSelecionado!,
      anoEntrada: int.parse(_anoEntradaController.text.trim()),
    );

    AuthService.cadastrarUsuario(usuario);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cadastro realizado com sucesso.')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                    prefixIcon: Icon(Icons.person),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: _validarObrigatorio,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _matriculaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Matricula',
                    prefixIcon: Icon(Icons.badge),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: _validarObrigatorio,
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
                  textInputAction: TextInputAction.next,
                  validator: _validarObrigatorio,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _sexoSelecionado,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Sexo',
                    prefixIcon: Icon(Icons.wc),
                  ),
                  items: _opcoesSexo
                      .map(
                        (sexo) => DropdownMenuItem<String>(
                          value: sexo,
                          child: Text(sexo),
                        ),
                      )
                      .toList(),
                  onChanged: (valor) {
                    setState(() {
                      _sexoSelecionado = valor;
                    });
                  },
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Selecione uma opcao.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _anoEntradaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ano de entrada',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _cadastrar(),
                  validator: (valor) {
                    if (valor == null || valor.trim().isEmpty) {
                      return 'Informe o ano de entrada.';
                    }
                    if (int.tryParse(valor.trim()) == null) {
                      return 'Informe um ano valido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 48,
                  child: FilledButton(
                    onPressed: _cadastrar,
                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validarObrigatorio(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Campo obrigatorio.';
    }
    return null;
  }
}
