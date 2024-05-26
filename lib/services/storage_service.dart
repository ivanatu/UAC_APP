import 'dart:convert';

import '/exports/exports.dart';

class StorageService {
  // initialize shared preferences
  static Future<SharedPreferences> _init() async {
    return await SharedPreferences.getInstance();
  }

  // save data to shared preferences
  static Future<bool> saveData(String key, dynamic value) async {
    SharedPreferences _prefs = await _init();
    if (value is String) {
      return await _prefs.setString(key, value);
    } else if (value is int) {
      return await _prefs.setInt(key, value);
    } else if (value is double) {
      return await _prefs.setDouble(key, value);
    } else if (value is bool) {
      return await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      return await _prefs.setStringList(key, value);
    } else if (value is Map) {
      return await _prefs.setString(key, jsonEncode(value));
    } else {
      return false;
    }
  }

  // get data from shared preferences
  static Future<dynamic> getData(String key) async {
    SharedPreferences _prefs = await _init();
    return _prefs.get(key);
  }
}
