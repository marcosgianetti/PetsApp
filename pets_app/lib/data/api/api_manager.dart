import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/entities.dart';
import 'api.dart';

abstract class ApiManagerClient {
  Future<http.Response> get({
    required String endPoint,
    required PetType petType,
    Map<String, String>? headers,
    HttpClient? httpClient,
  });
}

class ApiManager implements ApiManagerClient {
  static Map<String, String> headersCat = {"x-api-key": "b490f700-faf8-4f95-beb7-4c5a4df296e5"};
  static Map<String, String> headersDog = {"x-api-key": "4b3fd568-0fa0-415d-8025-cb0901911c0e"};

  @override
  Future<http.Response> get({
    required String endPoint,
    required PetType petType,
    Map<String, String>? headers,
    HttpClient? httpClient,
  }) async {
    httpClient = httpClient ?? ReqAPI();

    switch (petType) {
      case PetType.dog:
        if (headers == null) {
          headers = headersDog;
        } else {
          headers.addAll(headersDog);
        }
        return await httpClient.get(
          url: 'https://api.thedogapi.com/v1/$endPoint/',
          headers: headers,
        );

      case PetType.cat:
        if (headers == null) {
          headers = headersCat;
        } else {
          headers.addAll(headersCat);
        }

        return await httpClient.get(
          url: 'https://api.thecatapi.com/v1/$endPoint/',
          headers: headers,
        );
      case PetType.none:
        return http.Response(jsonEncode({"message": "Não há dominio registrado para requisição!"}), 400);
    }
  }
}
