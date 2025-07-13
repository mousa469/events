import 'dart:developer';

import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/event_info.dart';
import 'package:events/core/widgets/custom_elevated_button.dart';
import 'package:events/core/widgets/custom_snack_bar.dart';
import 'package:events/core/widgets/event_location_button.dart';
import 'package:events/core/widgets/field_label.dart';
import 'package:events/features/layout/choose_event_location/presentation/views/choose_event_location_view.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/create_event/presentation/cubits/create_event/create_event_cubit.dart';
import 'package:events/features/layout/create_event/presentation/widgets/event_info.dart';
import 'package:flutter/material.dart';
import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreateEventForm extends StatefulWidget {
  const CreateEventForm({super.key});

  @override
  State<CreateEventForm> createState() => _CreateEventFormState();
}

class _CreateEventFormState extends State<CreateEventForm> {
  late TextEditingController eventTitle;
  late TextEditingController eventDescription;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? chooseDate;
  String? chooseTime;

  @override
  void initState() {
    super.initState();
    eventTitle = TextEditingController();
    eventDescription = TextEditingController();
  }

  @override
  void dispose() {
    eventTitle.dispose();
    eventDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var eventInfo = Provider.of<EventInformation>(context);
    chooseDate = chooseDate ?? S.of(context).choose_date;
    chooseTime = chooseTime ?? S.of(context).choose_time;

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(label: S.of(context).title),
          SizedBox(height: 8.h),
          CustomTextField(
            onValidate: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).Field_is_required;
              }
              return null;
            },
            controller: eventTitle,
            prefixIcon: const Icon(Icons.edit_square),
            hint: S.of(context).event_title,
          ),
          SizedBox(height: 16.h),
          FieldLabel(label: S.of(context).description),
          SizedBox(height: 8.h),
          CustomTextField(
            onValidate: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).Field_is_required;
              }
              return null;
            },
            controller: eventDescription,
            hint: S.of(context).event_description,
            maxLines: 5,
          ),
          SizedBox(height: 16.h),
          SizedBox(height: 18.h),
          EventInfo(
            icon: Icons.calendar_month,
            title: S.of(context).event_date,
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 2),
              );

              if (date != null) {
                setState(() {
                  chooseDate = DateFormat.yMd().format(date);
                });
              }
            },
            subTitle: chooseDate!,
          ),
          SizedBox(height: 18.h),
          EventInfo(
            icon: Icons.av_timer_rounded,
            title: S.of(context).event_time,
            onTap: () async {
              TimeOfDay? time = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );

              if (time != null) {
                final now = DateTime.now();
                final dateTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  time.hour,
                  time.minute,
                );
                final formattedTime = DateFormat('hh:mma').format(dateTime);
                log("time : ${formattedTime} ");

                setState(() {
                  chooseTime = formattedTime;
                });
              }
            },
            subTitle: chooseTime!,
          ),
          SizedBox(height: 18.h),
          FieldLabel(label: S.of(context).location),
          InkWell(
            onTap: () {
              context.pushNamed(routeName: ChooseEventLocationView.id);
            },
            child: EventLocationButton(title: S.of(context).choose_location),
          ),
          SizedBox(height: 16.h),
          CustomElevatedButton(
            title: S.of(context).add_event,
            backgroundColor: AppColors.primaryColor,
            borderRadius: 16.w,
            width: double.infinity,
            onPressed: () => _handleAddEvent(context, eventInfo),
            textStyle: AppStyles.style20Medium.copyWith(color: AppColors.white),
          ),
        ],
      ).horizontalPadding(value: 16.w),
    );
  }

  void _handleAddEvent(BuildContext context, EventInformation eventInfo) {
    if (!formKey.currentState!.validate()) return;

    final isDateMissing = chooseDate == S.of(context).choose_date;
    final isTimeMissing = chooseTime == S.of(context).choose_time;

    if (isDateMissing || isTimeMissing) {
      _showWarning(context, S.of(context).date_time_require);
      return;
    }

    if (eventInfo.eventLat == null || eventInfo.eventLong == null) {
      _showWarning(context, S.of(context).event_location_requird);
      return;
    }

    BlocProvider.of<CreateEventCubit>(context).createEvent(
      event: Event(
        time: chooseTime!,
        createdAt: DateTime.now().toString(),
        category: eventInfo.chooseCategory(),
        title: eventTitle.text,
        description: eventDescription.text,
        date: chooseDate!,
        lat: eventInfo.eventLat!,
        long: eventInfo.eventLong!,
      ),
      context: context,
    );

    eventTitle.clear();
    eventDescription.clear();
    chooseDate = S.of(context).choose_date;
    chooseTime = S.of(context).choose_time;
    eventInfo.clearEventInfo();
  }

  void _showWarning(BuildContext context, String subTitle) {
    CustomSnackBar(
      type: SnackBarType.warning,
      title: S.of(context).warning,
      subTitle: subTitle,
      context: context,
    );
  }
}
