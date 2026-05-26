import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/loading.dart';
import 'auth_cubit.dart';
import 'auth_model.dart';
import 'auth_state.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _registration = TextEditingController();
  final _password = TextEditingController();
  final _entryYear = TextEditingController();
  final _genders = const ['Masculino', 'Feminino', 'Outro'];

  String? _gender;

  @override
  void dispose() {
    _name.dispose();
    _registration.dispose();
    _password.dispose();
    _entryYear.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthState state) async {
    if (!_formKey.currentState!.validate()) return;

    final cubit = context.read<AuthCubit>();
    if (state.mode == AuthMode.login) {
      await cubit.login(_registration.text.trim(), _password.text);
      return;
    }

    await cubit.register(
      AuthModel.register(
        name: _name.text.trim(),
        registration: _registration.text.trim(),
        password: _password.text,
        gender: _gender!,
        entryYear: int.parse(_entryYear.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) {
        return previous.message != current.message ||
            previous.user != current.user;
      },
      listener: (context, state) {
        if (state.message != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message!)));
        }
        if (state.user != null) context.go(AppRoute.dashboard.path);
      },
      builder: (context, state) {
        final isRegister = state.mode == AuthMode.register;

        return Scaffold(
          appBar: AppBar(title: Text(isRegister ? 'Cadastro' : 'Entrar')),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          isRegister ? Icons.person_add_alt_1 : Icons.lock,
                          size: 72,
                        ),
                        const SizedBox(height: 24),
                        if (isRegister) ...[
                          TextFormField(
                            controller: _name,
                            decoration: const InputDecoration(
                              labelText: 'Nome',
                              prefixIcon: Icon(Icons.person),
                            ),
                            textInputAction: TextInputAction.next,
                            validator: Validators.required,
                          ),
                          const SizedBox(height: 16),
                        ],
                        TextFormField(
                          controller: _registration,
                          decoration: const InputDecoration(
                            labelText: 'Matrícula',
                            prefixIcon: Icon(Icons.badge),
                          ),
                          textInputAction: TextInputAction.next,
                          validator: Validators.required,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _password,
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: Icon(Icons.password),
                          ),
                          obscureText: true,
                          textInputAction: isRegister
                              ? TextInputAction.next
                              : TextInputAction.done,
                          onFieldSubmitted: (_) => _submit(state),
                          validator: Validators.required,
                        ),
                        if (isRegister) ...[
                          const SizedBox(height: 16),
                          DropdownButtonFormField<String>(
                            initialValue: _gender,
                            decoration: const InputDecoration(
                              labelText: 'Sexo',
                              prefixIcon: Icon(Icons.wc),
                            ),
                            items: _genders
                                .map(
                                  (value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) =>
                                setState(() => _gender = value),
                            validator: Validators.required,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _entryYear,
                            decoration: const InputDecoration(
                              labelText: 'Ano de entrada',
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _submit(state),
                            validator: Validators.year,
                          ),
                        ],
                        const SizedBox(height: 24),
                        state.loading
                            ? const Loading()
                            : AppButton(
                                label: isRegister ? 'Cadastrar' : 'Entrar',
                                icon: isRegister ? Icons.check : Icons.login,
                                onPressed: () => _submit(state),
                              ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: context.read<AuthCubit>().toggleMode,
                          child: Text(
                            isRegister ? 'Já tenho cadastro' : 'Criar cadastro',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
