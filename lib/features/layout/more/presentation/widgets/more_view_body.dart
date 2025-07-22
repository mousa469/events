import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/widgets/custom_elevated_button.dart';
import 'package:events/core/widgets/field_label.dart';
import 'package:events/features/layout/more/presentation/widgets/language_drop_down_menu.dart';
import 'package:events/features/layout/more/presentation/widgets/sign_out_button.dart';
import 'package:events/features/layout/more/presentation/widgets/theme_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          FieldLabel(label: S.of(context).language),
          SizedBox(height: 16),

          LangaugeDropDownMenu(),
          SizedBox(height: 16),
          FieldLabel(label: S.of(context).theme),
          SizedBox(height: 16),

          ThemeDropDownMenu(),

          Spacer(),
          SignOutButton(),

          SizedBox(height: 36.h),
        ],
      ).symmetricPadding(horizontalValue: 16.w, verticalValue: 0),
    );
  }
}
