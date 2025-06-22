import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialProvider extends StatelessWidget {
  const SocialProvider({
    super.key,
    required this.title,
    required this.img,
    required this.onTap,
  });
  final String title;
  final Widget img;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 70.w,
            vertical: 16.h,
          ),
          child: Row(
            children: [
              img,
              SizedBox(width: 5.w),
              Expanded(
                child: Text(
                  title,
                  style: AppStyles.style20Medium.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
