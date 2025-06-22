import 'package:events/core/utilies/layout_index.dart';
import 'package:events/features/layout/presentation/widgets/layout_bottom_navigation_bar.dart';
import 'package:events/features/layout/presentation/widgets/layout_floating_action_button.dart';
import 'package:events/features/layout/presentation/widgets/layout_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const String id = "LayoutView";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LayoutIndex(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: LayoutFloatingActionButton(),
        bottomNavigationBar: LayoutBottomNavigationBar(),
        body: LayoutViewBody(),
      ),
    );
  }
}
