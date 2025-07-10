import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_messages_mapper.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';

part 'fetch_user_events_state.dart';

class FetchUserEventsCubit extends Cubit<FetchUserEventsState> {
  final HomeRepo homeRepo;
  List<Event> originalEvents = [];
  List<Event> filteredEvents = [];
  bool isEventsLoaded = false;

  FetchUserEventsCubit({required this.homeRepo}) : super(HomeInitial());

  void fetchUserEvents({required BuildContext context}) async {
    log("isEventsLoaded : ${isEventsLoaded}");
    if (!isEventsLoaded) {
      log("the  fetchUserEvents cubit triggered");
      emit(FetchUserEventsLoading());
      var result = await homeRepo.fetchUserEvents();
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
          if (originalEvents.isEmpty) {
            emit(FetchUserEventsSuccessfullyButEmpty());
          } else {
            emit(FetchUserEventsSuccessfully(events: events));
          }
          isEventsLoaded = true;
        },
      );
    }
  }

  void fetchUserEventsByCategory({required String userCategory}) {
    emit(FetchUserEventsLoading());
    if (userCategory == Keys.All) {
      emit(FetchUserEventsSuccessfully(events: originalEvents));
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
