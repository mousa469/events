import 'package:events/core/assets/app_assets.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/core/widgets/event_card_date.dart';
import 'package:events/core/widgets/event_card_title.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key,required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.778,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(determineEventImage()),
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primaryColor),
            ),
          ),

          EventCardDate(date: event.date),
          EventCardTitle(title: event.title,),
        ],
      ),
    );
  }

  determineEventImage(){
    if(event.category == Keys.gaming){
      return AppAssets.gamingCategory;
    } else if(event.category == Keys.bookClub){
      return AppAssets.bookCategory;
    } else if (event.category == Keys.workshop){
      return AppAssets.workCategory;
    } else if (event.category == Keys.exhibtion){
      return AppAssets.exhibitionCategory;
    } else if (event.category == Keys.holiday){
      return AppAssets.holidayCategory;
    } else if (event.category == Keys.eating){
      return AppAssets.eatingCategory;
    } else if (event.category == Keys.Birthday){
      return AppAssets.birthdayCategory;
    } else if (event.category == Keys.meeting){
      return AppAssets.meetingCategory;
    } else {
      return AppAssets.SportCategory;
    }

  }
}
