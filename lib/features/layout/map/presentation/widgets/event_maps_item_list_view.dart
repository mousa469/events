import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/map/presentation/widgets/event_map_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventMapsItemListView extends StatelessWidget {
  const EventMapsItemListView({super.key, required this.events});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return  Container(
            height: 130.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventMapItem(event: events[index]);
              },
            ),
          );
  }
}
