import 'package:events/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class EventCategoryModel {
  final IconData icon;
  final String title;

  EventCategoryModel({required this.icon, required this.title});

 static List<EventCategoryModel> Eventcategories({required BuildContext context}) {
    return [
      EventCategoryModel(icon: Icons.explore, title: S.of(context).all),
      EventCategoryModel(icon: Icons.pedal_bike, title: S.of(context).sport),
      EventCategoryModel(icon: Icons.cake, title: S.of(context).birthday),
      EventCategoryModel(icon: Icons.group, title: S.of(context).meeting),
      EventCategoryModel(icon: Icons.gamepad, title: S.of(context).gaming),
      EventCategoryModel(icon: Icons.restaurant, title: S.of(context).eating),
      EventCategoryModel(icon: Icons.celebration, title: S.of(context).holiday),
      EventCategoryModel(
        icon: Icons.museum_rounded,
        title: S.of(context).exhibition,
      ),
      EventCategoryModel(icon: Icons.work, title: S.of(context).workshop),
      EventCategoryModel(icon: Icons.book, title: S.of(context).bookclub),
    ];
  }
 static List<EventCategoryModel> createEventCategories({required BuildContext context}) {
    return [
      EventCategoryModel(icon: Icons.pedal_bike, title: S.of(context).sport),
      EventCategoryModel(icon: Icons.cake, title: S.of(context).birthday),
      EventCategoryModel(icon: Icons.group, title: S.of(context).meeting),
      EventCategoryModel(icon: Icons.gamepad, title: S.of(context).gaming),
      EventCategoryModel(icon: Icons.restaurant, title: S.of(context).eating),
      EventCategoryModel(icon: Icons.celebration, title: S.of(context).holiday),
      EventCategoryModel(
        icon: Icons.museum_rounded,
        title: S.of(context).exhibition,
      ),
      EventCategoryModel(icon: Icons.work, title: S.of(context).workshop),
      EventCategoryModel(icon: Icons.book, title: S.of(context).bookclub),
    ];
  }


}
