

import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Keys {
  static const String userID = "userID";
  static const String eventLocation = "location";
  static const String userEmail = "userEmail";
  static const String userName = "userName";
  static const String isOnBoardingSeenBefore = "isOnBoardingSeenBefore";
  static const String isAthenticatedBefore = "isOnBoardingSeenBefore";
  static const String eventsList = "eventsList";
  static const String eventsListInOfflineMode = "eventsList";
  static const String OfflineEventsList = "OfflineEventsList";
  static const String All = "All";
  static const String sport = "Sport";
  static const String Birthday = "Birthday";
  static const String meeting = "Meeting";
  static const String gaming = "Gaming";
  static const String eating = "Eating";
  static const String holiday = "Holiday";
  static const String createdAt = "createdAt";
  static const String isFavourite = "isfavourite";
  static const String id = "id";
  static const String category = "category";
  static const String title = "title";
  static const String description = "description";
  static const String date = "date";
  static const String lat = "lat";
  static const String long = "long";
  static const String time = "time";
  static const String ar = "ar";
  static const String en = "en";
  static  String googleMapsApiKey = dotenv.env['GOOGLE_MAPS_API_KEY']!;
  static const String language = "language";
  static const String favouriteEvents = "favouriteEvents";
  static const String favouriteEventsInOfflineMode = "favouriteEventsInOfflineMode";


  
  static const String exhibtion = "Exhibition";
  static const String workshop = "Workshop";
  static const String bookClub = "Book Club";
}
