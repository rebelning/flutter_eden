import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static const String token = "TOKEN";
  static const String cookie = "COOKIE";
  static const String proxyIP = "PROXYIP";
  static const String proxyPort = "PROXYPORT";
}

class StorageHelper {
  static SharedPreferences? _prefs;

  static Future<dynamic> _getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<String?> get(String key) async {
    await _getInstance();
    return _prefs?.getString(key);
  }

  static void set(String key, dynamic value) async {
    await _getInstance();
    _prefs?.setString(key, value);
  }

  static void remove(String key) async {
    await _getInstance();
    _prefs?.remove(key);
  }
}
