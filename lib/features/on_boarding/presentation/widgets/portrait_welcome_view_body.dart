import 'package:events/core/assets/app_assets.dart';
import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:events/core/widgets/brand_header.dart';
import 'package:events/core/utilies/language_toggler.dart';
import 'package:events/core/widgets/custom_elevated_button.dart';
import 'package:events/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:events/features/on_boarding/presentation/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PortraitWelcomeViewBody extends StatelessWidget {
  const PortraitWelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LanguageToggler>(context);
    var mode = Provider.of<ThemeToggler>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SafeArea(child: BrandHeader()),
          SizedBox(height: 28.h),
          AspectRatio(
            aspectRatio: 1,
            child: SvgPicture.asset(AppAssets.onboardingImg4),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).personalize_experience,
                style: AppStyles.style20Bold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                S.of(context).choose_theme_language,
                style: AppStyles.style16Medium,
              ),
            ],
          ),
          SizedBox(height: 32.h),

          Switcher(
            leftItem: SvgPicture.asset(AppAssets.lr),
            rightItem: SvgPicture.asset(AppAssets.rl),
            title: S.of(context).language,
            RightItemOnClick: () {
              language.convertLanguageToArabic();
            },
            leftItemOnClick: () {
              language.convertLanguageToEnglish();
            },
            isLeft: language.isEnglish,
          ),
          SizedBox(height: 16.h),

          Switcher(
            leftItem: Icon(
              Icons.light_mode,
              color: mode.isLight ? AppColors.white : AppColors.primaryColor,
            ),
            rightItem: Icon(
              Icons.dark_mode,
              color: mode.isLight ? AppColors.primaryColor : AppColors.white,
            ),
            title: S.of(context).theme,
            RightItemOnClick: () {
              mode.convertToDarkMode();
            },
            leftItemOnClick: () {
              mode.convertToLightMode();
            },
            isLeft: mode.isLight,
          ),
          SizedBox(height: 28.h),

          CustomElevatedButton(
            title: "Let’s Start",
            backgroundColor: AppColors.primaryColor,
            borderRadius: 16.r,
            onPressed: () {
              context.pushAndRemoveUntil(routeName: OnBoardingView.id);
            },
            textStyle: AppStyles.style20Medium.copyWith(color: AppColors.white),
            width: double.infinity,
          ),
          SizedBox(height: 28.h),
        ],
      ).horizontalPadding(value: 16.w),
    );
  }
}
