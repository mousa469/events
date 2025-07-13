import 'dart:developer';

import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/widgets/event_location_button.dart';
import 'package:events/features/layout/event_details/data/cubits/fetch_event_location/fetch_event_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventLocationBlocBuilder extends StatefulWidget {
  const EventLocationBlocBuilder({
    super.key,
    required this.lat,
    required this.long,
  });
  final double lat;
  final double long;

  @override
  State<EventLocationBlocBuilder> createState() =>
      _EventLocationBlocBuilderState();
}

class _EventLocationBlocBuilderState extends State<EventLocationBlocBuilder> {
  initState() {
    super.initState();
    context.read<FetchEventLocationCubit>().fetchEventLocation(
      latitude: widget.lat,
      longitude: widget.long,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchEventLocationCubit, FetchEventLocationState>(
      builder: (context, state) {
        if (state is FetchEventLocationSuccess) {
   
          return EventLocationButton(title: "${state.placeDetails.country} , ${state.placeDetails.administrativeArea} , ${state.placeDetails.subAdministrativeArea}");
        } else if (state is FetchEventLocationFailure) {
          return Text(S.of(context).unexpected_error);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
