import 'package:events/features/layout/map/presentation/widgets/event_map_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventMapsItemsListView extends StatelessWidget {
  const EventMapsItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return EventMapItem();
        },
      ),
    );
  }
}
