import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pets_app/ui/pages/listPets/list_pets_screen.dart';
import 'package:pets_app/ui/pages/login/login_screen.dart';

void main() {
  testWidgets('Should have input text to enter e-mail', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ListPetsScreen()));

    final popupMenuButton = find.byType(PopupMenuButton);
    final logoutRounded = find.byIcon(Icons.logout_rounded);

    expect(popupMenuButton, findsOneWidget);
    expect(logoutRounded, findsNothing);
  });
}
