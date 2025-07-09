import 'package:events/core/localization/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import '../failure.dart';
import 'firebase_firestore_failure_handler.dart'; // if needed

abstract class FirebaseFirestoreFailureMessagesMapper {
  static String mapper({
    required Failure failure,
    required BuildContext context,
  }) {
    if (failure.runtimeType == AbortedFailure) {
      return S.of(context).ABORTED;
    } else if (failure.runtimeType == AlreadyExistsFailure) {
      return S.of(context).ALREADY_EXISTS;
    } else if (failure.runtimeType == CancelledFailure) {
      return S.of(context).CANCELLED;
    } else if (failure.runtimeType == DataLossFailure) {
      return S.of(context).DATA_LOSS;
    } else if (failure.runtimeType == DeadlineExceededFailure) {
      return S.of(context).DEADLINE_EXCEEDED;
    } else if (failure.runtimeType == FailedPreconditionFailure) {
      return S.of(context).FAILED_PRECONDITION;
    } else if (failure.runtimeType == InternalFailure) {
      return S.of(context).INTERNAL;
    } else if (failure.runtimeType == InvalidArgumentFailure) {
      return S.of(context).INVALID_ARGUMENT;
    } else if (failure.runtimeType == NotFoundFailure) {
      return S.of(context).NOT_FOUND;
    } else if (failure.runtimeType == OkFailure) {
      return S.of(context).OK;
    } else if (failure.runtimeType == OutOfRangeFailure) {
      return S.of(context).OUT_OF_RANGE;
    } else if (failure.runtimeType == PermissionDeniedFailure) {
      return S.of(context).PERMISSION_DENIED;
    } else if (failure.runtimeType == ResourceExhaustedFailure) {
      return S.of(context).RESOURCE_EXHAUSTED;
    } else if (failure.runtimeType == UnauthenticatedFailure) {
      return S.of(context).UNAUTHENTICATED;
    } else if (failure.runtimeType == UnavailableFailure) {
      return S.of(context).UNAVAILABLE;
    } else if (failure.runtimeType == UnimplementedFailure) {
      return S.of(context).UNIMPLEMENTED;
    } else if (failure.runtimeType == NoInternetConnectionFailure) {
      return S.of(context).no_internet_connection_failure;
    } else {
      return S.of(context).unexpected_error;
    }
  }
}
