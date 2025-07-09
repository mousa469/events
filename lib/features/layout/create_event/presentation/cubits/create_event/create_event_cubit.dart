import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_messages_mapper.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/create_event/data/repos/create_event_repo.dart';
import 'package:flutter/material.dart';

part 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit({required this.createEventRepo})
    : super(CreateEventInitial());

  CreateEventRepo createEventRepo;

  void createEvent({
    required Event event,
    required BuildContext context,
  }) async {
    emit(CreateEventLoading());
    var result = await createEventRepo.addEvent(event: event);

    result.fold(
      (fail) {
        emit(
          CreateEventFailure(
            errMessage: FirebaseFirestoreFailureMessagesMapper.mapper(
              failure: fail,
              context: context,
            ),
          ),
        );
      },
      (unit) {
        emit(CreateEventSuccess());
      },
    );
  }
}
