import 'package:events/core/services/service_locator.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/features/layout/favorites/data/cubits/fetch_favourite_events/fetch_favourite_events_cubit.dart';
import 'package:events/features/layout/favorites/data/repos/favourits_repo_imp.dart';
import 'package:events/features/layout/favorites/presentation/widgets/favorites_view_body.dart';
import 'package:events/features/layout/home/data/cubits/add_event_to_favorites/add_event_to_favorites_cubit.dart';
import 'package:events/features/layout/home/data/cubits/remove_event_from_favourites/remove_event_from_favourites_cubit.dart';
import 'package:events/features/layout/home/data/repos/home_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<FetchFavouriteEventsCubit>(),
          
        ),
        BlocProvider(
          create: (context) =>
              AddEventToFavoritesCubit(homeRepo: getIt<HomeRepoImp>()),
        ),
        BlocProvider(
          create: (context) =>
              RemoveEventFromFavouritesCubit(homeRepo: getIt<HomeRepoImp>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Favorites",
            style: AppStyles.style20Bold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: FavoritesViewBody(),
      ),
    );
  }
}
