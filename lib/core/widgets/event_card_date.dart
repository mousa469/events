import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventCardDate extends StatelessWidget {
  const EventCardDate({super.key, required this.date});
  final String date;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeToggler>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      height: 70.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: theme.isLight ? AppColors.secondaryWhite : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              date,
              style: AppStyles.style20Bold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Text(
             date,
              style: AppStyles.style14Bold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
