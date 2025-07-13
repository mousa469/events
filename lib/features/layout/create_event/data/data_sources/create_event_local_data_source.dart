import 'package:events/core/services/local_storage.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class CreateEventLocalDataSource {
  Future<void> addEvent({required Event event});
  Future<void> addEventInOfflineMode({required Event event});
}

class CreateEventLocalDataSourceImpl extends CreateEventLocalDataSource {
  LocalStorage localStorage;
  CreateEventLocalDataSourceImpl({required this.localStorage});
  @override
  Future<void> addEvent({required Event event}) async {
    await localStorage.setValueInList(key: Keys.eventsList, value: event);
  }

  @override
  Future<void> addEventInOfflineMode({required Event event}) async {
    await localStorage.setValueInList(
      key: Keys.OfflineEventsList,
      value: event,
    );
  }
}
