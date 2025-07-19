part of 'update_event_details_cubit.dart';

@immutable
sealed class UpdateEventDetailsState {}

final class UpdateEventDetailsInitial extends UpdateEventDetailsState {}

final class UpdateEventDetailsSuccess extends UpdateEventDetailsState {}

final class UpdateEventDetailsFailure extends UpdateEventDetailsState {
  final String errMessage;

  UpdateEventDetailsFailure({required this.errMessage});

}

final class UpdateEventDetailsLoading extends UpdateEventDetailsState {}
