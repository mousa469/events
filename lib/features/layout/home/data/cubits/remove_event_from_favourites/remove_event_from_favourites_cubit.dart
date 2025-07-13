import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_messages_mapper.dart';
import 'package:events/features/layout/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'remove_event_from_favourites_state.dart';

class RemoveEventFromFavouritesCubit
    extends Cubit<RemoveEventFromFavouritesState> {
  RemoveEventFromFavouritesCubit({required this.homeRepo})
    : super(RemoveEventFromFavouritesInitial());

  HomeRepo homeRepo;
  bool isLoading = false;

  void removeEventFromFavourites({
    required String eventId,
    required BuildContext context,
  }) async {
    if (isLoading) return;
    emit(RemoveEventFromFavouritesLoading());
    isLoading = true;
    var result = await homeRepo.removeEventFromFavorites(eventId: eventId);

    result.fold(
      (failure) {
        emit(
          RemoveEventFromFavouritesFailure(
            errMessage: FirebaseFirestoreFailureMessagesMapper.mapper(
              failure: failure,
              context: context,
            ),
          ),
        );
        isLoading = false;
      },
      (success) {
        emit(RemoveEventFromFavouritesSuccess());
        isLoading = false;
      },
    );
  }
}
