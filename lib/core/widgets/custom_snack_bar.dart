import 'package:events/constants.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SnackBarType { success, failure, warning }

class CustomSnackBar {
  CustomSnackBar({
    required SnackBarType type,
    required String title,
    required String subTitle,
    required BuildContext context,
  }) {
    late Color backgroundColor;
    late IconData icon;

    switch (type) {
      case SnackBarType.failure:
        backgroundColor = Color(0xFFF0AB9A);
        icon = Icons.error_outline;
      case SnackBarType.success:
        backgroundColor = Color(0xFF7FDBB7);
        icon = Icons.done_all;
      case SnackBarType.warning:
        backgroundColor = Color(0xFFFFC786);
        icon = Icons.warning_outlined;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: backgroundColor.withValues(alpha: 0.6),
                offset: Offset(0, 5),
                spreadRadius: 2, // green shadow
              ),
            ],
          ),

          child: Padding(
            padding: EdgeInsetsGeometry.all(16.r),
            child: Row(
              children: [
                Container(
                  height: 50.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(child: Icon(icon, color: Colors.white)),
                ),

                SizedBox(width: 20.h),

                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppStyles.style20Bold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: AppStyles.style16Medium.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {
                    scaffoldMessengerKey.currentState?.clearSnackBars();
                  },
                  child: Icon(Icons.close, color: AppColors.gray),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
