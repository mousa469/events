import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20auth%20errors/firebase_Auth_failure_messages_mapper.dart';
import 'package:events/features/layout/more/data/repos/more_repo.dart';
import 'package:flutter/material.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit({required this.moreRepo}) : super(SignOutInitial());

  final MoreRepo moreRepo;

  void SignOut({required BuildContext context}) async {
    emit(SignOutLoading());

    var result = await moreRepo.signOut();

    result.fold(
      (fail) {
        emit(
          SignOutFailure(
            errMessage: FirebaseAuthFailureMessagesMapper.mapper(
              failure: fail,
              context: context,
            ),
          ),
        );
      },
      (success) {
        emit(SignOutSuccess());
      },
    );
  }
}
