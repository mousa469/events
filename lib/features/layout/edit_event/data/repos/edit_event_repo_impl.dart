import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_failure_handler.dart';
import 'package:events/core/services/custom_flutter_secure_storage.dart';
import 'package:events/core/services/database_services.dart';
import 'package:events/core/services/network_checker_interface.dart';
import 'package:events/core/utilies/endpoints.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/edit_event/data/repos/edit_event_repo.dart';

class EditEventRepoImpl extends EditEventRepo {
  final DatabaseServices databaseServices;
  final CustomFlutterSecureStorage customFlutterSecureStorage;
  final NetworkChecker networkChecker;

  EditEventRepoImpl({
    required this.networkChecker,
    required this.customFlutterSecureStorage,
    required this.databaseServices,
  });
  @override
  Future<Either<Failure, Unit>> updateEventDetails({
    required Event event,
  }) async {
    try {
      if (await networkChecker.hasInternetConnection()) {
        await databaseServices.updateRecord(
          path: Endpoints.usersEndpoint,
          data: event.toJson(),
          subCollectionPath: Endpoints.userEvents,
          id: await customFlutterSecureStorage.getData(key: Keys.userID),
          subCollectionID: event.id,
        );
        return Right(unit);
      } else {
        return Left(NoInternetConnectionFailure());
      }
    } on CustomFirebaseFirestoreException catch (firebaseException) {
       log("CustomFirebaseFirestoreException come from EditEventRepoImpl.updateEventDetails and message is : ${firebaseException.toString()}  ");
      return Left(FirebaseFirestoreFailureHandler.handle(firebaseException));
    } catch (e) {
      log("UnExpectedFailure come from EditEventRepoImpl.updateEventDetails and message is : ${e.toString()}  ");
      return Left(UnExpectedFailure());
    }
  }
}
