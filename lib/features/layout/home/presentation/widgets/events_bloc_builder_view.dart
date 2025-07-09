import 'dart:developer';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/features/layout/home/data/cubits/fetch_user_events.dart/fetch_user_events_cubit.dart';
import 'package:events/features/layout/home/presentation/widgets/events_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsBLocBuilder extends StatefulWidget {
  const EventsBLocBuilder({super.key});

  @override
  State<EventsBLocBuilder> createState() => _EventsListViewState();
}

class _EventsListViewState extends State<EventsBLocBuilder> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<FetchUserEventsCubit>(
        context,
      ).fetchUserEvents(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserEventsCubit, FetchUserEventsState>(
      builder: (context, state) {
        if (state is FetchUserEventsSuccessfully) {
          log("FetchUserEventsSuccessfully state is triggered ");
          return EventsListView(events: state.events);
        } else if (state is FetchUserEventsFailure) {
          log("FetchUserEventsFailure state is triggered ");
          return Center(child: Text(state.errMessage));
        } else if (state is FetchUserEventsSuccessfullyButEmpty) {
          log("FetchUserEventsSuccessfullyButEmpty state is triggered ");
          ///////////////////////////////////
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
          log("Loading state is triggered ");
          return Expanded(
            child: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
