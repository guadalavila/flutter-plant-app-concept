import 'dart:convert';

import 'package:flutter_plant_app/src/models/app_exception.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(message: 'Recurso no encontrado');
    }
  }
}
