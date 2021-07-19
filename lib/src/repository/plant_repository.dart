import 'package:flutter_plant_app/src/services/Api.dart';
import 'package:http/http.dart' as http;

class PlantRepository {
  Api api = Api();

  Future<http.Response> fetchPlants() async {
    return await api.get("plants");
  }
}
