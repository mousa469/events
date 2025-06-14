import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Or extends StatelessWidget {
  const Or({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 20.w,
            color: AppColors.primaryColor,
            thickness: 1,
          ),
        ),
        Text(
          S.of(context).or,
          style: AppStyles.style16Medium.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Expanded(
          child: Divider(
            indent: 20.w,
            color: AppColors.primaryColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
