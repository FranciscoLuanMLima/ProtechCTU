import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:protechctu/pages/login_page.dart';

void main() {
  testWidgets('exibe formulario de login', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Matricula'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
  });
}
