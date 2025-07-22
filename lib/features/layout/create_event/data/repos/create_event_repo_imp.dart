import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_failure_handler.dart';
import 'package:events/core/services/network_checker_interface.dart';
import 'package:events/features/layout/create_event/data/data_sources/create_event_local_data_source.dart';
import 'package:events/features/layout/create_event/data/data_sources/create_event_remote_data_source.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/create_event/data/repos/create_event_repo.dart';

class CreateEventRepoImp extends CreateEventRepo {
  final CreateEventRemoteDataSource createEventRemoteDataSource;
  final CreateEventLocalDataSource createEventLocalDataSource;
  final NetworkChecker networkChecker;

  CreateEventRepoImp({
    required this.networkChecker,
    required this.createEventRemoteDataSource,
    required this.createEventLocalDataSource,
  });

  Future<Either<Failure, Unit>> addEvent({required Event event}) async {
    try {
      if (await networkChecker.hasInternetConnection()) {
        createEventRemoteDataSource.addEvent(event: event);
      } else {
        createEventLocalDataSource.addEventInOfflineMode(event: event);
      }

      return Right(unit);
    } on CustomFirebaseFirestoreException catch (e) {
      log(
          "CustomFirebaseFirestoreException come from CreateEventRepoImp.addEvent and message is : ${e.toString()}  ");
      return Left(FirebaseFirestoreFailureHandler.handle(e));
    } catch (e) {
      log("general exception come from CreateEventRepoImp.addEvent and message is : ${e.toString()}  ");
      return Left(UnExpectedFailure());
    }
  }
}
