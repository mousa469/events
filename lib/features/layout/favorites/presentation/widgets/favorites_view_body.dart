
import 'package:events/features/layout/favorites/data/cubits/fetch_favourite_events/fetch_favourite_events_cubit.dart';
import 'package:events/features/layout/favorites/presentation/widgets/favourites_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesViewBody extends StatefulWidget {
  const FavoritesViewBody({super.key});

  @override
  State<FavoritesViewBody> createState() => _FavoritesViewBodyState();
}

class _FavoritesViewBodyState extends State<FavoritesViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchFavouriteEventsCubit>(
      context,
    ).fetchFavouriteEvents(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [Expanded(child: FavouritesBlocBuilder())]);
  }
}
