import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';

class AppPreferance {
  const AppPreferance();

  Future clearPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future saveData<T>(String key, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (T) {
      case bool:
        await prefs.setBool(key, value as bool);
        break;
      case double:
        await prefs.setDouble(key, value as double);
        break;
      case int:
        await prefs.setInt(key, value as int);
        break;
      case String:
        await prefs.setString(key, value as String);
        break;
      case Data:
        try {
          await prefs.setString(key, jsonEncode((value as Data).toMap()));
        } catch (e) {
          throw UnimplementedError('Data to Map failing in preference save');
        }
        break;
      default:
        try {
          await prefs.setString(key, jsonEncode(value));
        } catch (e) {
          throw ArgumentError('value is instance without proper mapper');
        }
        break;
    }
  }

  Future<T> loadData<T>(String key, {T defaultValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(key)) return defaultValue;

    switch (T) {
      case bool:
        return prefs.getBool(key) as T;
      case double:
        return prefs.getDouble(key) as T;
      case int:
        return prefs.getInt(key) as T;
      case String:
        return prefs.getString(key) as T;
      case Data:
        try {
          final jsonMap = jsonDecode(prefs.getString(key));
          final data = DataParserFactory.get().decode<T>(jsonMap);
          return data;
        } catch (e) {
          throw UnimplementedError('ParserFactory didn\'t have parser of $T');
        }
        break;
      default:
        try {
          final jsonMap = jsonDecode(prefs.getString(key));
          return jsonMap as T;
        } catch (e) {
          throw ArgumentError('value is instance without proper decoder');
        }
        break;
    }
  }

  // instance
  static const AppPreferance instance = const AppPreferance();
  static AppPreferance get() => instance;
}
