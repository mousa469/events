import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/widgets/brand_header.dart';
import 'package:events/features/on_boarding/presentation/widgets/dots_navigator.dart';
import 'package:events/features/on_boarding/presentation/widgets/on_boarding_page_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortraitOnBoardingViewBody extends StatefulWidget {
  const PortraitOnBoardingViewBody({super.key});

  @override
  State<PortraitOnBoardingViewBody> createState() =>
      _PortraitOnBoardingViewBodyState();
}

class _PortraitOnBoardingViewBodyState
    extends State<PortraitOnBoardingViewBody> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(child: BrandHeader()),

          OnBoardingPageViewBuilder(pageController: pageController),

          DotsNavigator(),
          SizedBox(height: 16.h),
        ],
      ).horizontalPadding(value: 16.w),
    );
  }
}

          // InkWell(
          //   onTap: () {
          //     setState(() {
          //       if (currentIndex <= 2) {
          //         currentIndex++;
          //       }
          //     });
          //   },
          //   child: Container(height: 100, width: 100, color: Colors.red),
          // ),