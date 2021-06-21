import 'package:flutter/foundation.dart';

class MyProvider with ChangeNotifier {
  String _username = 'Guadis';

  String get username => _username;

  void onChange(value) {
    _username = value;
    //notificamos a los widgets que esten escuchando
    notifyListeners();
  }
}
