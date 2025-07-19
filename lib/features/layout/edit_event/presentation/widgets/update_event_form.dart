import 'dart:developer';

import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/widgets/custom_text_form_field.dart';
import 'package:events/core/widgets/event_location_button.dart';
import 'package:events/core/widgets/field_label.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/create_event/presentation/widgets/event_info.dart';
import 'package:events/features/layout/edit_event/data/managers/update_event_details/update_event_details_cubit.dart';
import 'package:events/features/layout/edit_event/presentation/views/update_event_location_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UpdateEventForm extends StatefulWidget {
  const UpdateEventForm({super.key, required this.event});

  final Event event;

  @override
  State<UpdateEventForm> createState() => _UpdateEventFormState();
}

class _UpdateEventFormState extends State<UpdateEventForm> {
  late String chooseTime;
  late String chooseDate;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  void initState() {
    super.initState();
    chooseTime = widget.event.time;
    chooseDate = widget.event.date;
    BlocProvider.of<UpdateEventDetailsCubit>(context).date = chooseDate;
    BlocProvider.of<UpdateEventDetailsCubit>(context).time = chooseTime;
    BlocProvider.of<UpdateEventDetailsCubit>(context).title =
        widget.event.title;
    BlocProvider.of<UpdateEventDetailsCubit>(context).description =
        widget.event.description;
    BlocProvider.of<UpdateEventDetailsCubit>(context).lat = widget.event.lat;
    BlocProvider.of<UpdateEventDetailsCubit>(context).long = widget.event.long;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldLabel(label: S.of(context).title),
        SizedBox(height: 16.h),
        CustomTextField(
          onChanged: (title) {
            BlocProvider.of<UpdateEventDetailsCubit>(context).title = title;
          },
          controller: titleController,
          hint: widget.event.title,
        ),
        SizedBox(height: 16.h),
        FieldLabel(label: S.of(context).description),
        SizedBox(height: 16.h),
        CustomTextField(
          onChanged: (description) {
            BlocProvider.of<UpdateEventDetailsCubit>(context).description =
                description;
          },
          controller: descriptionController,
          maxLines: 5,
          hint: widget.event.description,
        ),
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
                BlocProvider.of<UpdateEventDetailsCubit>(context).date =
                    chooseDate;
              });
            }
          },
          subTitle: chooseDate,
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

              setState(() {
                chooseTime = formattedTime;
                BlocProvider.of<UpdateEventDetailsCubit>(context).time =
                    chooseTime;
              });
            }
          },
          subTitle: chooseTime,
        ),

        SizedBox(height: 16.h),
        FieldLabel(label: S.of(context).location),
        SizedBox(height: 16.h),

        InkWell(
          onTap: () {
            context.pushNamed(routeName: UpdateEventLocationView.id);
          },
          child: EventLocationButton(title: widget.event.location!),
        ),
      ],
    );
  }
}
