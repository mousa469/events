import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/widgets/custom_snack_bar.dart';
import 'package:events/features/authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:events/features/authentication/presentation/views/sign_up_view.dart';
import 'package:events/features/layout/presentation/views/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/widgets/custom_elevated_button.dart';
import 'package:events/core/widgets/custom_text_form_field.dart';

import 'package:events/core/localization/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInLoading) {
            EasyLoading.show();
          }

          if (state is SignInSuccess) {
            EasyLoading.dismiss();
            CustomSnackBar(
              type: SnackBarType.success,
              title: S.of(context).success,
              subTitle: S.of(context).signInSuccess,
              context: context,
            );

            context.pushAndRemoveUntil(routeName: LayoutView.id);

          }

          if (state is SignInFailure) {
            EasyLoading.dismiss();

            CustomSnackBar(
              type: SnackBarType.failure,
              title: S.of(context).oops,
              subTitle: state.errMessage,
              context: context,
            );
          }
        },
        child: Column(
          children: [
            CustomTextField(
              controller: emailController,
              prefixIcon: Icon(Icons.email),
              hint: S.of(context).email,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: passwordController,
              isPassword: true,

              prefixIcon: Icon(Icons.lock),
              hint: S.of(context).password,
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
              height: 50.h,
              title: Text(
                S.of(context).login,
                style: AppStyles.style20Medium.copyWith(color: AppColors.white),
              ),
              backgroundColor: AppColors.primaryColor,
              borderRadius: 16.r,
              width: double.infinity,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<SignInCubit>(
                    context,
                  ).signInWithEmailAndPassword(
                    context: context,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                }
              },
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
        ),
      ),
    );
  }
}
