import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_failure_handler.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/network_checker_interface.dart';
import 'package:events/features/layout/home/data/data%20sources/home_repo_local_data_source.dart';
import 'package:events/features/layout/home/data/data%20sources/home_repo_remote_data_source.dart';
import 'package:events/features/layout/home/data/repos/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final NetworkChecker networkChecker;
  final HomeRepoLocalDataSource homeRepoLocalDataSource;
  final HomeRepoRemoteDataSource homeRepoRemoteDataSource;

  HomeRepoImp({
    required this.networkChecker,
    required this.homeRepoLocalDataSource,
    required this.homeRepoRemoteDataSource,
  });

  @override
  Stream<Either<Failure, String>> fetchUserName() async* {
    String? localUserName;
    try {
      localUserName = await homeRepoLocalDataSource.fetchUserName();
      yield Right(localUserName);
    } catch (e) {
      yield Left(Failure());
    }

    try {
      final hasConnection = await networkChecker.hasInternetConnection();
      if (!hasConnection) return;

      final remoteUserName = await homeRepoRemoteDataSource.fetchUserName();

      if (remoteUserName != localUserName) {
        homeRepoLocalDataSource.updateUserName(name: remoteUserName);
        yield Right(remoteUserName);
      }
    } on CustomFirebaseFirestoreException catch (e) {
      log("CustomFirebaseFirestoreException come from HomeRepoImp.fetchUserName and message is : ${e.toString()}  ");
      yield Left(FirebaseFirestoreFailureHandler.handle(e));
    } catch (e) {
            log("general exception come from HomeRepoImp.fetchUserName and message is : ${e.toString()}  ");

      yield Left(UnExpectedFailure());
    }
  }



  Future<Either<Failure, Unit>> addEventToFavourites({
    required String eventId,
  }) async {
    try {
      if (await networkChecker.hasInternetConnection()) {
        await homeRepoRemoteDataSource.addEventToFavourites(eventId: eventId);
      } else {
        return Left(NoInternetConnectionFailure());
      }
      return Right(unit);
    } on CustomFirebaseFirestoreException catch (e) {
       log( "CustomFirebaseFirestoreException come from HomeRepoImp.addEventToFavorites and message is : ${e.toString()}  ");
      return Left(FirebaseFirestoreFailureHandler.handle(e));
    } on UnExpectedException catch (e) {
       log( "un expected exception come from HomeRepoImp.addEventToFavorites and message is : ${e.toString()}  ");
      return Left(UnExpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeEventFromFavorites({
    required String eventId,
  }) async {
    try {
      if (await networkChecker.hasInternetConnection()) {
        await homeRepoRemoteDataSource.removeEventFromFavourites(
          eventId: eventId,
        );
      } else {
        return Left(NoInternetConnectionFailure());
      }
      return Right(unit);
    } on CustomFirebaseFirestoreException catch (e) {
       log( "CustomFirebaseFirestoreException come from HomeRepoImp.removeEventFromFavorites and message is : ${e.toString()}  ");
      return Left(FirebaseFirestoreFailureHandler.handle(e));
    } on UnExpectedException catch (e) {
       log( "un expected exception come from HomeRepoImp.removeEventFromFavorites and message is : ${e.toString()}  ");
      return Left(UnExpectedFailure());
    }
  }
}
