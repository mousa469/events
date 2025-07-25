import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_failure_handler.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/network_checker_interface.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/fetch_user_events/data/data%20sources/fetch_user_events_local_data_source.dart';
import 'package:events/features/layout/fetch_user_events/data/data%20sources/fetch_user_events_remote_data_source.dart';
import 'package:events/features/layout/fetch_user_events/data/repos/fetch_user_events_repo.dart';

class FetchUserEventsRepoImpl implements FetchUserEventsRepo {


final FetchUserEventsRemoteDataSource  fetchUserEventsRemoteDataSource;
final FetchUserEventsLocalDataSource fetchUserEventsLocalDataSource;
final NetworkChecker networkChecker;

FetchUserEventsRepoImpl({required this.fetchUserEventsRemoteDataSource,required this.fetchUserEventsLocalDataSource,required this.networkChecker});


   @override
  Future<Either<Failure, List<Event>>> fetchUserEvents() async {
    try {
      if (await networkChecker.hasInternetConnection()) {
        List<Event> offlineEventsList = await fetchUserEventsLocalDataSource
            .fetchUserEventsFromOfflineMode();

        if (offlineEventsList.isNotEmpty) {
          for (var i = 0; i < offlineEventsList.length; i++) {
            fetchUserEventsRemoteDataSource.addEvent(event: offlineEventsList[i]);
          }
          fetchUserEventsLocalDataSource.clearEventsFromOfflineMode();
        }

        List<Event> events = await fetchUserEventsRemoteDataSource.fetchUserEvents();
        fetchUserEventsLocalDataSource.addEvents(events: events);
        return Right(events);
      } else {
        return Right(await fetchUserEventsLocalDataSource.fetchUserEvents());
      }
    } on CustomFirebaseFirestoreException catch (e) {
            log("CustomFirebaseFirestoreException come from fetchUserEventsRepo.fetchUserEvents and message is : ${e.toString()}  ");

      return Left(FirebaseFirestoreFailureHandler.handle(e));
    } on UnExpectedException catch (e) {

            log("general exception come from HomeRepoImp.fetchUserEvents and message is : ${e.toString()}  ");
      return Left(UnExpectedFailure());
    } catch (e) {
            log("general exception come from HomeRepoImp.fetchUserEvents and message is : ${e.toString()}  ");
      return Left(UnExpectedFailure());
    }
  }
  
}