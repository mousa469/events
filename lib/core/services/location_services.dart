import 'dart:developer';

import 'package:events/core/errors/location%20services%20errors/location_services_exceptions.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/Main_location_services.dart';
import 'package:events/features/layout/choose_event_location/data/models/user_location.dart';
import 'package:events/features/layout/choose_event_location/data/models/user_search_location_model.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';

class LocationServices extends MainLocationServices {
  Location location = Location();

  @override
  Future<UserProvidedLocation> getUserCurrentLocation() async {
    await checkLocationService();
    await checkLocationPermission();

    var locationData = await location.getLocation();
    return UserProvidedLocation(
      latitude: locationData.latitude!,
      longtude: locationData.longitude!,
    );
  }

  Future<void> checkLocationService() async {
    bool isServiceEnabled = await location.serviceEnabled();

    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        log(
          "LocationServiceDeniedException from LocationServices.checkLocationService ",
        );
        throw LocationServiceDeniedException();
      }
    }
  }

  Future<void> checkLocationPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.deniedForever) {
      log(
        "LocationPermissionDeniedForeverException from LocationServices.checkLocationPermission ",
      );
      throw LocationPermissionDeniedForeverException();
    }

    if (PermissionStatus.granted != permissionStatus ||
        PermissionStatus.grantedLimited != permissionStatus) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        log(
          "LocationPermissionDeniedException from LocationServices.checkLocationPermission ",
        );
        throw LocationPermissionDeniedException();
      }
    }
  }


  Future<List<UserSearchLocationModel>> userSearchLocation({
    required String address,
  }) async {
    try {
      List<geo.Location> places = await geo.locationFromAddress(address);
      List<UserSearchLocationModel> locations = [];

      for (var i = 0; i < places.length; i++) {
        locations.add(
          UserSearchLocationModel(
            latitude: places[i].latitude,
            longtude: places[i].longitude,
            time: places[i].timestamp,
          ),
        );
      }

      return locations;
    } catch (e) {
      log(
        "exception come from LocationServices.userSearchLocation and its message is : ${e.toString()} ",
      );
      throw UnExpectedException();
    }
  }
}
