import 'package:events/core/errors/firebase%20auth%20errors/firebase_auth_exception_handler.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_failure_handler.dart';

class Failure {}

class UnExpectedFailure extends Failure
    implements CustomFirebaseStoreFailure, CustomFirebaseAuthException {}
class NoInternetConnectionFailure extends Failure
    implements CustomFirebaseStoreFailure, CustomFirebaseAuthException {}
