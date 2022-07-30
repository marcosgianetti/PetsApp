import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:pets_app/data/api/api.dart';
import 'package:pets_app/data/api/api_manager.dart';
import 'package:pets_app/domain/entities/entities.dart';

class HttpClientSpy extends Mock implements ReqAPI {}

void main() {
  late ApiManagerClient apiManager;
  late HttpClientSpy httpClientSpy;
  setUp(() {
    apiManager = ApiManager();
    httpClientSpy = HttpClientSpy();
  });

  test("Should call Cat API corretly", () async {
    late Map<String, String> headersSend;
    late Map<String, String> headersExpect;

    String endPoint = "test";
    headersSend = {"testKey": "testValue"};

    headersExpect = ApiManager.headersCat;
    headersExpect.addAll(headersSend);

    await apiManager.get(
      endPoint: endPoint,
      petType: PetType.cat,
      httpClient: httpClientSpy,
      headers: headersSend,
    );

    verify(httpClientSpy.get(
      endPoint: 'https://api.thecatapi.com/v1/$endPoint/',
      headers: headersExpect,
    )).called(1);
  });

  test("Should call Dog API corretly", () async {
    late Map<String, String> headersSend;
    late Map<String, String> headersExpect;

    String endPoint = "test";
    headersSend = {"testKey": "testValue"};

    headersExpect = ApiManager.headersDog;
    headersExpect.addAll(headersSend);

    await apiManager.get(
      endPoint: endPoint,
      petType: PetType.dog,
      httpClient: httpClientSpy,
      headers: headersSend,
    );

    verify(httpClientSpy.get(
      endPoint: 'https://api.thedogapi.com/v1/$endPoint/',
      headers: headersExpect,
    )).called(1);
  });

  test("Should return error if Type request is invalid", () async {
    Response? response = await apiManager.get(endPoint: 'test', petType: PetType.none);

    expect(response!.statusCode, 400);
    expect(jsonDecode(response.body)["message"], "Não há dominio registrado para requisição!");
  });
}
