import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/database_services.dart';
import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/endpoints.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class FavouirtesRemoteDataSource {
  Future<List<Event>> fetchFavouriteEvents();
}

class FavouirtesRemoteDataSourceImpl extends FavouirtesRemoteDataSource {
  DatabaseServices databaseServices;
  SecureLocalStorage secureLocalStorage;
  FavouirtesRemoteDataSourceImpl({
    required this.databaseServices,
    required this.secureLocalStorage,
  });
  @override
  Future<List<Event>> fetchFavouriteEvents() async {
    try {
      List<Map<String, dynamic>> events = await databaseServices
          .fetchGroupOfDataEqualTo(
            isEqualTo: true,
            path: Endpoints.usersEndpoint,
            id: await secureLocalStorage.getData(key: Keys.userID),
            key: Keys.isFavourite,
            subCollectionPath: Endpoints.userEvents
          );

      return events.map((event) {
        return Event.fromJson(event);
      }).toList();
    } on CustomFirebaseFirestoreException {
      rethrow;
    } catch (e) {
      throw UnExpectedException();
    }
  }
}
