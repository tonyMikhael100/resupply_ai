import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Singleton instance
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();
  factory SharedPreferencesService() => _instance;
  SharedPreferencesService._internal();

  SharedPreferences? _prefs;

  /// Initialize shared preferences (call this before using the service)
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Save any type of data
  Future<bool> saveData(String key, dynamic value) async {
    if (_prefs == null) {
      throw Exception(
          'SharedPreferencesService not initialized. Call init() first.');
    }

    if (value is String) {
      return await _prefs!.setString(key, value);
    } else if (value is int) {
      return await _prefs!.setInt(key, value);
    } else if (value is double) {
      return await _prefs!.setDouble(key, value);
    } else if (value is bool) {
      return await _prefs!.setBool(key, value);
    } else if (value is List<String>) {
      return await _prefs!.setStringList(key, value);
    } else {
      // Convert any other object to JSON
      String jsonValue = jsonEncode(value);
      return await _prefs!.setString(key, jsonValue);
    }
  }

  /// Get data of any type
  dynamic getData(String key) {
    if (_prefs == null) {
      throw Exception(
          'SharedPreferencesService not initialized. Call init() first.');
    }

    return _prefs!.get(key);
  }

  /// Get a decoded JSON object
  dynamic getJson(String key) {
    if (_prefs == null) {
      throw Exception(
          'SharedPreferencesService not initialized. Call init() first.');
    }

    String? jsonString = _prefs!.getString(key);
    if (jsonString == null) return null;

    try {
      return jsonDecode(jsonString);
    } catch (_) {
      return null;
    }
  }

  /// Remove a specific key
  Future<bool> remove(String key) async {
    if (_prefs == null) {
      throw Exception(
          'SharedPreferencesService not initialized. Call init() first.');
    }
    return await _prefs!.remove(key);
  }

  /// Clear all stored data
  Future<bool> clearAll() async {
    if (_prefs == null) {
      throw Exception(
          'SharedPreferencesService not initialized. Call init() first.');
    }
    return await _prefs!.clear();
  }

  /// Check if a key exists
  bool containsKey(String key) {
    if (_prefs == null) {
      throw Exception(
          'SharedPreferencesService not initialized. Call init() first.');
    }
    return _prefs!.containsKey(key);
  }
}
