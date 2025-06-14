import 'package:events/core/theme/app_theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeToggler extends ChangeNotifier {
  bool isLight = true;
  ThemeData appTheme = AppTheme.lightMode;

  void convertToDarkMode() {
    if (appTheme == AppTheme.darkMode) return;
    appTheme = AppTheme.darkMode;
    isLight = false;
    notifyListeners();
  }

  void convertToLightMode() {
    if (appTheme == AppTheme.lightMode) return;

    appTheme = AppTheme.lightMode;
    isLight = true;

    notifyListeners();
  }
}
