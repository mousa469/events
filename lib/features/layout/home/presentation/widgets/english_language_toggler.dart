import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/language_toggler.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EnglishLanguageToggler extends StatelessWidget {
  const EnglishLanguageToggler({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeToggler>(context);
    var local = Provider.of<LanguageToggler>(context);

    return InkWell(
      onTap: () {
        if (!local.isEnglish) {
          local.convertLanguageToEnglish();
        } else {
          local.convertLanguageToArabic();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Text(
              local.isEnglish ? "عر" : "En",
              style: AppStyles.style14Bold.copyWith(
                color: theme.isLight ? AppColors.primaryColor : AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
