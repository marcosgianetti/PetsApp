import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pets_app/ui/pages/home/list_pets_screen.dart';

void main() {
  group('Home Screen: ', () {
    testWidgets('Should show circualar progress indicator on init screen', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ListPetsScreen()));
      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      expect(circularProgressIndicator, findsOneWidget);
    });
  });
}
