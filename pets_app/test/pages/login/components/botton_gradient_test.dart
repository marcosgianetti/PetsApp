import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pets_app/ui/pages/login/components/components.dart';

void main() {
  testWidgets(
    'Should show a textFormField',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: ButtonGradient(
                text: "textButton",
              ),
            ),
          ),
        ),
      );
      final button = find.byType(ButtonGradient);
      final buttonType = find.byType(ElevatedButton);
      final text = find.text("textButton");

      expect(button, findsOneWidget);
      expect(buttonType, findsOneWidget);
      expect(text, findsOneWidget);
    },
  );
}
