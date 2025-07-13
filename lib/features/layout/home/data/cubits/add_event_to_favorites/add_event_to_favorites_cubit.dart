import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_messages_mapper.dart';
import 'package:events/features/layout/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';

part 'add_event_to_favorites_state.dart';

class AddEventToFavoritesCubit extends Cubit<AddEventToFavoritesState> {
  AddEventToFavoritesCubit({required this.homeRepo})
    : super(AddEventToFavoritesInitial());

  HomeRepo homeRepo;
  bool isLoading = false;

  void addEventToRepo({
    required String eventId,
    required BuildContext context,
  }) async {
    if (isLoading) return;
    emit(AddEventToFavoritesLoading());
    isLoading = true;

    var result = await homeRepo.addEventToFavourites(eventId: eventId);

    result.fold(
      (failure) {
        emit(
          AddEventToFavoritesFailure(
            errMessage: FirebaseFirestoreFailureMessagesMapper.mapper(
              failure: failure,
              context: context,
            ),
          ),
        );
        isLoading = false;
      },
      (success) {
        emit(AddEventToFavoritesSuccess());
        isLoading = false;
      },
    );
  }
}
