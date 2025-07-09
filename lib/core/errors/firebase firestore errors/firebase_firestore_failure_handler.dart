import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import '../failure.dart'; // Your existing Failure base class

class FirebaseFirestoreFailureHandler {
  static Failure handle(Exception exception) {
    switch (exception.runtimeType) {
      case AbortedException:
        return AbortedFailure();
      case AlreadyExistsException:
        return AlreadyExistsFailure();
      case CancelledException:
        return CancelledFailure();
      case DataLossException:
        return DataLossFailure();
      case DeadlineExceededException:
        return DeadlineExceededFailure();
      case FailedPreconditionException:
        return FailedPreconditionFailure();
      case InternalException:
        return InternalFailure();
      case InvalidArgumentException:
        return InvalidArgumentFailure();
      case NotFoundException:
        return NotFoundFailure();
      case OkException:
        return OkFailure();
      case OutOfRangeException:
        return OutOfRangeFailure();
      case PermissionDeniedException:
        return PermissionDeniedFailure();
      case ResourceExhaustedException:
        return ResourceExhaustedFailure();
      case UnauthenticatedException:
        return UnauthenticatedFailure();
      case UnavailableException:
        return UnavailableFailure();
      case UnimplementedException:
        return UnimplementedFailure();
      default:
        return UnExpectedFailure();
    }
  }
}

class CustomFirebaseStoreFailure extends Failure {}

class AbortedFailure extends CustomFirebaseStoreFailure {}

class AlreadyExistsFailure extends CustomFirebaseStoreFailure {}

class CancelledFailure extends CustomFirebaseStoreFailure {}

class DataLossFailure extends CustomFirebaseStoreFailure {}

class DeadlineExceededFailure extends CustomFirebaseStoreFailure {}

class FailedPreconditionFailure extends CustomFirebaseStoreFailure {}

class InternalFailure extends CustomFirebaseStoreFailure {}

class InvalidArgumentFailure extends CustomFirebaseStoreFailure {}

class NotFoundFailure extends CustomFirebaseStoreFailure {}

class OkFailure extends CustomFirebaseStoreFailure {}

class OutOfRangeFailure extends CustomFirebaseStoreFailure {}

class PermissionDeniedFailure extends CustomFirebaseStoreFailure {}

class ResourceExhaustedFailure extends CustomFirebaseStoreFailure {}

class UnauthenticatedFailure extends CustomFirebaseStoreFailure {}

class UnavailableFailure extends CustomFirebaseStoreFailure {}

class UnimplementedFailure extends CustomFirebaseStoreFailure {}

class UnknownFailure extends CustomFirebaseStoreFailure {}
