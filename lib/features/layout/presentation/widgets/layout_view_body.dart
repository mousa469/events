import 'package:events/core/utilies/layout_index.dart';
import 'package:events/features/layout/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutViewBody extends StatelessWidget {
  const LayoutViewBody({super.key});

  final List<Widget> views = const [
    HomeView(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    var layoutIndex = Provider.of<LayoutIndex>(context);

    return views[layoutIndex.selectedIndex];
  }
}
