import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/plant.dart';
import 'package:flutter_plant_app/src/utils/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  SheredPreference sharedPreference = SheredPreference();
  late List<Plant> _favorites = [];

  FavoritesProvider() {
    _loadPreference();
  }

  List<Plant> get favorites => _favorites;

  _loadPreference() async {
    List<String> _favString = await sharedPreference.getStringList("FAVS");
    List<Plant> _favs = [];
    _favString.forEach((element) {
      Plant plant = Plant.fromJson(json.decode(element));
      _favs.add(plant);
    });
    _favorites = _favs;
    notifyListeners();
  }

  _updateSharedPreference(Plant plant, bool add) async {
    List<String> _favString = await sharedPreference.getStringList("FAVS");
    if (add) {
      _favString.add(jsonEncode(plant.toJson()));
      await sharedPreference.setStringList("FAVS", _favString);
    } else {
      _favString.remove(jsonEncode(plant.toJson()));
      print(_favString);
      await sharedPreference.setStringList("FAVS", _favString);
    }
  }

  void addToFav(Plant plant) {
    _favorites.add(plant);
    notifyListeners();
    _updateSharedPreference(plant, true);
  }

  void removeFav(Plant plant) {
    _favorites.remove(plant);
    _updateSharedPreference(plant, false);
    notifyListeners();
  }

  bool isFav(Plant plant) {
    var isFavorite = false;
    for (var item in _favorites) {
      if (item.name == plant.name) {
        isFavorite = true;
        break;
      }
    }
    return isFavorite;
  }
}
