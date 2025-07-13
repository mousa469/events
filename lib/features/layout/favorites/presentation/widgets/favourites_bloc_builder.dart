import 'dart:developer';

import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/features/layout/favorites/data/cubits/fetch_favourite_events/fetch_favourite_events_cubit.dart';
import 'package:events/features/layout/favorites/presentation/widgets/favourite_events_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesBlocBuilder extends StatelessWidget {
  const FavouritesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFavouriteEventsCubit, FetchFavouriteEventsState>(
      builder: (context, state) {
        if (state is FetchFavouriteEventsSuccess) {
          log("FetchFavouriteEventsSuccess state is triggered");
          return FavouriteEventsList(events: state.events);
        } else if (state is FetchFavouriteEventsFailure) {
          log("FetchFavouriteEventsFailure state is triggered");

          return Center(
            child: Text(
              state.errMessage,
              style: AppStyles.style20Bold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          );
        } else {
          log("FetchFavouriteEventsLoading state is triggered");

          return Center(child: CircularProgressIndicator());
        }
      },
    ).horizontalPadding(value: 16.w);
  }
}
