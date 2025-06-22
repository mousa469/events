import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomEasyLoading {
  static easyLoadingSetup() {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.black
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = AppColors.primaryColor
      ..backgroundColor = AppColors.white
      ..indicatorColor = AppColors.primaryColor
      ..textColor = AppColors.black
      ..maskColor = Colors.blue.withValues(alpha: 0.5)
      ..userInteractions = false
      ..dismissOnTap = true;
  }
}
