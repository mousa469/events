import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/features/layout/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';

part 'fetch_user_name_state.dart';

class FetchUserNameCubit extends Cubit<FetchUserNameState> {
  FetchUserNameCubit({required this.homeRepo}) : super(FetchUserNameInitial());

  final HomeRepo homeRepo;
    StreamSubscription? _subscription;


  void fetchUserName({required BuildContext context}) async {
    log("fetch user name cubit triggered ");
    emit(FetchUserNameLoading());

    _subscription?.cancel();

    _subscription = homeRepo.fetchUserName().listen((event) {
      event.fold(
        (failure) {
          emit(
            FetchUserNameFailure(errMessage: S.of(context).name_not_available),
          );
        },
        (userName) {
          emit(FetchUserNameSuccessfully(name: userName));
        },
      );
    });
  }


   @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
