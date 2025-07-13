import 'package:events/core/services/service_locator.dart';
import 'package:events/features/layout/choose_event_location/data/repo/choose_event_location_repo_imp.dart';
import 'package:events/features/layout/choose_event_location/presentation/get_current_location_cubit/get_current_location_cubit.dart';
import 'package:events/features/layout/choose_event_location/presentation/user_search_location_cubit/user_search_location_cubit.dart';
import 'package:events/features/layout/choose_event_location/presentation/widgets/choose_event_location_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseEventLocationView extends StatelessWidget {
  const ChooseEventLocationView({super.key});

  static const String id = "ChooseEventLocationView";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetCurrentLocationCubit(
            chooseEventLocationRepo: getIt<ChooseEventLocationRepoImp>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserSearchLocationCubit(
            chooseEventLocationRepo: getIt<ChooseEventLocationRepoImp>(),
          ),
        ),
      ],
      child: Scaffold(
      
        body: ChooseEventLocationViewBody(),
      ),
    );
  }
}
