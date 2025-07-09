import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/location%20services%20errors/location_services_failures.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class LocationServicesMessagesMapper {
  static String mapper({
    required Failure failure,
    required BuildContext context,
  }) {
    if (failure.runtimeType == LocationPermissionDeniedFailure) {
      return S.of(context).location_permission_message;
    } else if (failure.runtimeType == LocationPermissionDeniedForeverFailure) {
      return S.of(context).location_permission_message;
    } else if (failure.runtimeType == LocationServiceDeniedFailure) {
      return S.of(context).Location_services_denied_instruction;
    } else {
      return S.of(context).unexpected_error;
    }
  }
}



