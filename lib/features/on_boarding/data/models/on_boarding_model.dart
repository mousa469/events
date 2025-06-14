import 'package:events/core/assets/app_assets.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnBoardingModel {
  final String img;
  final String title;
  final String subTitle;
  final Widget? option;

  OnBoardingModel({
    required this.img,
    required this.title,
    required this.subTitle,
    this.option,
  });

  static List<OnBoardingModel> getOnBoardingModels({
    required BuildContext context,
  }) {
    return [
      OnBoardingModel(
        img: AppAssets.onboardingImg1,
        title: S.of(context).find_events_title,
        subTitle: S.of(context).find_events_desc,
      ),
      OnBoardingModel(
        img: AppAssets.onboardingImg2,
        title: S.of(context).effortless_planning,
        subTitle: S.of(context).effortless_planning_desc,
      ),
      OnBoardingModel(
        img: AppAssets.onboardingImg3,
        title: S.of(context).connect_share,
        subTitle: S.of(context).connect_share_desc,
      ),
    ];
  }
}
