part of 'fetch_event_location_cubit.dart';

@immutable
sealed class FetchEventLocationState {}

final class FetchEventLocationInitial extends FetchEventLocationState {}

final class FetchEventLocationLoading extends FetchEventLocationState {}

final class FetchEventLocationSuccess extends FetchEventLocationState {
  final PlaceDetails placeDetails;
  FetchEventLocationSuccess({required this.placeDetails});
}

final class FetchEventLocationFailure extends FetchEventLocationState {}
