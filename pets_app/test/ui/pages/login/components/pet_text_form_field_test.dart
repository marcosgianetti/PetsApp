import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pets_app/ui/pages/login/components/components.dart';

void main() {
  testWidgets(
    'Should show a textFormField',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: PetTextFormField(
                hintText: 'TestTFF',
                controller: TextEditingController(),
              ),
            ),
          ),
        ),
      );
      final resultPTFF = find.byType(PetTextFormField);
      final resultTFF = find.byType(TextFormField);
      final hintText = find.text("TestTFF");

      expect(resultPTFF, findsOneWidget);
      expect(resultTFF, findsOneWidget);
      expect(hintText, findsOneWidget);
    },
  );
}
