import 'dart:async';
import 'dart:developer';

import 'package:events/core/extensions/padding_extension.dart';
import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/event_info.dart';
import 'package:events/core/widgets/app_settings_dialog.dart';
import 'package:events/core/widgets/custom_snack_bar.dart';
import 'package:events/core/widgets/custom_text_form_field.dart';
import 'package:events/features/layout/choose_event_location/presentation/get_current_location_cubit/get_current_location_cubit.dart';
import 'package:events/features/layout/choose_event_location/presentation/user_search_location_cubit/user_search_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class ChooseEventLocationViewBody extends StatefulWidget {
  const ChooseEventLocationViewBody({super.key});

  @override
  State<ChooseEventLocationViewBody> createState() =>
      _ChooseEventLocationViewBodyState();
}

class _ChooseEventLocationViewBodyState
    extends State<ChooseEventLocationViewBody> {
  late MapController mapController;
  LatLng userCurrentLocation = LatLng(0, 0);
  late TextEditingController locationController;
  List<Marker> markers = [];
  LatLng? onUserTapCoordinates;

  Timer? debounce;

  void onSearchChanged(String? address) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(seconds: 1), () {
      if (address == null || address.isEmpty) {
        log("empty string");
      } else {
        BlocProvider.of<UserSearchLocationCubit>(
          context,
        ).userSearchLocation(address: address, context: context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetCurrentLocationCubit>(
      context,
    ).getUserCurrentLocation(context: context);
    mapController = MapController();
    locationController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
    locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var eventInfo = Provider.of<EventInformation>(context , listen: false);
    return Stack(
      children: [
        MultiBlocListener(
          listeners: [
            BlocListener<GetCurrentLocationCubit, GetCurrentLocationState>(
              listener: (context, state) {
                if (state is GetCurrentLocationSuccess) {
                  var values = state.userLocation;
                  userCurrentLocation = LatLng(
                    values.latitude,
                    values.longtude,
                  );
                  mapController.move(userCurrentLocation, 16);
                }

                if (state is GetCurrentLocationFailure) {
                  CustomSnackBar(
                    type: SnackBarType.failure,
                    title: S.of(context).oops,
                    subTitle: state.errMessage,
                    context: context,
                  );
                }

                if (state is GetCurrentLocationPermissionDeniedForEver) {
                  showAppSettingsDialog(context: context);
                }
              },
            ),

            BlocListener<UserSearchLocationCubit, UserSearchLocationState>(
              listener: (context, state) {
                if (state is UserSearchLocationSuccess) {
                  for (int i = 0; i < state.locations.length; i++) {
                    mapController.move(
                      LatLng(
                        state.locations[i].latitude,
                        state.locations[i].longtude,
                      ),
                      16,
                    );
                  }
                } else if (state is UserSearchLocationFailure) {
                  CustomSnackBar(
                    type: SnackBarType.failure,
                    title: S.of(context).oops,
                    subTitle: state.errMessage,
                    context: context,
                  );
                }
              },
            ),
          ],
          child: FlutterMap(
            options: MapOptions(
              onTap: (tapPosition, point) {
                onUserTapCoordinates = point;
                setState(() {
                  markers.clear();
                  markers.add(
                    Marker(
                      height: 100,
                      width: 100,
                      point: onUserTapCoordinates!,
                      child: Icon(Icons.location_on, color: Colors.red),
                    ),
                  );
                });
              },
              initialCenter: LatLng(0, 0),
              initialZoom: 2,
              maxZoom: 100,
              minZoom: 0,
            ),
            mapController: mapController,
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              CurrentLocationLayer(
                style: LocationMarkerStyle(
                  markerSize: Size(35.w, 35.h),
                  marker: DefaultLocationMarker(
                    child: Icon(Icons.location_on, color: Colors.white),
                  ),
                ),
              ),
              MarkerLayer(markers: markers),
            ],
          ),
        ),

        // Search field overlay
        Column(
          children: [
            CustomTextField(
              fillColor: AppColors.white,
              controller: locationController,
              hint: S.of(context).Search_for_your_event_Location,
              onChanged: onSearchChanged,
            ).symmetricPadding(horizontalValue: 16.w, verticalValue: 20.h),
            Spacer(),
            InkWell(
              onTap: () {
                if (onUserTapCoordinates == null) {
                  CustomSnackBar(
                    type: SnackBarType.warning,
                    title: S.of(context).warning,
                    subTitle: S.of(context).you_should_tap_your_event_location,
                    context: context,
                  );
                } else {
                  eventInfo.eventLat = onUserTapCoordinates!.latitude;
                  eventInfo.eventLong = onUserTapCoordinates!.longitude;
                  context.pop();
                }
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.primaryColor),
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).Press_here_after_tap_your_location,
                    style: AppStyles.style20Bold.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
