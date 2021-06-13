import 'dart:convert';

import 'package:flutter_plant_app/src/models/tip.dart';
import 'package:flutter_plant_app/src/utils/funtions.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;

class Api {
  Client client = Client();

  Future<Tip> fetchTip() async {
    final response = await http.get(Uri.parse(getPathApi("tip")));
    if (response.statusCode == 201) {
      return Tip.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      throw Exception('Failed to load Tip');
    }
  }
}
