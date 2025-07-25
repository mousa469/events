import 'package:events/features/layout/map/presentation/widgets/event_maps_items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
  late CameraPosition initialCameraPosition;
  @override
  void initState() {
    super.initState();
    initialCameraPosition = const CameraPosition(target: LatLng(0, 0), zoom: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          zoomControlsEnabled: false,
          initialCameraPosition: initialCameraPosition,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: EventMapsItemsListView(),
        ),
      ],
    );
  }
}
