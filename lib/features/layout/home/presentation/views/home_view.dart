import 'package:events/core/services/service_locator.dart';
import 'package:events/features/layout/home/data/cubits/add_event_to_favorites/add_event_to_favorites_cubit.dart';
import 'package:events/features/layout/home/data/cubits/fetch_user_events/fetch_user_events_cubit.dart';
import 'package:events/features/layout/home/data/cubits/fetch_user_name/fetch_user_name_cubit.dart';
import 'package:events/features/layout/home/data/cubits/remove_event_from_favourites/remove_event_from_favourites_cubit.dart';
import 'package:events/features/layout/home/data/repos/home_repo_imp.dart';
import 'package:events/features/layout/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = "homeView";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<FetchUserNameCubit>(),
          ),
        BlocProvider.value(
          value: getIt<FetchUserEventsCubit>(),
  ),
        BlocProvider(create: (context) => AddEventToFavoritesCubit(homeRepo: getIt<HomeRepoImp>()),),
        BlocProvider(create: (context) => RemoveEventFromFavouritesCubit(homeRepo: getIt<HomeRepoImp>()),),

      ],
      child: Scaffold(body: HomeViewBody()));
  }
}
