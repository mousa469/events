import 'package:bloc/bloc.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/features/layout/choose_event_location/data/models/user_search_location_model.dart';
import 'package:events/features/layout/choose_event_location/data/repo/choose_event_location_repo.dart';
import 'package:flutter/material.dart';

part 'user_search_location_state.dart';

class UserSearchLocationCubit extends Cubit<UserSearchLocationState> {
  UserSearchLocationCubit({required this.chooseEventLocationRepo})
    : super(UserSearchLocationInitial());

  ChooseEventLocationRepo chooseEventLocationRepo;

  void userSearchLocation({
    required String address,
    required BuildContext context,
  }) async {
    var result = await chooseEventLocationRepo.userSearchLocation(
      address: address,
    );

    result.fold(
      (Failure) {
        emit(
          UserSearchLocationFailure(errMessage: S.of(context).no_address_found),
        );
      },
      (locations) {
        emit(UserSearchLocationSuccess(locations: locations));
      },
    );
  }
}
