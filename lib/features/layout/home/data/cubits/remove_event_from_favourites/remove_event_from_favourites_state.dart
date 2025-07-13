part of 'remove_event_from_favourites_cubit.dart';

@immutable
sealed class RemoveEventFromFavouritesState {}

final class RemoveEventFromFavouritesInitial
    extends RemoveEventFromFavouritesState {}

final class RemoveEventFromFavouritesLoading
    extends RemoveEventFromFavouritesState {}

final class RemoveEventFromFavouritesSuccess
    extends RemoveEventFromFavouritesState {
      
    }

final class RemoveEventFromFavouritesFailure
    extends RemoveEventFromFavouritesState {
  final String errMessage;

  RemoveEventFromFavouritesFailure({required this.errMessage});
}
