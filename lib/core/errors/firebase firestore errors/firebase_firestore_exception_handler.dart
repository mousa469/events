import 'package:events/core/errors/un_expected_exception.dart';
import 'package:firebase_core/firebase_core.dart';

/// Marker interface
abstract class CustomFirebaseFirestoreException implements Exception {
  static void handle(FirebaseException e) {
    switch (e.code) {
      case 'aborted':
        throw AbortedException();
      case 'already-exists':
        throw AlreadyExistsException();
      case 'cancelled':
        throw CancelledException();
      case 'data-loss':
        throw DataLossException();
      case 'deadline-exceeded':
        throw DeadlineExceededException();
      case 'failed-precondition':
        throw FailedPreconditionException();
      case 'internal':
        throw InternalException();
      case 'invalid-argument':
        throw InvalidArgumentException();
      case 'not-found':
        throw NotFoundException();
      case 'ok':
        throw OkException();
      case 'out-of-range':
        throw OutOfRangeException();
      case 'permission-denied':
        throw PermissionDeniedException();
      case 'resource-exhausted':
        throw ResourceExhaustedException();
      case 'unauthenticated':
        throw UnauthenticatedException();
      case 'unavailable':
        throw UnavailableException();
      case 'unimplemented':
        throw UnimplementedException();
      case 'unknown':
      default:
        throw UnExpectedException();
    }
  }
}

class AbortedException implements CustomFirebaseFirestoreException {}
class AlreadyExistsException implements CustomFirebaseFirestoreException {}
class CancelledException implements CustomFirebaseFirestoreException {}
class DataLossException implements CustomFirebaseFirestoreException {}
class DeadlineExceededException implements CustomFirebaseFirestoreException {}
class FailedPreconditionException implements CustomFirebaseFirestoreException {}
class InternalException implements CustomFirebaseFirestoreException {}
class InvalidArgumentException implements CustomFirebaseFirestoreException {}
class NotFoundException implements CustomFirebaseFirestoreException {}
class OkException implements CustomFirebaseFirestoreException {}
class OutOfRangeException implements CustomFirebaseFirestoreException {}
class PermissionDeniedException implements CustomFirebaseFirestoreException {}
class ResourceExhaustedException implements CustomFirebaseFirestoreException {}
class UnauthenticatedException implements CustomFirebaseFirestoreException {}
class UnavailableException implements CustomFirebaseFirestoreException {}
class UnimplementedException implements CustomFirebaseFirestoreException {}
// class UnknownException implements CustomFirebaseFirestoreException {}