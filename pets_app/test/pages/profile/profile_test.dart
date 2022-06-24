import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pets_app/ui/pages/profile/profile.dart';

void main() {
  group('Profile Screen: ', () {
    testWidgets('Should show circualar progress indicator on init screen', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ProfileScreen()));
      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      expect(circularProgressIndicator, findsOneWidget);
    });
    testWidgets('Should show "Pagina de perfil" while api don\'t response', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ProfileScreen()));
      final appBarTitle = find.text('Pagina de perfil');

      expect(appBarTitle, findsOneWidget);
    });
  });
}
