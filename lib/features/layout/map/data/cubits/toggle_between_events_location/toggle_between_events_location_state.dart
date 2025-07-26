part of 'toggle_between_events_location_cubit.dart';

@immutable
sealed class ToggleBetweenEventsLocationState {}

final class ToggleBetweenEventsLocationInitial
    extends ToggleBetweenEventsLocationState {}

final class ToggleBetweenEventsLocationSuccess
    extends ToggleBetweenEventsLocationState {
  final double lat;
  final double long;

  ToggleBetweenEventsLocationSuccess({required this.lat, required this.long});

}
