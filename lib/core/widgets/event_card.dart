import 'package:events/core/assets/app_assets.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/widgets/event_card_date.dart';
import 'package:events/core/widgets/event_card_title.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.778,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.gamingCategory),
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primaryColor),
            ),
          ),

          EventCardDate(),
          EventCardTitle(),


        ],
      ),
    );
  }
}
