import 'package:events/features/on_boarding/presentation/widgets/landscape_on_boarding_view_body.dart';
import 'package:events/features/on_boarding/presentation/widgets/portrait_on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return PortraitOnBoardingViewBody();
        } else {
          return LandscapeOnBoardingViewBody();

        }
      },
    );
  }
}
