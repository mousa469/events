import 'package:events/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:events/core/theme/app_colors/app_colors_light_mode.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsLightMode.appbarBackGroundColor,
    ),
    scaffoldBackgroundColor: AppColorsLightMode.scaffoldBackGroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorsLightMode.primaryColor,
    ),
  );

  static ThemeData darkMode = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsDarkMode.appbarBackGroundColor,
    ),
    scaffoldBackgroundColor: AppColorsDarkMode.scaffoldBackGroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorsDarkMode.primaryColor,
    ),
  );
}
