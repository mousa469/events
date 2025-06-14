import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/widgets/app_logo.dart';
import 'package:events/features/authentication/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortraitSignUpViewBody extends StatelessWidget {
  const PortraitSignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(child: Container(child: AppLogo())),
          SizedBox(height: 24.h),

          SignUpForm(),
          SizedBox(height: 24.h),
        ],
      ).horizontalPadding(value: 16.h),
    );
  }
}
