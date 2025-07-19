import 'dart:developer';

import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/services/database_services.dart';
import 'package:events/core/services/id_generator.dart';
import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/endpoints.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/event_details/data/models/place_details.dart';
import 'package:geocoding/geocoding.dart';

abstract class CreateEventRemoteDataSource {
  Future<void> addEvent({required Event event});
  Future<void> fetchEventLocation({
    required double latitude,
    required double longitude,
  });
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

      PlaceDetails placeDetails = await fetchEventLocation(
        latitude: event.lat,
        longitude: event.long,
      );
      String location =
          "${placeDetails.country} , ${placeDetails.administrativeArea} , ${placeDetails.subAdministrativeArea}";

      event.location = location;

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

  @override
  Future<PlaceDetails> fetchEventLocation({
    required double latitude,
    required double longitude,
  }) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      return PlaceDetails.fromPlaceMark(placemarks.first);
    } catch (e) {
      log(
        "general exception come from EventDetailsRepoImpl.fetchEventPlaceDetailsFromLatitudeAndLongitude and message is : ${e.toString()}  ",
      );
      rethrow;
    }
  }
}
