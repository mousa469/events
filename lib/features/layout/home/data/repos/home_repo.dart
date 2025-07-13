import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class HomeRepo {
  Stream<Either<Failure, String>> fetchUserName();
  Future<Either<Failure, List<Event>>> fetchUserEvents();
  Future<Either<Failure, Unit>> addEventToFavourites({required String eventId});

  Future<Either<Failure, Unit>> removeEventFromFavorites({required String eventId});
}
