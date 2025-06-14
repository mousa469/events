import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem({super.key, required this.onBoardingModel});

  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: SvgPicture.asset(onBoardingModel.img),
        ),
        SizedBox(height: 28.h),
        Text(
          onBoardingModel.title,
          style: AppStyles.style20Bold.copyWith(color: AppColors.primaryColor),
        ),
        SizedBox(height: 28.h),
        Text(onBoardingModel.subTitle, style: AppStyles.style16Medium),
      ],
    );
  }
}
