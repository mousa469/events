import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventLocationButton extends StatelessWidget {
  const EventLocationButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeToggler>(context);
    return AspectRatio(
      aspectRatio: 5.64,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Row(
          children: [
            Container(
              height: 60.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.all(12.h),
              child: Center(
                child: Icon(
                  Icons.my_location_sharp,
                  color: theme.isLight ? AppColors.white : AppColors.black,
                ),
              ),
            ).symmetricPadding(horizontalValue: 8.w, verticalValue: 8.w),

            Expanded(
              child: Text(
                title,
                style: AppStyles.style16Medium.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
