import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/authentication/data/models/user.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> signInWithGoogle();
  Future<Either<Failure, UserModel>> signInWithFacebook();
}
