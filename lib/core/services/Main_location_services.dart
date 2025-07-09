import 'package:events/features/layout/choose_event_location/data/models/user_location.dart';
import 'package:events/features/layout/choose_event_location/data/models/user_search_location_model.dart';

abstract class MainLocationServices {
  Future<UserProvidedLocation> getUserCurrentLocation();
  Future<List<UserSearchLocationModel>> userSearchLocation({
    required String address,
  });
}
