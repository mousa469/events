import 'dart:developer';

import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/database_services.dart';
import 'package:events/core/services/id_generator.dart';
import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/endpoints.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class FetchUserEventsRemoteDataSource {
  Future<List<Event>> fetchUserEvents();
  Future<void> addEvent({required Event event});
}

class FetchUserEventsRemoteDataSourceImpl
    extends FetchUserEventsRemoteDataSource {
  final DatabaseServices databaseServices;
  final SecureLocalStorage secureLocalStorage;
  final IdGenerator idGenerator;

  FetchUserEventsRemoteDataSourceImpl({
    required this.databaseServices,
    required this.secureLocalStorage,
    required this.idGenerator,
  });
  @override
  Future<List<Event>> fetchUserEvents() async {
    try {
      List<Map<String, dynamic>> RemoteEvents = await databaseServices
          .fetchGroupOfRecordsSorted(
            isDescending: true,
            sortBy: Keys.createdAt,
            path: Endpoints.usersEndpoint,
            id: await secureLocalStorage.getData(key: Keys.userID),
            subCollectionPath: Endpoints.userEvents,
          );

      return RemoteEvents.map((e) => Event.fromJson(e)).toList();
    } on CustomFirebaseFirestoreException {
      rethrow;
    } catch (e) {
      log(e.toString());
      throw UnExpectedException();
    }
  }

  @override
  Future<void> addEvent({required Event event}) async {
    try {
      String eventID = idGenerator.generateID();
      event.id = eventID;

      await databaseServices.addRecord(
        path: Endpoints.usersEndpoint,
        data: event.toJson(),
        id: await secureLocalStorage.getData(key: Keys.userID),
        subCollectionPath: Endpoints.userEvents,
        subCollectionID: event.id,
      );
    } on CustomFirebaseFirestoreException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
