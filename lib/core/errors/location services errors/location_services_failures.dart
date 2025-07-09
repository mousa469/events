import 'package:events/core/errors/failure.dart';
import 'package:events/core/errors/location%20services%20errors/location_services_exceptions.dart';

class LocationServiceDeniedFailure extends Failure {}

class LocationPermissionDeniedFailure extends Failure {}

class LocationPermissionDeniedForeverFailure extends Failure {}

abstract class LocationServicesFailuresMapper {
  static handle({required Exception ex}) {
    if (ex is LocationServiceDeniedException) {
      return LocationServiceDeniedFailure();
    } else if (ex is LocationPermissionDeniedException) {
      return LocationPermissionDeniedFailure;
    } else if (ex is LocationPermissionDeniedForeverException) {
      return LocationPermissionDeniedForeverFailure;
    } else {
      return UnExpectedFailure();
    }
  }
}

