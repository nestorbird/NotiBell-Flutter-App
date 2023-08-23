import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

///[StorageHelper] class to provide the functionality to persists the data into the local database
///in key & value format.
class StorageHelper {
  ///Declaring the SharedPreferences instance
  SharedPreferences? _prefs;

  void clearDetails() async {
    await _openDB();
    _prefs!.clear();
  }

  ///Function to get the instance of SharedPreferences
  _openDB() async {
    _prefs = await SharedPreferences.getInstance();
  }

  ///Function for persisting the string data
  void setStringValue(String key, String value) async {
    await _openDB();
    _prefs!.setString(key, value);
  }

  ///Function for persisting the int data
  void setIntValue(String key, int value) async {
    await _openDB();
    _prefs!.setInt(key, value);
  }

  ///Function for persisting the double data
  void setDoubleValue(String key, double value) async {
    await _openDB();
    _prefs!.setDouble(key, value);
  }

  ///Function for persisting the bool data
  void setBoolValue(String key, bool value) async {
    await _openDB();
    _prefs!.setBool(key, value);
  }

  ///Function for persisting the List data
  void setStringLists(String key, List<String> values) async {
    await _openDB();
    _prefs!.setStringList(key, values);
  }

  ///Function for fetching the string data through provided key
  Future<String?> getStringValues(String key) async {
    await _openDB();
    //Return String
    String? stringValue = _prefs!.getString(key);
    log('$stringValue');
    return stringValue ?? "";
  }

  ///Function for fetching the boolean data through provided key
  Future<bool> getBoolValues(String key) async {
    await _openDB();
    //Return bool
    bool? boolValue = _prefs!.getBool(key);
    return boolValue ?? false;
  }

  ///Function for fetching the int data through provided key
  Future<int?> getIntValues(String key) async {
    await _openDB();
    //Return int
    int? intValue = _prefs!.getInt(key);
    return intValue ?? 0;
  }

  ///Function for fetching the double data through provided key
  Future<double?> getDoubleValues(String key) async {
    await _openDB();
    //Return double
    double? doubleValue = _prefs!.getDouble(key);
    return doubleValue ?? 0;
  }

  ///Function for fetching the Object data
  Future<Object?> getObjectValue(String key) async {
    await _openDB();
    //Return Object
    Object? objectValue = _prefs!.get(key);
    return objectValue;
  }

  ///Function for fetching the String list data
  Future<List<String>?> getStringLists(String key) async {
    await _openDB();
    List<String>? listValues = _prefs!.getStringList(key);
    return listValues;
  }
}
