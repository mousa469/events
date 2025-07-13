import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class FavoritsRepo {
  Future<Either<Failure, List<Event>>> fetchFavoritesEvents();
}
