part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpCubitState {}

final class SignUpCubitInitial extends SignUpCubitState {}

final class SignUpFailure extends SignUpCubitState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class SignUpSuccess extends SignUpCubitState {
 final  UserModel user;

  SignUpSuccess({required this.user});
}

final class SignUpLoading extends SignUpCubitState {}
