import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pets_app/domain/entities/entities.dart';
import 'package:pets_app/ui/pages/login/controller/login_controller.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockHomeController extends Mock implements LoginController {}

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<Pet>(returnNullOnMissingStub: true),
  ],
)
void main() {
  LoginController mockHomeController = MockHomeController();
  final client = MockClient((request) async {
    return Response(jsonEncode({"message": "Erro desconhecido!"}), 404);
  });

  setUp(() {
    mockHomeController = LoginController();
  });
  group('Home controller: ', () {
    test("Should change loading state ", () {
      expect(mockHomeController.loading, false);

      mockHomeController.changeLoadingState(true);

      expect(mockHomeController.loading, true);
    });

    test("Should change checkbox state ", () {
      expect(mockHomeController.rememberMe, true);

      mockHomeController.changeRememberMe();

      expect(mockHomeController.rememberMe, false);
    });
  });

  test("Sould return email is valid", () {
    String email = faker.internet.email();

    bool value = mockHomeController.verifyEmailValid(email);

    expect(value, true);
  });
  test("Sould return email is invalid", () {
    String email = faker.food.dish();

    bool value = mockHomeController.verifyEmailValid(email);

    expect(value, false);
  });
}
