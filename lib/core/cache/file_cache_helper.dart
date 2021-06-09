import 'package:shared_preferences/shared_preferences.dart';

class FileCacheHelper {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> read(String key) async {
    final SharedPreferences prefs = await _prefs;
    final String data = prefs.getString(key);

    return data;
  }

  Future save(String key, String data) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, data);
  }

  Future remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}
