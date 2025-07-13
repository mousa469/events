import 'dart:async';
import 'dart:developer';

import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/widgets/custom_text_form_field.dart';
import 'package:events/features/layout/choose_event_location/presentation/user_search_location_cubit/user_search_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSearchLocationTextField extends StatefulWidget {
  const UserSearchLocationTextField({super.key});

  @override
  State<UserSearchLocationTextField> createState() =>
      _UserSearchLocationTextFieldState();
}

class _UserSearchLocationTextFieldState
    extends State<UserSearchLocationTextField> {
  Timer? debounce;

  void onSearchChanged(String? address) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(seconds: 1), () {
      if (address == null || address.isEmpty) {
        log("empty string");
      } else {
        BlocProvider.of<UserSearchLocationCubit>(
          context,
        ).userSearchLocation(address: address, context: context);
      }
    });
  }

  late TextEditingController locationController;
  @override
  void initState() {
    super.initState();
    locationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      fillColor: AppColors.white,
      controller: locationController,
      hint: S.of(context).Search_for_your_event_Location,
      onChanged: onSearchChanged,
    ).symmetricPadding(horizontalValue: 16.w, verticalValue: 20.h);
  }
}
