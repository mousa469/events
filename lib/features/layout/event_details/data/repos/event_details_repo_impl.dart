import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/layout/event_details/data/models/place_details.dart';
import 'package:events/features/layout/event_details/data/repos/event_details_repo.dart';
import 'package:geocoding/geocoding.dart';

class EventDetailsRepoImpl implements EventDetailsRepo {
  @override
  Future<Either<Failure, PlaceDetails>>
  fetchEventPlaceDetailsFromLatitudeAndLongitude({
    required double latitude,
    required double longitude,
  }) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      return Right(PlaceDetails.fromPlaceMark(placemarks.first));
    } catch (e) {
      log(
        "general exception come from EventDetailsRepoImpl.fetchEventPlaceDetailsFromLatitudeAndLongitude and message is : ${e.toString()}  ",
      );
      return Left(UnExpectedFailure());
    }
  }
}
