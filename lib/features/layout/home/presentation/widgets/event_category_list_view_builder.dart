import 'package:events/core/models/event_category_model.dart';
import 'package:events/core/widgets/event_category.dart';
import 'package:flutter/material.dart';

class EventCategoryListViewBuilder extends StatefulWidget {
  const EventCategoryListViewBuilder({super.key});

  @override
  State<EventCategoryListViewBuilder> createState() =>
      _EventCategoryListViewBuilderState();
}

class _EventCategoryListViewBuilderState
    extends State<EventCategoryListViewBuilder> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: EventCategoryModel.Eventcategories(context: context).length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: EventCategory(
            eventCategoryModel: EventCategoryModel.Eventcategories(
              context: context,
            )[index],
            isSelected: currentIndex == index ? true : false,
          ),
        );
      },
    );
  }
}
