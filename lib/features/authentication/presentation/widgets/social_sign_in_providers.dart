import 'dart:developer';

import 'package:events/core/assets/app_assets.dart';
import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/widgets/custom_snack_bar.dart';
import 'package:events/features/authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:events/features/authentication/presentation/widgets/social_provider.dart';
import 'package:events/features/layout/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialSignInProviders extends StatelessWidget {
  const SocialSignInProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
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
          context.pushAndRemoveUntil(routeName: HomeView.id);

          return;
        }

        if (state is SignInFailure) {
          EasyLoading.dismiss();

          log("failure message is : ${state.errMessage}");

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
          SocialProvider(
            title: S.of(context).login_google,
            img: SvgPicture.asset(AppAssets.googleIcon),
            onTap: () {
              BlocProvider.of<SignInCubit>(
                context,
              ).signInWithGoogle(context: context);
            },
          ),
          SizedBox(height: 24.h),

          SocialProvider(
            title: S.of(context).login_with_facebook,
            img: SvgPicture.asset(AppAssets.facebookIcon),
            onTap: () {
              BlocProvider.of<SignInCubit>(
                context,
              ).signInWithFacebook(context: context);
            },
          ),
        ],
      ),
    );
  }
}
