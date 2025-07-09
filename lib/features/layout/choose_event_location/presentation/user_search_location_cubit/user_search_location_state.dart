part of 'user_search_location_cubit.dart';

@immutable
sealed class UserSearchLocationState {}

final class UserSearchLocationInitial extends UserSearchLocationState {}

final class UserSearchLocationSuccess extends UserSearchLocationState {
  List<UserSearchLocationModel> locations;
  UserSearchLocationSuccess({required this.locations});
}

final class UserSearchLocationFailure extends UserSearchLocationState {
  final String errMessage;

  UserSearchLocationFailure({required this.errMessage});
}
