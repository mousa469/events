import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/layout/choose_event_location/data/models/user_location.dart';
import 'package:events/features/layout/choose_event_location/data/models/user_search_location_model.dart';

abstract class ChooseEventLocationRepo {
  Future<Either<Failure, UserProvidedLocation>> getUserCurrentLocation();
  Future<Either<Failure,List<UserSearchLocationModel>> > userSearchLocation({
    required String address,
  });
}
