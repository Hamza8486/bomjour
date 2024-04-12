import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalizationProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  Future<void> setdarkTheme(bool value) async {
    _darkTheme = value;
    notifyListeners();
    await darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  Locale _locale = Locale('en');

  Locale get locale => _locale;

  Future<void> setLanguage(String languageCode) async {
    _locale = Locale(languageCode);
    notifyListeners();

    // Save the selected language in SharedPreferences
    await darkThemePreference.setLanguage(languageCode);
  }
}

class DarkThemePreference {
  static const THEME_STATUS = "themeStatus";
  static const LANGUAGE_CODE = "languageCode";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
    print(value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var themeValue = prefs.getBool(THEME_STATUS) ?? false;
    return themeValue;
  }

  Future<void> setLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(LANGUAGE_CODE, languageCode);
    print(languageCode);
  }

  Future<String?> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var languageCode = prefs.getString(LANGUAGE_CODE);
    return languageCode;
  }
}
