import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class EditEventRepo {
  Future<Either<Failure,Unit>> updateEventDetails({required Event event});
}
