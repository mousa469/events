import 'package:events/core/widgets/event_card.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/favorites/data/cubits/fetch_favourite_events/fetch_favourite_events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteEventsList extends StatelessWidget {
  const FavouriteEventsList({super.key, required this.events});
  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<FetchFavouriteEventsCubit>(
          context,
        ).fetchFavouriteEvents(context: context);
      },
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.h);
        },
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventCard(event: events[index]);
        },
      ),
    );
  }
}
