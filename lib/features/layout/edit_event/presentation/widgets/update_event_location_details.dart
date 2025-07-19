import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UpdateEventLocationDetails extends StatefulWidget {
  const UpdateEventLocationDetails({
    super.key,
    required this.lat,
    required this.long,
  });
  final double lat;
  final double long;

  static const String id = "UpdateEventLocationDetails";

  @override
  State<UpdateEventLocationDetails> createState() =>
      _UpdateEventLocationDetailsState();
}

class _UpdateEventLocationDetailsState
    extends State<UpdateEventLocationDetails> {
  late CameraPosition initialCameraPosition;
  Set<Marker> markers = {};
  LatLng? eventUpadatedLocation;

  @override
  void initState() {
    super.initState();
    LatLng initialLatLong = LatLng(widget.lat, widget.long);
    initialCameraPosition = CameraPosition(target: initialLatLong, zoom: 16);
    markers.add(Marker(markerId: MarkerId("4"), position: initialLatLong));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onTap: (argument) {
        eventUpadatedLocation = argument;
        setState(() {
          markers.clear();
          markers.add(Marker(markerId: MarkerId("5"), position: argument));
        });
      },
      markers: markers,
      initialCameraPosition: initialCameraPosition,
    );
  }
}
