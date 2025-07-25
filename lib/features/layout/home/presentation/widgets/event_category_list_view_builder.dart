import 'dart:developer';

import 'package:events/core/models/event_category_model.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/core/widgets/event_category.dart';
import 'package:events/features/layout/fetch_user_events/data/cubits/fetch_user_events/fetch_user_events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            log("the index is : ${index}");
            BlocProvider.of<FetchUserEventsCubit>(
              context,
            ).fetchUserEventsByCategory(
              userCategory: fetchEventCategory(index: index),
            );
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

  fetchEventCategory({required int index}) {
    if (index == 1) {
      return Keys.sport;
    } else if (index == 0) {
      return Keys.All;
    } else if (index == 2) {
      return Keys.Birthday;
    } else if (index == 3) {
      return Keys.meeting;
    } else if (index == 4) {
      return Keys.gaming;
    } else if (index == 5) {
      return Keys.eating;
    } else if (index == 6) {
      return Keys.holiday;
    } else if (index == 7) {
      return Keys.exhibtion;
    } else if (index == 8) {
      return Keys.workshop;
    } else {
      return Keys.bookClub;
    }
  }
}
