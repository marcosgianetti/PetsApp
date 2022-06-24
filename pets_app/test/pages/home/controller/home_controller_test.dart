import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pets_app/domain/entities/entities.dart';
import 'package:pets_app/ui/pages/home/controller/list_pets_controller.dart';

import 'home_controller_test.mocks.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockHomeController extends Mock implements ListPetController {}

@GenerateMocks(
  [],
  customMocks: [
    //MockSpec<HomeController>(returnNullOnMissingStub: true),
    //MockSpec<Character>(returnNullOnMissingStub: true),
    MockSpec<Pet>(returnNullOnMissingStub: true),
    //   MockSpec<http.Client>(returnNullOnMissingStub: true),
  ],
)
void main() {
  ListPetController mockHomeController = MockHomeController();
  final client = MockClient((request) async {
    return Response(jsonEncode({"message": "Erro desconhecido!"}), 404);
  });

  setUp(() {
    mockHomeController = ListPetController();
  });
  group('Home controller: ', () {
    test("Should change loading state ", () {
      expect(mockHomeController.loading, false);

      mockHomeController.changeLoading(true);

      expect(mockHomeController.loading, true);
    });

    test('Should add new characters at list (results)', () {
      expect(mockHomeController.listPet.length, 0);

      mockHomeController.addResults([MockPet()]);

      expect(mockHomeController.listPet.length, 1);
    });
  });

  ///
  /// Não consegui tirar tempo para acabar de fazer todos os testes 😿
  /// Meu XP com testes não é dos mais altos, mas estou farmando para conseguir matar o "mostro" hahaha 😼
  ///

  /* test('Should get api information', () async {
    Character character = Character();
    String end = faker.internet.httpsUrl();

    MockHomeController().getCharacterFromApi(MockBuildContext());

    verify(
      client.get(
        Uri.parse(addCredentialsToUrl("https://gateway.marvel.com/v1/public/characters")),
        headers: any,
      ),
    ).captured;
  });*/
}
