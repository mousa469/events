import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/core/utilies/event_info.dart';
import 'package:events/core/widgets/custom_snack_bar.dart';
import 'package:events/features/layout/choose_event_location/presentation/get_current_location_cubit/get_current_location_cubit.dart';
import 'package:events/features/layout/choose_event_location/presentation/user_search_location_cubit/user_search_location_cubit.dart';
import 'package:events/features/layout/choose_event_location/presentation/widgets/user_search_location_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ChooseEventLocationViewBody extends StatefulWidget {
  const ChooseEventLocationViewBody({super.key});

  @override
  State<ChooseEventLocationViewBody> createState() =>
      _ChooseEventLocationViewBodyState();
}

class _ChooseEventLocationViewBodyState
    extends State<ChooseEventLocationViewBody> {
  LatLng userCurrentLocation = LatLng(0, 0);
  LatLng? userSelectedLocation;
  Set<Marker> markers = {};
  late CameraPosition initialCameraPosition;
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    initialCameraPosition = CameraPosition(
      target: userCurrentLocation,
      zoom: 10,
    );
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var eventInfo = Provider.of<EventInformation>(context);
    return Stack(
      children: [
        BlocConsumer<GetCurrentLocationCubit, GetCurrentLocationState>(
          listener: (context, state) {
            if (state is GetCurrentLocationSuccess) {
              var userCurrentLocation = LatLng(
                state.userLocation.latitude,
                state.userLocation.longtude,
              );
              mapController.animateCamera(
                CameraUpdate.newLatLngZoom(userCurrentLocation, 16),
              );
            } else if (state is GetCurrentLocationFailure) {
              CustomSnackBar(
                type: SnackBarType.failure,
                title: S.of(context).oops,
                subTitle: state.errMessage,
                context: context,
              );
            }
          },
          builder: (context, state) {
            if (state is GetCurrentLocationSuccess) {
              markers.add(
                Marker(
                  position: LatLng(
                    state.userLocation.latitude,
                    state.userLocation.longtude,
                  ),
                  markerId: MarkerId("1"),
                  icon: BitmapDescriptor.defaultMarker,
                ),
              );
            }
            return GoogleMap(
              onTap: (argument) {
                userSelectedLocation = argument;
                setState(() {
                  markers.clear();
                  markers.add(
                    Marker(
                      position: userSelectedLocation!,
                      markerId: MarkerId("2"),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue,
                      ),
                    ),
                  );
                });
              },
              zoomControlsEnabled: false,
              markers: markers,

              initialCameraPosition: initialCameraPosition,
              onMapCreated: (controller) {
                mapController = controller;
                BlocProvider.of<GetCurrentLocationCubit>(
                  context,
                ).getUserCurrentLocation(context: context);
              },
            );
          },
        ),

        // Search field overlay
        Column(
          children: [
            //////////////////////////////
            BlocListener<UserSearchLocationCubit, UserSearchLocationState>(
              listener: (context, state) {
                if (state is UserSearchLocationSuccess) {
                  for (int i = 0; i < state.locations.length; i++) {
                    mapController.animateCamera(
                      CameraUpdate.newLatLngZoom(
                        LatLng(
                          state.locations[i].latitude,
                          state.locations[i].longtude,
                        ),
                        16,
                      ),
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
              child: UserSearchLocationTextField(),
            ),
            /////////////////////////////
            Spacer(),
            InkWell(
              onTap: () {
                if (userSelectedLocation == null) {
                  CustomSnackBar(
                    type: SnackBarType.warning,
                    title: S.of(context).warning,
                    subTitle: S.of(context).you_should_tap_your_event_location,
                    context: context,
                  );
                } else {
                  eventInfo.eventLat = userSelectedLocation!.latitude;
                  eventInfo.eventLong = userSelectedLocation!.longitude;
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


      // BlocListener<UserSearchLocationCubit, UserSearchLocationState>(
      //         listener: (context, state) {
      //           if (state is UserSearchLocationSuccess) {
      //             for (int i = 0; i < state.locations.length; i++) {
      //               mapController.animateCamera(
      //                 CameraUpdate.newLatLngZoom(
      //                   LatLng(
      //                     state.locations[i].latitude,
      //                     state.locations[i].longtude,
      //                   ),
      //                   16,
      //                 ),
      //               );
      //             }
      //           } else if (state is UserSearchLocationFailure) {
      //             CustomSnackBar(
      //               type: SnackBarType.failure,
      //               title: S.of(context).oops,
      //               subTitle: state.errMessage,
      //               context: context,
      //             );
      //           }
      //         },
      //       ),