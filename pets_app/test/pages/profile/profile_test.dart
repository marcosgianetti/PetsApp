import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pets_app/domain/entities/entities.dart';
import 'package:pets_app/ui/pages/profile/profile.dart';

void main() {
  group(
    'Profile Screen: ',
    () {
      testWidgets('Should show circualar progress indicator on init screen', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: ProfileScreen()));
        final circularProgressIndicator = find.byType(CircularProgressIndicator);

        expect(circularProgressIndicator, findsOneWidget);
      });
      testWidgets(
        'Should show "Pagina de perfil" while api don\'t response',
        (WidgetTester tester) async {
          String fakeId = faker.guid.guid();
          String name = faker.internet.email();
          await tester.pumpWidget(
            MaterialApp(
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  settings: RouteSettings(arguments: [fakeId, PetType.dog, name]),
                  builder: (context) {
                    return ProfileScreen();
                  },
                );
              },
            ),
          );
          final appBarTitle = find.text('Cão - $name');

          expect(appBarTitle, findsOneWidget);
        },
      );
    },
  );
}
