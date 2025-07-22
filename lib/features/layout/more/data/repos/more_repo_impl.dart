import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase%20auth%20errors/firebase_auth_exception_handler.dart';
import 'package:events/core/errors/firebase%20auth%20errors/firebase_auth_failure_handler.dart';
import 'package:events/core/services/auth_services.dart';
import 'package:events/core/services/network_checker_interface.dart';
import 'package:events/features/layout/more/data/repos/more_repo.dart';

class MoreRepoImpl extends MoreRepo {
  NetworkChecker networkChecker;
  AuthServices authServices;

  MoreRepoImpl({required this.networkChecker, required this.authServices});
  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      if (await networkChecker.hasInternetConnection()) {
        await authServices.signOut();
        return Right(unit);
      } else {
        return Left(NoInternetConnectionFailure());
      }
    } on CustomFirebaseAuthException catch (e) {
      log("CustomFirebaseAuthException come from MoreRepoImpl.signOut and message is : ${e.toString()}  ");
      return Left(FirebaseAuthFailureHandler.handle(exception: e));
    } on Exception {
      log("Exception come from MoreRepoImpl.signOut ");
      return Left(UnExpectedFailure());
    }
  }
}
