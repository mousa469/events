import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/services/service_locator.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/edit_event/data/managers/update_event_details/update_event_details_cubit.dart';
import 'package:events/features/layout/edit_event/presentation/widgets/edit_event_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditEventView extends StatelessWidget {
  const EditEventView({super.key});

  static const String id = "EditEventView";

  @override
  Widget build(BuildContext context) {
    var event = ModalRoute.of(context)!.settings.arguments as Event;

    return BlocProvider.value(
      value: getIt<UpdateEventDetailsCubit>() ,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).edit_event,
            style: AppStyles.style20Bold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back, color: AppColors.primaryColor),
          ),
        ),
        body: EditEventViewBody(event: event),
      ),
    );
  }
}
