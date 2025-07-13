import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_messages_mapper.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/favorites/data/repos/favorits_repo.dart';
import 'package:flutter/material.dart';

part 'fetch_favourite_events_state.dart';

class FetchFavouriteEventsCubit extends Cubit<FetchFavouriteEventsState> {
  FetchFavouriteEventsCubit({required this.favoritsRepo})
    : super(FetchFavouriteEventsInitial());

  FavoritsRepo favoritsRepo;

  void fetchFavouriteEvents({required BuildContext context}) async {
    log("fetchFavouriteEvents cubit triggered");
    emit(FetchFavouriteEventsLoading());

    var result = await favoritsRepo.fetchFavoritesEvents();

    result.fold(
      (failure) {
        emit(
          FetchFavouriteEventsFailure(
            errMessage: FirebaseFirestoreFailureMessagesMapper.mapper(
              failure: failure,
              context: context,
            ),
          ),
        );
      },
      (events) {
        emit(FetchFavouriteEventsSuccess(events: events));
      },
    );
  }
}
