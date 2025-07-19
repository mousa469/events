import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/widgets/custom_elevated_button.dart';
import 'package:events/core/widgets/custom_snack_bar.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/edit_event/data/managers/update_event_details/update_event_details_cubit.dart';
import 'package:events/features/layout/edit_event/presentation/widgets/event_category_drop_down_menu.dart';
import 'package:events/features/layout/edit_event/presentation/widgets/update_event_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditEventViewBody extends StatefulWidget {
  const EditEventViewBody({super.key, required this.event});
  final Event event;

  @override
  State<EditEventViewBody> createState() => _EditEventViewBodyState();
}

class _EditEventViewBodyState extends State<EditEventViewBody> {
  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<UpdateEventDetailsCubit, UpdateEventDetailsState>(
        listener: (context, state) {
          if (state is UpdateEventDetailsLoading) {
            EasyLoading.show();
          }

          if (state is UpdateEventDetailsFailure) {
            EasyLoading.dismiss();

            CustomSnackBar(
              type: SnackBarType.failure,
              title: S.of(context).oops,
              subTitle: state.errMessage,
              context: context,
            );
          }

          if (state is UpdateEventDetailsSuccess) {
            EasyLoading.dismiss();

            CustomSnackBar(
              type: SnackBarType.success,
              title: S.of(context).success,
              subTitle: S.of(context).Event_Updated_successfully,
              context: context,
            );
          }
        },
        child: Column(
          children: [
            EventCategoryDropDownMenu(
              category: widget.event.category,
              onCategorySelected: (String category) {
                setState(() {
                  BlocProvider.of<UpdateEventDetailsCubit>(context).category =
                      category;
                });
              },
            ),
            SizedBox(height: 16.h),
            UpdateEventForm(event: widget.event),
            SizedBox(height: 16.h),

            CustomElevatedButton(
              height: 50.h,
              title: Text(
                S.of(context).update_event,
                style: AppStyles.style20Medium.copyWith(color: AppColors.white),
              ),
              backgroundColor: AppColors.primaryColor,
              borderRadius: 16.r,
              width: double.infinity,
              onPressed: () {
                BlocProvider.of<UpdateEventDetailsCubit>(
                  context,
                ).updateEventDetails(event: widget.event, context: context);
              },
            ),
          ],
        ),
      ).symmetricPadding(horizontalValue: 16.w, verticalValue: 16.h),
    );
  }
}
