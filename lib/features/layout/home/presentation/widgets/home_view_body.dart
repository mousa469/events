import 'package:events/features/layout/home/presentation/widgets/events_bloc_builder_view.dart';
import 'package:events/features/layout/home/presentation/widgets/home_view_body_header.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [HomeViewBodyHeader(), EventsBLocBuilder()]);
  }
}
