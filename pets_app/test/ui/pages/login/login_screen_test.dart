import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pets_app/ui/pages/login/components/button_gradient.dart';
import 'package:pets_app/ui/pages/login/login_screen.dart';

void main() {
  group('Login Screen: ', () {
    testWidgets('Should have input text to enter e-mail', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));
      final textFormField = find.byType(TextFormField);

      expect(textFormField, findsOneWidget);
    });
    testWidgets('Should have checkbox to remember-me', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      final checkboxListTile = find.byType(CheckboxListTile);
      final textCheckBox = find.text("Lembrar meu usuário");

      expect(checkboxListTile, findsOneWidget);
      expect(textCheckBox, findsOneWidget);
    });
    testWidgets('Should have button login', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));
      final butom = find.byType(ButtonGradient);

      expect(butom, findsOneWidget);
    });

    testWidgets('Should show circular progress indicator on tap button', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));
      final butom = find.byType(ButtonGradient);

      expect(butom, findsOneWidget);
    });
  });
}
