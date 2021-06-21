import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/plant.dart';

class CatalogProvider with ChangeNotifier {
  //var privada q va a tener el listado de productos
  List<Plant> _catalog = [];
  List<Plant> get catalog => _catalog;

  void addToCatalog(Plant product) {
    _catalog.add(product);
    notifyListeners();
  }

  void removoFromCatalog(Plant product) {
    _catalog.remove(product);
    notifyListeners();
  }

  int getTotal() {
    var _total = 0;
    _catalog.forEach((element) {
      _total += element.price;
    });
    return _total;
  }
}
