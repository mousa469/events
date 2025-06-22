import 'package:events/core/extensions/media_query_extension.dart';
import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:events/features/layout/home/presentation/widgets/english_language_toggler.dart';
import 'package:events/features/layout/home/presentation/widgets/event_category_list_view_builder.dart';
import 'package:events/features/layout/home/presentation/widgets/user_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeViewBodyHeader extends StatelessWidget {
  const HomeViewBodyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeToggler>(context);
    return SafeArea(
      child: Container(
        color: theme.isLight
            ? AppColors.primaryColor
            : AppColorsDarkMode.primaryColor,
        height: context.screenHeight(0.2093),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).welcome_back,
                          style: AppStyles.style14Regular.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          S.of(context).mohamed_mousa,
                          style: AppStyles.style24Bold.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),

                    InkWell(
                      onTap: () {
                        if (theme.isLight) {
                          theme.convertToDarkMode();
                        } else {
                          theme.convertToLightMode();
                        }
                      },
                      child: Icon(Icons.light_mode, color: AppColors.white),
                    ),
                    SizedBox(width: 10.w),
                    EnglishLanguageToggler(),
                  ],
                ),
                SizedBox(height: 8.w),

                UserLocation(city: 'cairo', country: 'egypt'),
              ],
            ).symmetricPadding(horizontalValue: 16.w, verticalValue: 8.h),

            Expanded(
              child: EventCategoryListViewBuilder().customePadding(left: 16.w),
            ),

            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
