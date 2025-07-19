import 'package:events/constants.dart';
import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/features/layout/edit_event/data/managers/update_event_details/update_event_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UpdateEventLocationViewBody extends StatefulWidget {
  const UpdateEventLocationViewBody({super.key});

  @override
  State<UpdateEventLocationViewBody> createState() =>
      _UpdateEventLocationViewState();
}

class _UpdateEventLocationViewState extends State<UpdateEventLocationViewBody> {
  late CameraPosition initialCameraPosition;
  late LatLng initialLatLong;
  Set<Marker> markers = {};
  LatLng? userSelectedLocation;

  @override
  void initState() {
    super.initState();
    double lat = BlocProvider.of<UpdateEventDetailsCubit>(context).lat!;
    double long = BlocProvider.of<UpdateEventDetailsCubit>(context).long!;
    initialLatLong = LatLng(lat, long);
    initialCameraPosition = CameraPosition(
      target: initialLatLong,
      zoom: initialCameraZoom,
    );
    markers.add(Marker(markerId: MarkerId("6"), position: initialLatLong));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              onTap: (argument) {
                userSelectedLocation = argument;
                setState(() {
                  markers.clear();
                  markers.add(
                    Marker(
                      position: userSelectedLocation!,
                      markerId: MarkerId("7"),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue,
                      ),
                    ),
                  );
                });
              },
              markers: markers,
              initialCameraPosition: initialCameraPosition,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<UpdateEventDetailsCubit>(context).lat =
                        userSelectedLocation!.latitude;
                    BlocProvider.of<UpdateEventDetailsCubit>(context).long =
                        userSelectedLocation!.longitude;

                    context.pop();
                  },
                  child: Container(
                    height: 80.h,
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
              ],
            ),
          ],
        );
      },
    );
  }
}
