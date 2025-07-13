import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/services/database_services.dart';
import 'package:events/core/services/id_generator.dart';
import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/endpoints.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';

abstract class CreateEventRemoteDataSource {
  Future<void> addEvent({required Event event});
}

class CreateEventRemoteDataSourceImpl extends CreateEventRemoteDataSource {
  final DatabaseServices databaseServices;
  final IdGenerator idGenerator;
  final SecureLocalStorage securelocalStorage;

  CreateEventRemoteDataSourceImpl({
    required this.databaseServices,
    required this.idGenerator,
    required this.securelocalStorage,
  });

  @override
  Future<void> addEvent({required Event event}) async {
    try {
      String eventID = idGenerator.generateID();
      event.id = eventID;

      await databaseServices.addRecord(
        path: Endpoints.usersEndpoint,
        data: event.toJson(),
        id: await securelocalStorage.getData(key: Keys.userID),
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
