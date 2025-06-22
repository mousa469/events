import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:events/core/theme/app_colors/app_colors_light_mode.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData lightMode = ThemeData.light().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.red, width: 0),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.gray, width: 0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.gray, width: 0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.gray, width: 0),
      ),
      prefixIconColor: AppColors.gray,
      suffixIconColor: AppColors.gray,
      hintStyle: TextStyle(color: AppColors.gray),
    ),

    textTheme: ThemeData.light().textTheme.copyWith(
      bodyLarge: TextStyle(color: Colors.black), // 👈 added
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsLightMode.appbarBackGroundColor,
    ),
    scaffoldBackgroundColor: AppColorsLightMode.scaffoldBackGroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
      selectedItemColor: AppColors.white, // <-- Add this
      unselectedItemColor: AppColors.white, // <-- Add this
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.primaryColor,
      selectedIconTheme: IconThemeData(color: AppColors.white),
    ),
  );

  static final ThemeData darkMode = ThemeData.dark().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.red, width: 0),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 0),
      ),
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,
      hintStyle: TextStyle(color: AppColors.white),
    ),
    hintColor: AppColors.primaryColor,
    textTheme: ThemeData.dark().textTheme.copyWith(
      bodyLarge: TextStyle(color: Colors.white), // 👈 added
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsDarkMode.appbarBackGroundColor,
    ),
    scaffoldBackgroundColor: AppColorsDarkMode.scaffoldBackGroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColorsDarkMode.primaryColor,
      selectedIconTheme: IconThemeData(color: AppColors.white),
    ),
  );
}
