part of 'add_event_to_favorites_cubit.dart';

@immutable
sealed class AddEventToFavoritesState {}

final class AddEventToFavoritesInitial extends AddEventToFavoritesState {}

final class AddEventToFavoritesSuccess extends AddEventToFavoritesState {}

final class AddEventToFavoritesFailure extends AddEventToFavoritesState {
  final String errMessage;

  AddEventToFavoritesFailure({required this.errMessage});
}

final class AddEventToFavoritesLoading extends AddEventToFavoritesState {}
