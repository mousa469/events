import 'package:firebase_auth/firebase_auth.dart';

class CustomFirebaseAuthException implements Exception {


 static void handle({
    required FirebaseAuthException authException,
  }) {
    switch (authException.code) {
      case 'weak-password':
        throw WeakPasswordException();
      case 'email-already-in-use':
        throw EmailAlreadyInUseException();
      case 'wrong-password':
        throw WrongPasswordException();
      case 'user-not-found':
        throw UserNotFoundException();
      case 'account-exists-with-different-credential':
        throw AccountAlreadyExistsWithDifferentCredentialException();
  

      default:
        throw InvalidEmailOrPasswordException();
    }
  }
}

class WeakPasswordException implements CustomFirebaseAuthException {}

class EmailAlreadyInUseException implements CustomFirebaseAuthException {}

class InvalidEmailOrPasswordException implements CustomFirebaseAuthException {}

class UserNotFoundException implements CustomFirebaseAuthException {}
class WrongPasswordException implements CustomFirebaseAuthException {}
class AccountAlreadyExistsWithDifferentCredentialException implements CustomFirebaseAuthException {}

