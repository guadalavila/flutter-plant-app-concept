import 'package:flutter_plant_app/src/utils/funtions.dart';
import 'package:http/http.dart' as http;

class Api {
  get(String path) {
    return http.get(Uri.parse(getPathApi(path)));
  }

  post(String path) {
    return http.post(Uri.parse(getPathApi(path)));
  }
}
