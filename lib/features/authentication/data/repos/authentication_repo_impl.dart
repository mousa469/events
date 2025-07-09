import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase%20auth%20errors/firebase_auth_exception_handler.dart';
import 'package:events/core/errors/firebase%20auth%20errors/firebase_auth_failure_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_failure_handler.dart';
import 'package:events/core/services/auth_services.dart';
import 'package:events/core/services/database_services.dart';
import 'package:events/core/services/network_checker_interface.dart';
import 'package:events/core/utilies/endpoints.dart';
import 'package:events/features/authentication/data/repos/authentication_repo.dart';
import 'package:events/features/authentication/data/models/user.dart';

class AuthenticationRepoImpl extends AuthenticationRepo {
  AuthServices authServices;
  DatabaseServices databaseServices;
  NetworkChecker networkChecker;

  AuthenticationRepoImpl({
    required this.networkChecker,
    required this.authServices,
    required this.databaseServices,
  });
  @override
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    if (await networkChecker.hasInternetConnection()) {
      try {
        UserModel userModel = await authServices.createUserWithEmailAndPassword(
          email: email,
          password: password,
          name: name,
        );

        if (!await databaseServices.checkIfTheRecordExistedBefore(
          path: Endpoints.usersEndpoint,
          id: userModel.userID,
        )) {
          databaseServices.addRecord(
            path: Endpoints.usersEndpoint,
            data: userModel.toJson(),
            id: userModel.userID,
          );
        }

        return Right(userModel);
      } on CustomFirebaseFirestoreException catch (e) {
        return Left(FirebaseFirestoreFailureHandler.handle(e));
      } on CustomFirebaseAuthException catch (e) {
        log(
          "firebase auth  exception come from AuthenticationRepoImpl.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
        );

        return Left(FirebaseAuthFailureHandler.handle(exception: e));
      } catch (e) {
        log(
          "general exception come from AuthenticationRepoImpl.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
        );
        return Left(UnExpectedFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (await networkChecker.hasInternetConnection()) {
      try {
        UserModel userModel = await authServices.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        return Right(userModel);
      } on CustomFirebaseAuthException catch (e) {
        log(
          "firebase auth  exception come from AuthenticationRepoImpl.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
        );

        return Left(FirebaseAuthFailureHandler.handle(exception: e));
      } catch (e) {
        log(
          "general exception come from AuthenticationRepoImpl.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
        );
        return Left(UnExpectedFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    if (await networkChecker.hasInternetConnection()) {
      try {
        UserModel user = await authServices.signInWithGoogle();

        if (!await databaseServices.checkIfTheRecordExistedBefore(
          path: Endpoints.usersEndpoint,
          id: user.userID,
        )) {
          databaseServices.addRecord(
            path: Endpoints.usersEndpoint,
            data: user.toJson(),
            id: user.userID,
          );
        }

        return Right(user);
      } on CustomFirebaseFirestoreException catch (e) {
        return Left(FirebaseFirestoreFailureHandler.handle(e));
      } on CustomFirebaseAuthException catch (e) {
        log(
          "firebase auth  exception come from AuthenticationRepoImpl.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
        );

        return Left(FirebaseAuthFailureHandler.handle(exception: e));
      } catch (e) {
        log(
          "general exception come from AuthenticationRepoImpl.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
        );
        return Left(UnExpectedFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithFacebook() async {
    if (await networkChecker.hasInternetConnection()) {
      try {
        UserModel user = await authServices.signInWithFacbook();

        if (!await databaseServices.checkIfTheRecordExistedBefore(
          path: Endpoints.usersEndpoint,
          id: user.userID,
        )) {
          databaseServices.addRecord(
            path: Endpoints.usersEndpoint,
            data: user.toJson(),
            id: user.userID,
          );
        }

        return Right(user);
      } on CustomFirebaseFirestoreException catch (e) {
        return Left(FirebaseFirestoreFailureHandler.handle(e));
      } on CustomFirebaseAuthException catch (e) {
        log(
          "firebase auth  exception come from AuthenticationRepoImpl.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
        );

        return Left(FirebaseAuthFailureHandler.handle(exception: e));
      } catch (e) {
        log(
          "general exception come from AuthenticationRepoImpl.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
        );
        return Left(UnExpectedFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
