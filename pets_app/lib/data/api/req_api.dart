import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class HttpClient {
  Future<http.Response> get({required String url, Map<String, String> headers = const {}});
}

class HttpClientAdapter implements HttpClient {
  // @GET
  @override
  Future<http.Response> get({required String url, Map<String, String> headers = const {}}) async {
    return await _requisitionHandling(
      endPoint: url,
      headers: headers,
    );
  }

  ////////////////////////////////////////////////////////
  // FUNÇÕES PRIVADAS - ESTRUTURA API
  ////////////////////////////////////////////////////////

  static _requisitionHandling({
    required String endPoint,
    Map<String, String> headers = const {},
  }) async {
    Map<String, String> headersAdd = {'Content-Type': 'application/json', 'Accept': 'application/json'};
    headersAdd.addAll(headers);

    var responseDefault = http.Response(jsonEncode({"message": "Erro desconhecido!"}), 404);
    try {
      responseDefault = await http.get(Uri.parse(endPoint), headers: headersAdd);
    } on SocketException catch (e) {
      if (kDebugMode) debugPrint(e.toString());
      responseDefault = http.Response(jsonEncode({"message": "Verifique sua conexão com a internet!"}), 408);
    } on FormatException catch (e) {
      if (kDebugMode) debugPrint(e.toString());
      responseDefault = http.Response(jsonEncode({"message": "Ocorreu algum erro ao obter dados do servidor!"}), 404);
    } on Exception catch (e) {
      responseDefault = http.Response(jsonEncode({"message": 'Ocorreu um erro: $e'}), 500);
    }
    return responseDefault;
  }
}
