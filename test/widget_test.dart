import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protechctu/features/auth/auth_cubit.dart';
import 'package:protechctu/features/auth/auth_page.dart';
import 'package:protechctu/features/auth/auth_repository.dart';

void main() {
  testWidgets('exibe formulario de login', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => AuthCubit(AuthRepository.instance),
          child: const AuthPage(),
        ),
      ),
    );

    expect(find.text('Entrar'), findsWidgets);
    expect(find.text('Matricula'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Criar cadastro'), findsOneWidget);
  });
}
