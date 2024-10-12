import 'package:flutter/material.dart';
import 'package:weather_app/services/theme_persistance.dart';
import 'package:weather_app/utils/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemesModeData().lighMode;
  final ThemePersistence _themePersistence = ThemePersistence();

  ThemeProvider() {
    _loadTheme();
  }
  ThemeData get getThemeData => _themeData;
  set setThemeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  Future<void> toggleTheme(bool isDark) async {
    setThemeData =
        isDark ? ThemesModeData().darkMode : ThemesModeData().lighMode;
    await _themePersistence.storeTheme(isDark);
  }

  Future<void> _loadTheme() async {
    bool isDark = await _themePersistence.loadTheme();
    setThemeData =
        isDark ? ThemesModeData().darkMode : ThemesModeData().lighMode;
  }
}
