part of 'get_current_location_cubit.dart';

@immutable
sealed class GetCurrentLocationState {}

final class GetCurrentLocationInitial extends GetCurrentLocationState {}

final class GetCurrentLocationPermissionDeniedForEver
    extends GetCurrentLocationState {
  final String errMessage;

  GetCurrentLocationPermissionDeniedForEver({required this.errMessage});
}

final class GetCurrentLocationSuccess extends GetCurrentLocationState {
  final UserProvidedLocation userLocation;

  GetCurrentLocationSuccess({required this.userLocation});
}

final class GetCurrentLocationFailure extends GetCurrentLocationState {
  final String errMessage;

  GetCurrentLocationFailure({required this.errMessage});
}
