import 'dart:developer';

import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/database_services.dart';
import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/endpoints.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class HomeRepoRemoteDataSource {
  Future<String> fetchUserName();
  Future<List<Event>> fetchUserEvents();
}

class HomeRepoRemoteDataSourceImpl extends HomeRepoRemoteDataSource {
  DatabaseServices databaseServices;
  SecureLocalStorage secureLocalStorage;

  HomeRepoRemoteDataSourceImpl({
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
    } on CustomFirebaseFirestoreException  {
      rethrow;
    } catch (e) {
      log(e.toString());
      throw UnExpectedException();
    }
  }
}
