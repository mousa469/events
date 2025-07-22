import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_failure_handler.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/network_checker_interface.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/favorites/data/datasources/favouirtes_local_data_source.dart';
import 'package:events/features/layout/favorites/data/datasources/favouirtes_remote_data_source.dart';
import 'package:events/features/layout/favorites/data/repos/favorits_repo.dart';

class FavouritsRepoImp extends FavoritsRepo {
  FavouirtesRemoteDataSource favouirtesRemoteDataSource;
  FavouirtesLocalDataSource favouirtesLocalDataSource;
  NetworkChecker networkChecker;
  FavouritsRepoImp({
    required this.favouirtesLocalDataSource,
    required this.favouirtesRemoteDataSource,
    required this.networkChecker,
  });
  @override
  Future<Either<Failure, List<Event>>> fetchFavoritesEvents() async {
    try {
      if (await networkChecker.hasInternetConnection()) {
        List<Event> events = await favouirtesRemoteDataSource
            .fetchFavouriteEvents();
        favouirtesLocalDataSource.storeFavouriteEvents(events: events);
        return Right(events);
      } else {
        return Right(await favouirtesLocalDataSource.fetchFavouriteEvents());
      }
    } on CustomFirebaseFirestoreException catch (e) {
      log("CustomFirebaseFirestoreException come from FavouritsRepoImp.fetchFavoritesEvents and message is : ${e.toString()}  ");
      return Left(FirebaseFirestoreFailureHandler.handle(e));
    } on UnExpectedException {
      log("un expected exception come from FavouritsRepoImp.fetchFavoritesEvents  ");
      return Left(UnExpectedFailure());
    }
  }
}
