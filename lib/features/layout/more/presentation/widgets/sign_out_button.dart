import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/widgets/custom_elevated_button.dart';
import 'package:events/core/widgets/custom_snack_bar.dart';
import 'package:events/features/authentication/presentation/views/sign_in_view.dart';
import 'package:events/features/layout/more/data/cubits/cubit/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutLoading) {
          EasyLoading.show();
        }

        if (state is SignOutFailure) {
          EasyLoading.dismiss();
          CustomSnackBar(
            type: SnackBarType.failure,
            title: S.of(context).oops,
            subTitle: state.errMessage,
            context: context,
          );
        }

        if (state is SignOutSuccess) {
          EasyLoading.dismiss();
          CustomSnackBar(
            type: SnackBarType.success,
            title: S.of(context).success,
            subTitle: S.of(context).sign_out_successfully,
            context: context,
          );
          context.pushAndRemoveUntil(routeName: SignInView.id);
        }
      },
      child: CustomElevatedButton(
        height: 50.h,
        title: Row(
          children: [
            Icon(Icons.logout, color: Colors.white),
            SizedBox(width: 8),
            Text(
              S.of(context).logout,
              style: AppStyles.style16Medium.copyWith(color: AppColors.white),
            ),
          ],
        ),
        onPressed: () {
          BlocProvider.of<SignOutCubit>(context).SignOut(context: context);
        },
        backgroundColor: Colors.red,
        borderRadius: 16.r,
        width: double.infinity,
      ),
    );
  }
}
