import 'package:events/core/services/local_storage.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class FavouirtesLocalDataSource {
  Future<List<Event>> fetchFavouriteEvents();
  Future<void> storeFavouriteEvents({required List<Event> events});
}

class FavouirtesLocalDataSourceImpl extends FavouirtesLocalDataSource {
  LocalStorage localStorage;
  FavouirtesLocalDataSourceImpl({required this.localStorage});
  @override
  Future<List<Event>> fetchFavouriteEvents() async {
    return await localStorage.getList<Event>(key: Keys.favouriteEvents);
  }

  @override
  Future<void> storeFavouriteEvents({required List<Event> events}) async {
    await localStorage.setList<Event>(key: Keys.favouriteEvents, value: events);
  }
}
