import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/location%20services%20errors/location_services_exceptions.dart';
import 'package:events/core/errors/location%20services%20errors/location_services_failures.dart';
import 'package:events/core/services/Main_location_services.dart';
import 'package:events/features/layout/choose_event_location/data/models/user_location.dart';
import 'package:events/features/layout/choose_event_location/data/models/user_search_location_model.dart';
import 'package:events/features/layout/choose_event_location/data/repo/choose_event_location_repo.dart';

class ChooseEventLocationRepoImp extends ChooseEventLocationRepo {
  MainLocationServices mainLocationServices;

  ChooseEventLocationRepoImp({required this.mainLocationServices});

  @override
  Future<Either<Failure, UserProvidedLocation>> getUserCurrentLocation() async {
    try {
      return Right(await mainLocationServices.getUserCurrentLocation());
    } on LocationException catch (e) {
      log(
        "LocationException come  from ChooseEventLocationRepoImp.getUserCurrentLocation and messages is : ${e.toString()}",
      );
      return Left(LocationServicesFailuresMapper.handle(ex: e));
    } catch (e) {
      log(
        "general exception come  from ChooseEventLocationRepoImp.getUserCurrentLocation and messages is : ${e.toString()}",
      );
      return Left(UnExpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserSearchLocationModel>>> userSearchLocation({
    required String address,
  }) async {
    try {
      List<UserSearchLocationModel> locations = await mainLocationServices
          .userSearchLocation(address: address);
      return Right(locations);
    } catch (e) {
      log(
        "general exception come  from ChooseEventLocationRepoImp.userSearchLocation and messages is : ${e.toString()}",
      );
      return Left(UnExpectedFailure());
    }
  }
}
