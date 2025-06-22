import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/widgets/custom_elevated_button.dart';
import 'package:events/core/widgets/event_location_button.dart';
import 'package:events/core/widgets/field_label.dart';
import 'package:events/features/layout/create_event/presentation/widgets/event_info.dart';
import 'package:flutter/material.dart';
import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CreateEventForm extends StatefulWidget {
  const CreateEventForm({super.key});

  @override
  State<CreateEventForm> createState() => _CreateEventFormState();
}

class _CreateEventFormState extends State<CreateEventForm> {
  late TextEditingController eventTitle;
  late TextEditingController eventDescription;

  String chooseDate = "Choose Date";
  String chooseTime = "Choose Time";
  @override
  void initState() {
    super.initState();
    eventDescription = TextEditingController();
    eventTitle = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    eventTitle.dispose();
    eventDescription.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label: "Title"),
        SizedBox(height: 8.h),
        CustomTextField(
          prefixIcon: Icon(Icons.edit_square),
          hint: "Event Title",
        ),
        SizedBox(height: 16.h),
        FieldLabel(label: "Description"),
        SizedBox(height: 8.h),
        CustomTextField(hint: "Event Description", maxLines: 5),
        SizedBox(height: 16.h),
        SizedBox(height: 18.h),
        EventInfo(
          icon: Icons.calendar_month,
          title: "Event Date",
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
          subTitle: chooseDate,
        ),
        SizedBox(height: 18.h),

        EventInfo(
          icon: Icons.av_timer_rounded,
          title: "Event Time",
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
              setState(() {
                chooseTime = formattedTime;
              });
            }
          },
          subTitle: chooseTime,
        ),
        SizedBox(height: 18.h),
        FieldLabel(label: "Location"),

        EventLocationButton(title: "Choose Event Location"),
        SizedBox(height: 16.h),
        CustomElevatedButton(
          title: "Add Event",
          backgroundColor: AppColors.primaryColor,
          borderRadius: 16.w,
          width: double.infinity,
          onPressed: () {},
          textStyle: AppStyles.style20Medium.copyWith(color: AppColors.white),
        ),
      ],
    ).horizontalPadding(value: 16.w);
  }
}
