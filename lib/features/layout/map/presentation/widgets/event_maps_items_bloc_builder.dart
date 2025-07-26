import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/features/layout/fetch_user_events/data/cubits/fetch_user_events/fetch_user_events_cubit.dart';
import 'package:events/features/layout/map/presentation/widgets/event_map_item.dart';
import 'package:events/features/layout/map/presentation/widgets/event_maps_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventMapsItemsBlocBuilder extends StatelessWidget {
  const EventMapsItemsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserEventsCubit, FetchUserEventsState>(
      builder: (context, state) {
        if (state is FetchUserEventsSuccessfully) {
          return EventMapsItemListView(events: state.events);
        } else if (state is FetchUserEventsFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is FetchUserEventsSuccessfullyButEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                S.of(context).No_events_added_yet,
                style: AppStyles.style20Bold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
