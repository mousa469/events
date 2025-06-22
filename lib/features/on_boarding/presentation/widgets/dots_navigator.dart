import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/services/hive_local_storage.dart';
import 'package:events/core/services/local_storage.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_theme/theme.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:events/features/authentication/presentation/views/sign_in_view.dart';
import 'package:events/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:events/features/on_boarding/data/provider/on_boarding_current_index.dart';
import 'package:events/features/on_boarding/presentation/widgets/on_boarding_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DotsNavigator extends StatefulWidget {
  const DotsNavigator({super.key});

  @override
  State<DotsNavigator> createState() => _DotsNavigatorState();
}

class _DotsNavigatorState extends State<DotsNavigator> {
  final LocalStorage localStorage = HiveLocalStorage();

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeToggler>(context);
    var index = Provider.of<OnBoardingCurrentIndex>(context);
    return Row(
      children: [
        Visibility(
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,

          visible: index.currentIndex != 0,
          child: OnBoardingNavigator(
            icon: Icons.arrow_back,
            onTap: () {
              if (index.currentIndex > 0) {
                index.decrementCurrentIndex();
              }
            },
          ),
        ),
        Spacer(),
        DotsIndicator(
          position: index.currentIndex,
          animate: true,
          animationDuration: Duration(milliseconds: 300),
          decorator: DotsDecorator(
            color: theme.appTheme == AppTheme.lightMode
                ? AppColors.black
                : AppColors.white,

            activeColor: AppColors.primaryColor,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16.r),
            ),
            activeSize: Size(20.w, 10.h),
          ),
          dotsCount: OnBoardingModel.getOnBoardingModels(
            context: context,
          ).length,
        ),
        Spacer(),
        OnBoardingNavigator(
          icon: Icons.arrow_forward,
          onTap: () {
            if (index.currentIndex == 2) {
              context.pushAndRemoveUntil(routeName: SignInView.id);
              localStorage.setBool(
                value: true,
                key: Keys.isOnBoardingSeenBefore,
              );
              log(
                " the user seen the on boarding before : ${localStorage.getBool(key: Keys.isOnBoardingSeenBefore)} ",
              );
              return;
            }
            index.incrementCurrentIndex();
          },
        ),
      ],
    );
  }
}
