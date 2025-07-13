import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/utilies/functions.dart';
import 'package:events/core/widgets/event_card_date.dart';
import 'package:events/core/widgets/event_card_title.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/event_details/presentation/views/event_details_view.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(routeName: EventDetailsView.id ,arguments: event  );
      },
      child: AspectRatio(
        aspectRatio: 1.778,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    determineEventImage(category: event.category),
                  ),
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryColor),
              ),
            ),

            EventCardDate(date: event.date),
            EventCardTitle(
              title: event.title,
              isFavorite: event.isfavourite,
              eventId: event.id!,
            ),
          ],
        ),
      ),
    );
  }
}
