import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_messages_mapper.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/edit_event/data/repos/edit_event_repo.dart';
import 'package:flutter/material.dart';

part 'update_event_details_state.dart';

class UpdateEventDetailsCubit extends Cubit<UpdateEventDetailsState> {
  UpdateEventDetailsCubit({required this.editEventRepo})
    : super(UpdateEventDetailsInitial());

  EditEventRepo editEventRepo;

  String? date;
  String? time;
  String? title;
  String? description;
  double? lat;
  double? long;
  String? category;

  void updateEventDetails({
    required Event event,
    required BuildContext context,
  }) async {

    event.date = date!;
    event.time = time!;
    event.title = title!;
    event.description = description!;
    event.lat = lat!;
    event.long = long!;
    event.category = category!;
    emit(UpdateEventDetailsLoading());
    var result = await editEventRepo.updateEventDetails(event: event);
    result.fold(
      (failure) {
        emit(
          UpdateEventDetailsFailure(
            errMessage: FirebaseFirestoreFailureMessagesMapper.mapper(
              failure: failure,
              context: context,
            ),
          ),
        );
      },
      (success) {
        emit(UpdateEventDetailsSuccess());
      },
    );
  }
}
