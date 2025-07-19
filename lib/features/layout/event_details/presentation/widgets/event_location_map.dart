import 'dart:developer';

import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' hide Marker;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventLocationMap extends StatefulWidget {
  const EventLocationMap({super.key, required this.lat, required this.long});
  final double lat;
  final double long;

  @override
  State<EventLocationMap> createState() => _EventLocationMapState();
}

class _EventLocationMapState extends State<EventLocationMap> {
  late MapController mapController;
  late LatLng eventLocation;
  late CameraPosition initialCameraPosition;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    eventLocation = LatLng(widget.lat, widget.long);
    initialCameraPosition = CameraPosition(target: eventLocation, zoom: 16);
    markers.add(Marker(markerId: MarkerId("3"), position: eventLocation));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          markers: markers,
          onMapCreated: (controller) {},
        ),
      ),
    );
  }
}
