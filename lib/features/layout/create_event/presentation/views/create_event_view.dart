import 'package:events/core/services/service_locator.dart';
import 'package:events/core/widgets/custom_app_bar.dart';
import 'package:events/features/layout/create_event/data/repos/create_event_repo_imp.dart';
import 'package:events/features/layout/create_event/presentation/cubits/create_event/create_event_cubit.dart';
import 'package:events/features/layout/create_event/presentation/widgets/create_event_view_body.dart';
import 'package:events/features/layout/home/data/cubits/fetch_user_events/fetch_user_events_cubit.dart';
import 'package:events/features/layout/home/data/repos/home_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  static const String id = "CreateEventView";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CreateEventCubit(createEventRepo: getIt<CreateEventRepoImp>()),
        ),
        BlocProvider(
          create: (context) =>
              FetchUserEventsCubit(homeRepo: getIt<HomeRepoImp>()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: "Create Event"),
        body: CreateEventViewBody(),
      ),
    );
  }
}
