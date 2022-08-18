import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pets_app/data/api/api.dart';
import 'package:pets_app/data/end_points.dart';
import 'package:pets_app/domain/entities/entities.dart';
import 'package:pets_app/ui/pages/login/controller/login_controller.dart';

import '../../../../data/api/api_manager_test.mocks.dart';

class MockBuildContext extends Mock implements BuildContext {}

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<Pet>(returnNullOnMissingStub: true),
  ],
)
void main() {
  LoginController sut = LoginController();
  final client = MockClient((request) async {
    return Response(jsonEncode({"message": "Erro desconhecido!"}), 404);
  });

  setUp(() {
    sut = LoginController();
  });
  group('Home controller: ', () {
    test("Should change loading state ", () {
      expect(sut.loading, false);

      sut.changeLoadingState(true);

      expect(sut.loading, true);
    });

    test("Should change checkbox state ", () {
      expect(sut.rememberMe, true);

      sut.changeRememberMe();

      expect(sut.rememberMe, false);
    });
  });

  test("Sould return email is valid", () {
    String email = faker.internet.email();

    bool value = sut.verifyEmailValid(email);

    expect(value, true);
  });
  test("Sould return email is invalid", () {
    String email = faker.food.dish();

    bool value = sut.verifyEmailValid(email);

    expect(value, false);
  });

  group("getProfileFromApi:", () {
    HttpClient httpClientSpy = MockHttpClient();
    String email = faker.internet.email();
    group("Fails:", () {
      test("Should return false with default error mensage", () async {
        ///
        /// ARRANGE
        ///
        sut.textEmailLoginController.text = email;
        when(
          httpClientSpy.get(
            url: EndPoint.listUsers,
          ),
        ).thenAnswer((realInvocation) async => Response("", 500));

        ///
        /// ACT
        ///
        bool loginResult = await sut.getProfileFromApi(httpClient: httpClientSpy);

        ///
        /// ASSERT
        ///
        expect(loginResult, false);
        expect(sut.errorText, "Algo de inesperado aconteceu, tente mais tarde");
      });

      test("Should return false with API error mensage", () async {
        ///
        /// ARRANGE
        ///
        String errorstr = "undefined";
        ApiError apiError = ApiError(message: errorstr);
        sut.textEmailLoginController.text = email;

        when(
          httpClientSpy.get(
            url: EndPoint.listUsers,
          ),
        ).thenAnswer((realInvocation) async => Response(apiErrorToJson(apiError), 400));

        ///
        /// ACT
        ///
        bool loginResult = await sut.getProfileFromApi(httpClient: httpClientSpy);

        ///
        /// ASSERT
        ///
        expect(loginResult, false);
        expect(sut.errorText, errorstr);
      });
    });

    test("Should to do login correctly at api", () async {
      ///
      /// ARRANGE
      ///
      sut.rememberMe = false;
      sut.textEmailLoginController.text = email;
      int id = faker.internet.hashCode;
      List<User> users = [User(email: email, id: id)];

      when(
        httpClientSpy.get(url: EndPoint.listUsers),
      ).thenAnswer((realInvocation) async => Response(userToJson(users), 200));

      ///
      /// ACT
      ///
      bool loginResult = await sut.getProfileFromApi(httpClient: httpClientSpy);

      ///
      /// ASSERT
      ///
      expect(loginResult, true);
      expect(sut.errorText, null);
    });
  });
}
