import 'package:events/features/layout/fetch_user_events/data/cubits/fetch_user_events/fetch_user_events_cubit.dart';
import 'package:events/features/layout/map/data/cubits/toggle_between_events_location/toggle_between_events_location_cubit.dart';
import 'package:events/features/layout/map/presentation/widgets/event_maps_items_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchUserEventsCubit>(
      context,
    ).fetchUserEvents(context: context);
    initialCameraPosition = const CameraPosition(target: LatLng(0, 0), zoom: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<
          ToggleBetweenEventsLocationCubit,
          ToggleBetweenEventsLocationState
        >(
          builder: (context, state) {
            if (state is ToggleBetweenEventsLocationSuccess) {
              LatLng eventPosition = LatLng(state.lat, state.long);
              markers.clear();
              markers.add(
                Marker(markerId: MarkerId('8'), position: eventPosition),
              );
              mapController.animateCamera(
                CameraUpdate.newLatLngZoom(eventPosition, 16),
              );
            }
            return GoogleMap(
              markers: markers,
              onMapCreated: (controller) {
                mapController = controller;
              },
              zoomControlsEnabled: false,
              initialCameraPosition: initialCameraPosition,
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: EventMapsItemsBlocBuilder(),
        ),
      ],
    );
  }
}
