import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/widgets/custom_snack_bar.dart';
import 'package:events/features/layout/home/data/cubits/add_event_to_favorites/add_event_to_favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.isFavorite});

  final bool isFavorite;

  @override


  @override
  Widget build(BuildContext context) {
    return BlocListener<AddEventToFavoritesCubit, AddEventToFavoritesState>(
      listener: (context, state) {
        if (state is AddEventToFavoritesFailure) {
          CustomSnackBar(
            type: SnackBarType.failure,
            title: S.of(context).oops,
            subTitle: state.errMessage,
            context: context,
          );
        } else if (state is AddEventToFavoritesSuccess) {
CustomSnackBar(
            type: SnackBarType.success,
            title: S.of(context).success,
            subTitle: S.of(context).Event_added_to_favorites_successfully,
            context: context,
          );
        }
      },
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: AppColors.primaryColor,
      ),
    );
  }
}
