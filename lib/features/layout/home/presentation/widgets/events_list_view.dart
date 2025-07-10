import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/widgets/event_card.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/home/data/cubits/fetch_user_events/fetch_user_events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key, required this.events});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: AppColors.primaryColor,
        strokeWidth: 3,
        onRefresh: () async {
          BlocProvider.of<FetchUserEventsCubit>(context).isEventsLoaded = false;
          BlocProvider.of<FetchUserEventsCubit>(
            context,
          ).fetchUserEvents(context: context);
        },
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          itemCount: events.length,
          itemBuilder: (context, index) {
            return EventCard(event: events[index]);
          },
        ).horizontalPadding(value: 16.w),
      ),
    );
  }
}
