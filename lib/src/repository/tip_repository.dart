import 'package:flutter_plant_app/src/services/Api.dart';
import 'package:http/http.dart' as http;

class TipRepository {
  Api api = Api();
  Future<http.Response> fetchTips() async {
    return await api.get("tip");
  }
}
