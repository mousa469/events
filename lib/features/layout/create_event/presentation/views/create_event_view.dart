import 'package:events/core/widgets/custom_app_bar.dart';
import 'package:events/features/layout/create_event/presentation/widgets/create_event_view_body.dart';
import 'package:flutter/material.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  static const String id = "CreateEventView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create Event"),
      body: CreateEventViewBody(),
    );
  }
}
