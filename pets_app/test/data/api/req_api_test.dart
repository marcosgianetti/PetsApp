import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pets_app/data/api/api.dart';

@GenerateMocks(
  [HttpClientAdapter],
  customMocks: [
    MockSpec<HttpClientAdapter>(as: #MockReqAPIRelaxed),
  ],
)
void main() {
  setUp(() {
    //mockApiTeste = MockApiTeste();
  });
/*
  group('Req api: ', () {
    test('Should return no internet access', () async {
      // ARRANGE
      String urlFake = faker.internet.httpsUrl();

      when(MockReqAPI.get(endPoint: urlFake)).thenAnswer(
        (_) => Future.value(
          http.Response(jsonEncode({"message": "Verifique sua conexão com a internet!"}), 408),
        ),
      );

      // ACT
      var response = await mockApiTeste.get(endPoint: urlFake);

      // ASSERT
      ApiError apiError = apiErrorFromJson(response.body);

      verify(mockApiTeste.get(endPoint: urlFake)).called(1);
      expect(apiError.message!.contains("Verifique sua conexão com a internet!"), true);
    });

    test('Should return error 404 message', () async {
      // ARRANGE
      String urlFake = faker.internet.httpsUrl();

      when(mockApiTeste.get(endPoint: urlFake)).thenAnswer(
        (_) => Future.value(
          http.Response(jsonEncode({"message": "Ocorreu algum erro ao obter dados do servidor!"}), 404),
        ),
      );

      // ACT
      var response = await mockApiTeste.get(endPoint: urlFake);

      // ASSERT
      ApiError apiError = apiErrorFromJson(response.body);

      verify(mockApiTeste.get(endPoint: urlFake)).called(1);
      expect(apiError.message!.contains("Ocorreu algum erro ao obter dados do servidor!"), true);
    });
  });

*/
}
