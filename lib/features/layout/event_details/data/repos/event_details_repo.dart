import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/layout/event_details/data/models/place_details.dart';

abstract class EventDetailsRepo {
Future< Either<Failure, PlaceDetails>>  fetchEventPlaceDetailsFromLatitudeAndLongitude({required double latitude,required double longitude});
}