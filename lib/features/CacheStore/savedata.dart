import 'package:shared_preferences/shared_preferences.dart';

class Savedata {
  static const String _key = 'language';

  Future<String?> readData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key); // ✅ just return it directly
  }

  Future<void> saveData(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, data); // ✅ overwrites automatically
  }

  Future<void> clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}