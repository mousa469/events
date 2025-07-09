import 'package:events/core/assets/app_assets.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/features/authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:events/features/authentication/presentation/widgets/social_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialSignInProviders extends StatelessWidget {
  const SocialSignInProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
