import 'package:bloc/bloc.dart';
import 'package:events/features/layout/event_details/data/models/place_details.dart';
import 'package:events/features/layout/event_details/data/repos/event_details_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_event_location_state.dart';

class FetchEventLocationCubit extends Cubit<FetchEventLocationState> {
  FetchEventLocationCubit({required this.eventDetailsRepo})
    : super(FetchEventLocationInitial());

  final EventDetailsRepo eventDetailsRepo;

  Future<void> fetchEventLocation({
    required double latitude,
    required double longitude,
  }) async {
    emit(FetchEventLocationLoading());
    final result = await eventDetailsRepo
        .fetchEventPlaceDetailsFromLatitudeAndLongitude(
          latitude: latitude,
          longitude: longitude,
        );
    result.fold(
      (failure) => emit(FetchEventLocationFailure()),
      (placeDetails) =>
          emit(FetchEventLocationSuccess(placeDetails: placeDetails)),
    );
  }
}
