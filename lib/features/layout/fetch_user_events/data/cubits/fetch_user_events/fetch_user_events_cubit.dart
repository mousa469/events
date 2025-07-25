import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_messages_mapper.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/fetch_user_events/data/repos/fetch_user_events_repo.dart';
import 'package:flutter/material.dart';

part 'fetch_user_events_state.dart';

class FetchUserEventsCubit extends Cubit<FetchUserEventsState> {
  final FetchUserEventsRepo fetchUserEventsRepo;
  List<Event> originalEvents = [];
  List<Event> filteredEvents = [];
  bool isEventsLoaded = false;

  FetchUserEventsCubit({required this.fetchUserEventsRepo}) : super(HomeInitial());

  void fetchUserEvents({required BuildContext context}) async {
    if (isEventsLoaded) return;
    log(
      "the flag is passed  and the flag is $isEventsLoaded in fetchUserEvents ",
    );

    emit(FetchUserEventsLoading());
    var result = await fetchUserEventsRepo.fetchUserEvents();
    result.fold(
      (fail) {
        FetchUserEventsFailure(
          errMessage: FirebaseFirestoreFailureMessagesMapper.mapper(
            failure: fail,
            context: context,
          ),
        );
      },
      (events) {
        originalEvents = events;
        isEventsLoaded = true;
        if (originalEvents.isEmpty) {
          emit(FetchUserEventsSuccessfullyButEmpty());
        } else {
          emit(FetchUserEventsSuccessfully(events: events));
        }
      },
    );
  }

  void fetchUserEventsByCategory({required String userCategory}) {
    if (isEventsLoaded) return;
    log(
      "the flag is passed  and the flag is $isEventsLoaded in fetchUserEventsByCategory",
    );
    emit(FetchUserEventsLoading());
    if (userCategory == Keys.All) {
      if (originalEvents.isEmpty) {
        emit(FetchUserEventsSuccessfullyButEmpty());
      } else {
        emit(FetchUserEventsSuccessfully(events: originalEvents));
      }

      return;
    }

    filteredEvents.clear();
    for (var i = 0; i < originalEvents.length; i++) {
      if (originalEvents[i].category == userCategory) {
        filteredEvents.add(originalEvents[i]);
      }
    }
    if (filteredEvents.isEmpty) {
      emit(FetchUserEventsSuccessfullyButEmpty());
    } else {
      emit(FetchUserEventsSuccessfully(events: filteredEvents));
    }
  }
}