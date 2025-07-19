import 'dart:developer';

import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/services/hive_local_storage.dart';
import 'package:events/core/services/local_storage.dart';
import 'package:events/core/widgets/custom_snack_bar.dart';
import 'package:events/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:events/features/layout/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/widgets/custom_elevated_button.dart';
import 'package:events/core/widgets/custom_text_form_field.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController rePassworsController;
  late GlobalKey<FormState> formKey;
  LocalStorage localStorage = HiveLocalStorage();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    rePassworsController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    rePassworsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: BlocListener<SignUpCubit, SignUpCubitState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            EasyLoading.show();
          }

          if (state is SignUpSuccess) {
            EasyLoading.dismiss();

            context.pushAndRemoveUntil(routeName: HomeView.id);
            CustomSnackBar(
              type: SnackBarType.success,
              title: S.of(context).success,
              subTitle: S.of(context).registration_success,
              context: context,
            );


            return;
          }

          if (state is SignUpFailure) {
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
              onValidate: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).Field_is_required;
                }
                return null;
              },
              controller: nameController,
              prefixIcon: Icon(Icons.person),
              hint: S.of(context).name,
            ),
            SizedBox(height: 16.h),

            CustomTextField(
              onValidate: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).Field_is_required;
                }
                return null;
              },
              controller: emailController,
              prefixIcon: Icon(Icons.email),
              hint: S.of(context).email,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).Field_is_required;
                }
                return null;
              },
              isPassword: true,
              controller: passwordController,

              prefixIcon: Icon(Icons.lock),
              hint: S.of(context).password,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).Field_is_required;
                }
                return null;
              },
              controller: rePassworsController,
              isPassword: true,
              prefixIcon: Icon(Icons.lock),
              hint: S.of(context).re_password,
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
              
              title:Text(S.of(context).create_account , style:  AppStyles.style20Medium.copyWith(
                color: AppColors.white,
              ),) ,
              backgroundColor: AppColors.primaryColor,
              borderRadius: 16.r,
              width: double.infinity,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (passwordController.text == rePassworsController.text) {
                    log("login triggered");
                    BlocProvider.of<SignUpCubit>(
                      context,
                    ).createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                      name: nameController.text,
                      context: context,
                    );
                  } else {
                    CustomSnackBar(
                      type: SnackBarType.warning,
                      title: S.of(context).warning,
                      subTitle: S.of(context).passwords_do_not_match,
                      context: context,
                    );
                  }
                }
              },
            
            ),
            SizedBox(height: 24.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).already_have_account,
                  style: AppStyles.style16Medium,
                ),
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Text(
                    S.of(context).login,
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
