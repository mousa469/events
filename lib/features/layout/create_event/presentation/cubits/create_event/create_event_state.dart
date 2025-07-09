part of 'create_event_cubit.dart';

@immutable
sealed class CreateEventState {}

final class CreateEventInitial extends CreateEventState {}

final class CreateEventLoading extends CreateEventState {}

final class CreateEventSuccess extends CreateEventState {}

final class CreateEventFailure extends CreateEventState {
  final String errMessage;

  CreateEventFailure({required this.errMessage}); 

}
