import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/utils/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  SheredPreference sharedPreference = SheredPreference();
  late bool _darkTheme;

  ThemeProvider() {
    _darkTheme = false;
    _loadPreference();
  }

  bool get darkTheme => _darkTheme;

  void onChange() {
    _darkTheme = !_darkTheme;
    sharedPreference.setBool(KEY_DARK_THEME, _darkTheme ? true : false);
    notifyListeners();
  }

  _loadPreference() async {
    _darkTheme = await sharedPreference.getBool(KEY_DARK_THEME);
    notifyListeners();
  }
}
