import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20auth%20errors/firebase_Auth_failure_messages_mapper.dart';
import 'package:events/core/services/local_storage.dart';
import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/authentication/data/models/user.dart';
import 'package:events/features/authentication/data/repos/authentication_repo.dart';
import 'package:flutter/material.dart';

part 'sign_up_cubit_state.dart';

class SignUpCubit extends Cubit<SignUpCubitState> {
  SignUpCubit({
    required this.authenticationRepo,
    required this.localStorage,
    required this.secureLocalStorage,
  }) : super(SignUpCubitInitial());

  final AuthenticationRepo authenticationRepo;
  final LocalStorage localStorage;
  final SecureLocalStorage secureLocalStorage;

  void createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    emit(SignUpLoading());
    var result = await authenticationRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );

    result.fold(
      (failure) {
        emit(
          SignUpFailure(
            errMessage: FirebaseAuthFailureMessagesMapper.mapper(
              failure: failure,
              context: context,
            ),
          ),
        );
      },
      (user) {
        emit(SignUpSuccess(user: user));
        localStorage.setBool(value: true, key: Keys.isAthenticatedBefore);
        secureLocalStorage.addUserInfoToLocalStorage(user: user);
        log(
          "user is authenticated before : ${localStorage.getBool(key: Keys.isAthenticatedBefore)} ",
        );
      },
    );
  }
}
