import 'package:events/core/services/local_storage.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class FetchUserEventsLocalDataSource {
  Future<List<Event>> fetchUserEventsFromOfflineMode();
  Future<void> clearEventsFromOfflineMode();
  void addEvents({required List<Event> events});
  Future<bool> checkIfThereEventsAddedToOfflineModeEvents();
  Future<List<Event>> fetchUserEvents();
}

class FetchUserEventsLocalDataSourceImpl
    implements FetchUserEventsLocalDataSource {
  final LocalStorage localStorage;

  FetchUserEventsLocalDataSourceImpl({required this.localStorage});

  @override
  Future<List<Event>> fetchUserEvents() async {
    return await localStorage.getList<Event>(key: Keys.eventsList);
  }

  void addEvents({required List<Event> events}) {
    for (var i = 0; i < events.length; i++) {
      localStorage.setList<Event>(key: Keys.eventsList, value: events);
    }
  }

  @override
  Future<void> clearEventsFromOfflineMode() async {
    await localStorage.setList<Event>(key: Keys.OfflineEventsList, value: []);
  }

  @override
  Future<List<Event>> fetchUserEventsFromOfflineMode() async {
    bool isExist = await checkIfThereEventsAddedToOfflineModeEvents();
    if (isExist) {
      return localStorage.getList(key: Keys.OfflineEventsList);
    }

    return [];
  }

  @override
  Future<bool> checkIfThereEventsAddedToOfflineModeEvents() async {
    List<Event> events = await localStorage.getList<Event>(
      key: Keys.OfflineEventsList,
    );
    if (events.isNotEmpty) {
      return true;
    }
    return false;
  }
}
