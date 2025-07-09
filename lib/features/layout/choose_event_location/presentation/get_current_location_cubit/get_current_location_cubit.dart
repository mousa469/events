import 'package:bloc/bloc.dart';
import 'package:events/core/errors/location%20services%20errors/location_services_failures.dart';
import 'package:events/core/errors/location%20services%20errors/location_services_messages_mapper.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/features/layout/choose_event_location/data/models/user_location.dart';
import 'package:events/features/layout/choose_event_location/data/repo/choose_event_location_repo.dart';
import 'package:flutter/material.dart';

part 'get_current_location_cubit_state.dart';

class GetCurrentLocationCubit extends Cubit<GetCurrentLocationState> {
  GetCurrentLocationCubit({required this.chooseEventLocationRepo})
    : super(GetCurrentLocationInitial());

  ChooseEventLocationRepo chooseEventLocationRepo;

  getUserCurrentLocation({required BuildContext context}) async {
    var result = await chooseEventLocationRepo.getUserCurrentLocation();

    result.fold(
      (Fail) {
        if (Fail is LocationPermissionDeniedForeverFailure) {
          emit(
            GetCurrentLocationPermissionDeniedForEver(
              errMessage: S.of(context).location_permission_message,
            ),
          );
        }

        emit(
          GetCurrentLocationFailure(
            errMessage: LocationServicesMessagesMapper.mapper(
              failure: Fail,
              context: context,
            ),
          ),
        );
      },
      (location) {
        emit(GetCurrentLocationSuccess(userLocation: location));
      },
    );
  }
}
