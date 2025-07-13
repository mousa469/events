import 'dart:developer';

import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/database_services.dart';
import 'package:events/core/services/id_generator.dart';
import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/endpoints.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class HomeRepoRemoteDataSource {
  Future<String> fetchUserName();
  Future<List<Event>> fetchUserEvents();
  Future<void> addEventToFavourites({required String eventId});
  Future<void> removeEventFromFavourites({required String eventId});
  Future<void> addEvent({required Event event});
}

class HomeRepoRemoteDataSourceImpl extends HomeRepoRemoteDataSource {
  DatabaseServices databaseServices;
  SecureLocalStorage secureLocalStorage;
  IdGenerator idGenerator;

  HomeRepoRemoteDataSourceImpl({
    required this.idGenerator,
    required this.databaseServices,
    required this.secureLocalStorage,
  });
  @override
  Future<String> fetchUserName() async {
    try {
      Map<String, dynamic> userInfo = await databaseServices.fetchRecord(
        path: Endpoints.usersEndpoint,
        id: await secureLocalStorage.getData(key: Keys.userID),
      );
      return userInfo[Keys.userName];
    } on CustomFirebaseFirestoreException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

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
  Future<void> addEventToFavourites({required String eventId}) async {
    try {
      await databaseServices.updateRecord(
        path: Endpoints.usersEndpoint,
        id: await secureLocalStorage.getData(key: Keys.userID),
        key: Keys.isFavourite,
        subCollectionPath: Endpoints.userEvents,
        data: true,
        subCollectionID: eventId,
      );
    } on CustomFirebaseFirestoreException {
      rethrow;
    } catch (e) {
      log(e.toString());
      throw UnExpectedException();
    }
  }

  @override
  Future<void> removeEventFromFavourites({required String eventId}) async {
    try {
      await databaseServices.updateRecord(
        path: Endpoints.usersEndpoint,
        id: await secureLocalStorage.getData(key: Keys.userID),
        key: Keys.isFavourite,
        subCollectionPath: Endpoints.userEvents,
        data: false,
        subCollectionID: eventId,
      );
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
