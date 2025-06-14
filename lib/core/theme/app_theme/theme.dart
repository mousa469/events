import 'package:events/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:events/core/theme/app_colors/app_colors_light_mode.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData lightMode = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsLightMode.appbarBackGroundColor,
    ),
    scaffoldBackgroundColor: AppColorsLightMode.scaffoldBackGroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorsLightMode.primaryColor,
    ),
  );

  static final ThemeData darkMode = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsDarkMode.appbarBackGroundColor,
    ),
    scaffoldBackgroundColor: AppColorsDarkMode.scaffoldBackGroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorsDarkMode.primaryColor,
    ),
  );
}
