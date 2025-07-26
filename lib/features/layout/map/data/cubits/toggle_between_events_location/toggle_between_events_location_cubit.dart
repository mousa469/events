import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_between_events_location_state.dart';

class ToggleBetweenEventsLocationCubit
    extends Cubit<ToggleBetweenEventsLocationState> {
  ToggleBetweenEventsLocationCubit()
    : super(ToggleBetweenEventsLocationInitial());

  toggleEventLocation({required double lat, required double long}) {
    emit(ToggleBetweenEventsLocationSuccess(lat: lat, long: long));
  }
}
