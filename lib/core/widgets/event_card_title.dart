import 'dart:developer';

import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:events/core/widgets/favorite_icon.dart';
import 'package:events/features/layout/home/data/cubits/add_event_to_favorites/add_event_to_favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventCardTitle extends StatefulWidget {
  const EventCardTitle({
    super.key,
    required this.title,
    required this.isFavorite,
    required this.eventId,
  });

  final String title;
  final bool isFavorite;
  final String eventId;

  @override
  State<EventCardTitle> createState() => _EventCardTitleState();
}

class _EventCardTitleState extends State<EventCardTitle> {
  late bool isEventFavorite;

  @override
  void initState() {
    super.initState();
    isEventFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeToggler>(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.isLight ? AppColors.white : AppColors.black,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  widget.title,
                  style: AppStyles.style14Bold,
                ),
              ),
              SizedBox(width: 8.w),

              InkWell(
                onTap: () {
                  log("event id : ${widget.eventId}");
                  BlocProvider.of<AddEventToFavoritesCubit>(
                    context,
                  ).addEventToRepo(eventId: widget.eventId, context: context);
                  setState(() {
                    isEventFavorite = true;
                  });
                },
                child: FavoriteIcon(isFavorite: isEventFavorite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
