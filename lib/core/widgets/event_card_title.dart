import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventCardTitle extends StatelessWidget {
  const EventCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeToggler>(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.isLight ? AppColors.white : AppColors.black,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "datadata data datadata datadatadatadatadatadatadata",
                  style: AppStyles.style14Bold,
                ),
              ),
              SizedBox(width: 8.w),

              Icon(Icons.favorite_outline, color: AppColors.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
