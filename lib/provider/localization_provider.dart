import 'package:crafty_bay/features/CacheStore/savedata.dart';
import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  final savedata = Savedata();

  Locale _locale = Locale('en'); // ✅ safe default

  Locale get local => _locale;

  List<Locale> supportedLocales = [
    Locale('bn'),
    Locale('en'),
  ];

  // ✅ Call this once at startup to restore saved language
  Future<void> loadSavedLocale() async {
    final String? savedLang = await savedata.readData();
    if (savedLang != null) {
      _locale = Locale(savedLang);
      notifyListeners();
    }
  }

  // ✅ Save and apply the new locale
  Future<void> changeLocale(Locale locale) async {
    _locale = locale;
    await savedata.saveData(locale.languageCode.toString());
    notifyListeners();
  }
}