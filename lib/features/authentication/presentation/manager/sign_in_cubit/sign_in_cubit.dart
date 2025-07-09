import 'package:bloc/bloc.dart';
import 'package:events/core/errors/firebase%20auth%20errors/firebase_Auth_failure_messages_mapper.dart';
import 'package:events/core/errors/firebase%20auth%20errors/firebase_auth_exception_handler.dart';
import 'package:events/core/errors/firebase%20auth%20errors/firebase_auth_failure_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_failure_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_messages_mapper.dart';
import 'package:events/core/services/local_storage.dart';
import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/authentication/data/models/user.dart';
import 'package:events/features/authentication/data/repos/authentication_repo.dart';
import 'package:flutter/material.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required this.authenticationRepo,
    required this.localStorage,
    required this.secureLocalStorage,
  }) : super(SignInInitial());

  final AuthenticationRepo authenticationRepo;
  final LocalStorage localStorage;
  final SecureLocalStorage secureLocalStorage;

  void signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(SignInLoading());
    var result = await authenticationRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        emit(
          SignInFailure(
            errMessage: FirebaseAuthFailureMessagesMapper.mapper(
              failure: failure,
              context: context,
            ),
          ),
        );
      },
      (user) {
        emit(SignInSuccess(userModel: user));
        localStorage.setBool(value: true, key: Keys.isAthenticatedBefore);
        secureLocalStorage.addUserInfoToLocalStorage(user: user);
      },
    );
  }

  void signInWithGoogle({required BuildContext context}) async {
    emit(SignInLoading());
    var result = await authenticationRepo.signInWithGoogle();

    result.fold(
      (failure) {
        String errMessage = '';
        if (failure is CustomFirebaseStoreFailure) {
          errMessage = FirebaseFirestoreFailureMessagesMapper.mapper(
            failure: failure,
            context: context,
          );
        }
        if (failure is CustomFirebaseAuthException) {
          errMessage = FirebaseAuthFailureMessagesMapper.mapper(
            failure: failure,
            context: context,
          );
        }
        emit(SignInFailure(errMessage: errMessage));
      },
      (user) {
        emit(SignInSuccess(userModel: user));
        secureLocalStorage.addUserInfoToLocalStorage(user: user);

        localStorage.setBool(value: true, key: Keys.isAthenticatedBefore);
      },
    );
  }

  void signInWithFacebook({required BuildContext context}) async {
    emit(SignInLoading());
    var result = await authenticationRepo.signInWithFacebook();

    result.fold(
      (failure) {
        String errMessage = '';
        if (failure is CustomFirebaseStoreFailure) {
          errMessage = FirebaseFirestoreFailureMessagesMapper.mapper(
            failure: failure,
            context: context,
          );
        }
        if (failure is CustomFirebaseAuthFailure) {
          errMessage = FirebaseAuthFailureMessagesMapper.mapper(
            failure: failure,
            context: context,
          );
        }
        emit(SignInFailure(errMessage: errMessage));
      },
      (user) {
        emit(SignInSuccess(userModel: user));
        localStorage.setBool(value: true, key: Keys.isAthenticatedBefore);
        secureLocalStorage.addUserInfoToLocalStorage(user: user);
      },
    );
  }
}
