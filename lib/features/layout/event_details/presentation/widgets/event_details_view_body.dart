import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/functions.dart';
import 'package:events/core/widgets/field_label.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/create_event/presentation/widgets/event_image.dart';
import 'package:events/features/layout/event_details/presentation/widgets/event_date_and_time_details.dart';
import 'package:events/features/layout/event_details/presentation/widgets/event_location_bloc_builder.dart';
import 'package:events/features/layout/event_details/presentation/widgets/event_location_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.778,
            child: EventImage(
              img: determineEventImage(category: event.category),
            ),
          ),

          SizedBox(height: 16.h),

          Text(
            event.title,
            style: AppStyles.style20Medium.copyWith(
              fontSize: 24,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 16.h),

          EventDateAndTimeDetails(date: event.date, time: event.time),

          SizedBox(height: 16.h),
          EventLocationBlocBuilder(lat: event.lat, long: event.long),
          SizedBox(height: 16.h),
          EventLocationMap(lat: event.lat, long: event.long),
          SizedBox(height: 16.h),

          FieldLabel(label: S.of(context).description),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(event.description, style: AppStyles.style16Medium)],
          ),
        ],
      ).symmetricPadding(horizontalValue: 16.w, verticalValue: 16.h),
    );
  }
}
