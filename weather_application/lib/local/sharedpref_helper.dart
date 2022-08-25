import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class sharedhelper {
  static late SharedPreferences sharedPreferences;
  static initPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    return await sharedPreferences.setDouble(key, value);
  }
}
