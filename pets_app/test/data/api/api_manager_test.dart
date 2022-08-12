import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pets_app/data/api/api.dart';
import 'package:pets_app/domain/entities/entities.dart';

import 'api_manager_test.mocks.dart';

//class HttpClientSpy extends Mock implements ReqAPI {}
@GenerateMocks([], customMocks: [MockSpec<HttpClient>(returnNullOnMissingStub: true)])
void main() {
  late ApiManagerClient sut;
  late MockHttpClient httpClientSpy;

  late Map<String, String> headersSend;

  String endPoint = "test";

  setUp(() {
    sut = ApiManager();
    httpClientSpy = MockHttpClient();
    headersSend = {"testKey": "testValue"};
  });

  test("Should call Cat API corretly", () async {
    String url = 'https://api.thecatapi.com/v1/$endPoint/';
    Map<String, String> headersExpect;

    headersExpect = headersSend;
    headersExpect.addAll(ApiManager.headersCat);

    when(httpClientSpy.get(
      url: url,
      headers: headersExpect,
    )).thenAnswer((_) async => Response("", 200));

    Response response = await sut.get(
      endPoint: endPoint,
      petType: PetType.cat,
      headers: headersSend,
      httpClient: httpClientSpy,
    );

    verify(httpClientSpy.get(
      url: url,
      headers: headersExpect,
    )).called(1);

    expect(response.statusCode, 200);
    expect(response.body, "");
  });

  test("Should call Dog API corretly", () async {
    String url = 'https://api.thedogapi.com/v1/$endPoint/';
    Map<String, String> headersExpect;

    headersExpect = headersSend;
    headersExpect.addAll(ApiManager.headersDog);

    when(httpClientSpy.get(
      url: url,
      headers: headersExpect,
    )).thenAnswer((_) async => Response("", 200));

    Response response = await sut.get(
      endPoint: endPoint,
      petType: PetType.dog,
      headers: headersSend,
      httpClient: httpClientSpy,
    );

    verify(httpClientSpy.get(
      url: url,
      headers: headersExpect,
    )).called(1);

    expect(response.statusCode, 200);
    expect(response.body, "");
  });

  test("Should return error if Type request is invalid", () async {
    Response response = await sut.get(endPoint: 'test', petType: PetType.none);

    expect(response.statusCode, 400);
    expect(jsonDecode(response.body)["message"], "Não há dominio registrado para requisição!");
  });
}
