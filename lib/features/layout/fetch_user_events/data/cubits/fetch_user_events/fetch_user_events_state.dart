part of 'fetch_user_events_cubit.dart';

@immutable
sealed class FetchUserEventsState {}

final class HomeInitial extends FetchUserEventsState {}

final class FetchUserEventsLoading extends FetchUserEventsState {}

final class FetchUserEventsSuccessfully extends FetchUserEventsState {
  final List<Event> events;

  FetchUserEventsSuccessfully({required this.events});
}

final class FetchUserEventsSuccessfullyButEmpty extends FetchUserEventsState {}

final class FetchUserEventsFailure extends FetchUserEventsState {
  final String errMessage;

  FetchUserEventsFailure({required this.errMessage});
}