import 'package:events/core/extensions/routing_extension.dart';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/services/service_locator.dart';
import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:events/core/theme/app_styles/app_styles.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:events/features/layout/edit_event/presentation/views/edit_event_view.dart';
import 'package:events/features/layout/event_details/data/cubits/fetch_event_location/fetch_event_location_cubit.dart';
import 'package:events/features/layout/event_details/data/repos/event_details_repo_impl.dart';
import 'package:events/features/layout/event_details/presentation/widgets/event_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key});

  static const String id = "EventDetailsView";
  @override
  Widget build(BuildContext context) {
    var event = ModalRoute.of(context)!.settings.arguments as Event;
    return BlocProvider(
      create: (context) => FetchEventLocationCubit(
        eventDetailsRepo: getIt<EventDetailsRepoImpl>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back, color: AppColors.primaryColor),
          ),
          centerTitle: true,
          title: Text(
            S.of(context).event_details,
            style: AppStyles.style20Bold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(routeName: EditEventView.id ,  arguments: event  );
              },
              icon: Icon(Icons.edit, color: AppColors.primaryColor),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete_forever, color: Colors.red),
            ),
          ],
        ),
        body: EventDetailsViewBody(event: event),
      ),
    );
  }
}
