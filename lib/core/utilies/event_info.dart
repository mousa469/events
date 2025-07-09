import 'package:events/core/utilies/keys.dart';
import 'package:flutter/material.dart';

class EventInformation extends ChangeNotifier {
  int Index = 0;
  double? eventLat;
  double? eventLong;

  String chooseCategory() {
    switch (Index) {
      case 0:
        return Keys.sport;
      case 1:
        return Keys.Birthday;
      case 2:
        return Keys.meeting;
      case 3:
        return Keys.gaming;
      case 4:
        return Keys.eating;
      case 5:
        return Keys.holiday;
      case 6:
        return Keys.exhibtion;
      case 7:
        return Keys.workshop;
      case 8:
        return Keys.bookClub;
      default:
        return "Unknown";
    }
  }

  void clearEventInfo() {
  eventLat = null;
  eventLong = null;
  notifyListeners();
}
}
