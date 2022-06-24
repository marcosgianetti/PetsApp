import 'package:http/http.dart' as http;

import '../../domain/entities/entities.dart';
import 'api.dart';

class ApiManager {
  static Future<http.Response> get({
    required String endPoint,
    required PetType petType,
    Map<String, String>? headers,
  }) async {
    switch (petType) {
      case PetType.dog:
        if (headers == null) {
          headers = {"x-api-key": "4b3fd568-0fa0-415d-8025-cb0901911c0e"};
        } else {
          headers.addAll({"x-api-key": "4b3fd568-0fa0-415d-8025-cb0901911c0e"});
        }
        return await ReqAPI.get(
          endPoint: 'https://api.thedogapi.com/v1/$endPoint/',
          headers: headers,
        );

      case PetType.cat:
        if (headers == null) {
          headers = {"x-api-key": "b490f700-faf8-4f95-beb7-4c5a4df296e5"};
        } else {
          headers.addAll({"x-api-key": "b490f700-faf8-4f95-beb7-4c5a4df296e5"});
        }
        return await ReqAPI.get(
          endPoint: 'https://api.thecatapi.com/v1/$endPoint/',
          headers: headers,
        );
      case PetType.none:
        throw Exception('PetType should be informed');
    }
  }
}
