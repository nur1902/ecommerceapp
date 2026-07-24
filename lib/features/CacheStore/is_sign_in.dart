import 'package:shared_preferences/shared_preferences.dart';

class IsSignIn {
  static const String _key = 'islogedin';

  /// Save login status
  static Future<void> saveLoginData(String token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(_key, token);
  }

  /// Check if user is logged in — returns the token, or null if not logged in
  static Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(_key);
  }

  /// Convenience bool check
  static Future<String> isLoggedIn() async {
    final token = await getToken();
    if (token != null && token.isNotEmpty) {
      return token;
    } else {
      return 'getout';
    }
  }

  /// Clear all saved data
  static Future<void> clearLoginInfo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}