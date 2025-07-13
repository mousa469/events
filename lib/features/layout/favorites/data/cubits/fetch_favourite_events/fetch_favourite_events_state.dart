part of 'fetch_favourite_events_cubit.dart';

@immutable
sealed class FetchFavouriteEventsState {}

final class FetchFavouriteEventsInitial extends FetchFavouriteEventsState {}

final class FetchFavouriteEventsLoading extends FetchFavouriteEventsState {}

final class FetchFavouriteEventsSuccess extends FetchFavouriteEventsState {
 final  List<Event> events;
  FetchFavouriteEventsSuccess({required this.events});
}

final class FetchFavouriteEventsFailure extends FetchFavouriteEventsState {
  final String errMessage;

  FetchFavouriteEventsFailure({required this.errMessage});
}
