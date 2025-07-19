import 'package:events/core/services/service_locator.dart';
import 'package:events/features/layout/edit_event/data/managers/update_event_details/update_event_details_cubit.dart';
import 'package:events/features/layout/edit_event/presentation/widgets/update_event_location_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateEventLocationView extends StatelessWidget {
  const UpdateEventLocationView({super.key});
  static const String id = "UpdateEventLocationView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
value: getIt<UpdateEventDetailsCubit>() ,  
    child: Scaffold(body: UpdateEventLocationViewBody()),
    );
  }
}
