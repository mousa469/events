import 'dart:developer';

import 'package:events/core/services/local_storage.dart';
import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class HomeRepoLocalDataSource {
  Future<String> fetchUserName();
  void updateUserName({required String name});
 Future<List<Event>>  fetchUserEvents();
  void addEvents({required List<Event> events});
}

class HomeRepoLocalDataSourceImpl extends HomeRepoLocalDataSource {
  SecureLocalStorage secureLocalStorage;
  LocalStorage localStorage;
  HomeRepoLocalDataSourceImpl({
    required this.secureLocalStorage,
    required this.localStorage,
  });

  @override
  Future<String> fetchUserName() async {
    return await secureLocalStorage.getData(key: Keys.userName);
  }

  @override
  void updateUserName({required String name}) {
    secureLocalStorage.setData(key: Keys.userName, value: name);
  }

  @override
  Future<List<Event>> fetchUserEvents() async {
    log("fetch user events in the  HomeRepoLocalDataSourceImpl is triggered ");
    return await localStorage.getList<Event>(key: Keys.eventsList);
  }

  @override
  void addEvents({required List<Event> events}) {
    for (var i = 0; i < events.length; i++) {
      localStorage.setList<Event>(
        key: Keys.eventsList,
        value: events,
      );
    }


  }
}
