import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/functions.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/map/data/cubits/toggle_between_events_location/toggle_between_events_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventMapItem extends StatelessWidget {
  const EventMapItem({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ToggleBetweenEventsLocationCubit>(
          context,
        ).toggleEventLocation(lat: event.lat, long: event.long);
      },
      child: AspectRatio(
        aspectRatio: 3.41,
        child: Container(
          margin: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: AppColors.secondaryWhite,

            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.primaryColor),
          ),
          padding: EdgeInsets.all(8.r),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1.76,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        determineEventImage(category: event.category),
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                ),
              ),

              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        event.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppStyles.style14Bold.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          Expanded(
                            child: Text(
                              maxLines: 1,
                              event.location!,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.style14Bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
