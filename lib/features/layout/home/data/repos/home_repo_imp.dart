import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_failure_handler.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/network_checker_interface.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
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
      yield Left(FirebaseFirestoreFailureHandler.handle(e));
    } catch (e) {
      yield Left(UnExpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<Event>>> fetchUserEvents() async {
    try {
      if (await networkChecker.hasInternetConnection()) {
        List<Event> events = await homeRepoRemoteDataSource.fetchUserEvents();
        homeRepoLocalDataSource.addEvents(events: events);
        return Right(events);
      } else {
        log(
          "there is no internet in the home repo and the data fethced from the local data source",
        );
        return Right(await homeRepoLocalDataSource.fetchUserEvents());
      }
    } on CustomFirebaseFirestoreException catch (e) {
      return Left(FirebaseFirestoreFailureHandler.handle(e));
    } on UnExpectedException {
      return Left(UnExpectedFailure());
    }
  }

  Future<Either<Failure, Unit>> addEventToFavourites({
    required String eventId,
  }) async {
    try {
      if (await networkChecker.hasInternetConnection()) {
        await homeRepoRemoteDataSource.addEventToFavourites(eventId: eventId);
      } else {
        // TODO : add event to favorites is offline mode
      }
      return Right(unit);
    } on CustomFirebaseFirestoreException catch (e) {
      return Left(FirebaseFirestoreFailureHandler.handle(e));
    } on UnExpectedException {
      return Left(UnExpectedFailure());
    }
  }
}
