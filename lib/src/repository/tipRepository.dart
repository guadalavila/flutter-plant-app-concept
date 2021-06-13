import 'package:flutter_plant_app/src/models/tip.dart';
import 'package:flutter_plant_app/src/services/Api.dart';

class TipRepository {
  Api _api = Api();

  Future<Tip> fetchTip() => _api.fetchTip();
}
