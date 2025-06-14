import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/features/authentication/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/widgets/custom_elevated_button.dart';
import 'package:events/core/widgets/custom_text_form_field.dart';

import 'package:events/core/localization/generated/l10n.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          prefixIcon: Icon(Icons.email, color: AppColors.gray),
          hint: S.of(context).email,
          hintColor: AppColors.gray,
          focusBorderColor: AppColors.gray,
          enabledBorderColor: AppColors.gray,
          normalBorderColor: AppColors.gray,
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          isPassword: true,

          prefixIcon: Icon(Icons.lock, color: AppColors.gray),
          hint: S.of(context).password,
          hintColor: AppColors.gray,
          focusBorderColor: AppColors.gray,
          enabledBorderColor: AppColors.gray,
          normalBorderColor: AppColors.gray,
        ),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              S.of(context).Forget_Password_question,
              style: AppStyles.style16Bold.copyWith(
                fontStyle: FontStyle.italic,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),

        CustomElevatedButton(
          title: S.of(context).login,
          backgroundColor: AppColors.primaryColor,
          borderRadius: 16.r,
          width: double.infinity,
          onPressed: () {},
          textStyle: AppStyles.style20Medium.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 24.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).dont_have_account,
              style: AppStyles.style16Medium,
            ),
            InkWell(
              onTap: () {
                context.pushNamed(routeName: SignUpView.id);
              },
              child: Text(
                S.of(context).create_account,
                style: AppStyles.style16Bold.copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
