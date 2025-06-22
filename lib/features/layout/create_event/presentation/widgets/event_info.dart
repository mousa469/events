import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.subTitle,
  });
  final IconData icon;

  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 3.w),
        Text(title, style: AppStyles.style16Medium),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            subTitle,
            style: AppStyles.style16Medium.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
