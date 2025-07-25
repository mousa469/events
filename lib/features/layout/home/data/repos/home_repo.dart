import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';

abstract class HomeRepo {
  Stream<Either<Failure, String>> fetchUserName();
  Future<Either<Failure, Unit>> addEventToFavourites({required String eventId});

  Future<Either<Failure, Unit>> removeEventFromFavorites({required String eventId});
}
