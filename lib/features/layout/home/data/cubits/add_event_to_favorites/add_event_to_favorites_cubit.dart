import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_messages_mapper.dart';
import 'package:events/features/layout/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';

part 'add_event_to_favorites_state.dart';

class AddEventToFavoritesCubit extends Cubit<AddEventToFavoritesState> {
  AddEventToFavoritesCubit({required this.homeRepo})
    : super(AddEventToFavoritesInitial());

  HomeRepo homeRepo;

  void addEventToRepo({
    required String eventId,
    required BuildContext context,
  }) async {
    emit(AddEventToFavoritesLoading());
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
      },
      (success) {
        emit(AddEventToFavoritesSuccess());
      },
    );
  }
}
