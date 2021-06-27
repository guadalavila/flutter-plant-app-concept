import 'package:shared_preferences/shared_preferences.dart';

class SheredPreference {
  static const THEME = "THEME";

  setBool(String key, bool value) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setBool(key, value);
  }

  setString(String key, String value) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(key, value);
  }

  setStringList(String key, List<String> value) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setStringList(key, value);
  }

  setDarkTheme(bool value) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setBool(THEME, value);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getBool(key) ?? false;
  }

  Future<String> getString(String key) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getString(key) ?? '';
  }

  Future<List<String>> getStringList(String key) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getStringList(key) ?? [];
  }
}
