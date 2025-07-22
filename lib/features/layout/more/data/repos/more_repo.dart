import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';

abstract class MoreRepo {
  Future<Either<Failure, Unit>> signOut();
}
