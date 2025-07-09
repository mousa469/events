part of 'fetch_user_name_cubit.dart';

@immutable
sealed class FetchUserNameState {}

final class FetchUserNameInitial extends FetchUserNameState {}

final class FetchUserNameLoading extends FetchUserNameState {}

final class FetchUserNameFailure extends FetchUserNameState {
  final String errMessage;

  FetchUserNameFailure({required this.errMessage});
}

final class FetchUserNameSuccessfully extends FetchUserNameState {
  final String name;

  FetchUserNameSuccessfully({required this.name});
}
