import 'package:events/core/assets/app_assets.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
const List<String> EventCategories = [
  AppAssets.SportCategory,
  AppAssets.birthdayCategory,
  AppAssets.meetingCategory,
  AppAssets.gamingCategory,
  AppAssets.eatingCategory,
  AppAssets.holidayCategory,
  AppAssets.exhibitionCategory,
  AppAssets.workCategory,
  AppAssets.bookCategory,
];
const double initialCameraZoom = 16;
const String arabic = "عربي";
const String english = "English";
const String dark = "dark";
const String light = "light";
