import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveString(String key, String value) async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String?> getString(String key) async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<void> saveInt(String key, int value) async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(key, value);
}

Future<int?> getInt(String key) async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key);
}

Future<void> saveBool(String key, bool value) async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}

Future<bool?> getBool(String key) async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key);
}