import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Themeprovider extends ChangeNotifier {

  ThemeMode _theme = ThemeMode.system;

  ThemeMode get theme => _theme;


  // ✅ Call this once at startup to restore saved language
  Future<void> loadSavedtheme() async {
    SharedPreferences pref= await SharedPreferences.getInstance();
    var theme=pref.getString('theme');
    _theme=ThemeMode.values.byName(theme!);
    notifyListeners();
  }

  // ✅ Save and apply the new locale
  Future<void> changeTheme(ThemeMode theme) async {
    _theme = theme;
    SharedPreferences pref=   await SharedPreferences.getInstance();
    pref.setString('theme', theme.name);

    notifyListeners();

  }
}