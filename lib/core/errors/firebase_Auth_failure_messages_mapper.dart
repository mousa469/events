import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase_auth_failure_handler.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class FirebaseAuthFailureMessagesMapper {
  static String mapper({
    required Failure failure,
    required BuildContext context,
  }) {
    if (failure.runtimeType == weakPasswordFailure) {
      return S.of(context).weak_password;
    } else if (failure.runtimeType == emailAlreadyInUserFailure) {
      return S.of(context).email_already_in_use;
    } else if (failure.runtimeType == InvalidEmailOrPasswordFailure) {
      return S.of(context).invalid_credentials;
    } else if (failure.runtimeType == UserNotFoundFailure) {
      return S.of(context).user_not_found;
    } else if (failure.runtimeType ==
        AccountAlreadyExistsWithDifferentCredentialsFailure) {
      return S.of(context).accountExistsWithDifferentCredential;
    } else if (failure.runtimeType == WrongPasswordFailure) {
      return S.of(context).wrong_password;
    } else {
      return S.of(context).unexpected_error;
    }
  }
}


