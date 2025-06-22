import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/firebase_auth_exception_handler.dart';

class FirebaseAuthFailureHandler {
  static Failure handle({required Exception exception}) {
    switch (exception) {
      case WeakPasswordException():
        return weakPasswordFailure();

      case EmailAlreadyInUseException():
        return emailAlreadyInUserFailure();

      case InvalidEmailOrPasswordException():
        return InvalidEmailOrPasswordFailure();

      case UserNotFoundException():
        return UserNotFoundFailure();

      case WrongPasswordException():
        return WrongPasswordFailure();
      case AccountAlreadyExistsWithDifferentCredentialException():
        return AccountAlreadyExistsWithDifferentCredentialsFailure();

     

      default:
        return UnExpectedFailure();
    }
  }
}

class CustomFirebaseAuthFailure extends Failure {}


class weakPasswordFailure extends CustomFirebaseAuthFailure {}

class emailAlreadyInUserFailure extends CustomFirebaseAuthFailure {}

class InvalidEmailOrPasswordFailure extends CustomFirebaseAuthFailure {}

class UserNotFoundFailure extends CustomFirebaseAuthFailure {}

class WrongPasswordFailure extends CustomFirebaseAuthFailure {}
class AccountAlreadyExistsWithDifferentCredentialsFailure extends CustomFirebaseAuthFailure {}

