import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/widgets/app_logo.dart';
import 'package:events/features/authentication/presentation/widgets/or.dart';
import 'package:events/features/authentication/presentation/widgets/sign_in_form.dart';
import 'package:events/features/authentication/presentation/widgets/social_sign_in_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortraitSignInViewBody extends StatelessWidget {
  const PortraitSignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(child: Container(child: AppLogo())),
          SizedBox(height: 24.h),

          SignInForm(),

          SizedBox(height: 24.h),
          Or(),
          SizedBox(height: 24.h),
          SocialSignInProviders(),
          SizedBox(height: 24.h),
        ],
      ).horizontalPadding(value: 16.h),
    );
  }
}
