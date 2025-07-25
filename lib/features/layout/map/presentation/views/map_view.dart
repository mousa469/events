import 'package:events/core/services/service_locator.dart';
import 'package:events/features/layout/fetch_user_events/data/cubits/fetch_user_events/fetch_user_events_cubit.dart';
import 'package:events/features/layout/fetch_user_events/data/repos/fetch_user_events_repo_impl.dart';
import 'package:events/features/layout/map/presentation/widgets/map_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  static const String id = "MapView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchUserEventsCubit(fetchUserEventsRepo: getIt<FetchUserEventsRepoImpl>()),
      child: Scaffold(body: MapViewBody()),
    );
  }
}
