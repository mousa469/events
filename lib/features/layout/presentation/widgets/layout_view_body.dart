import 'package:events/core/utilies/layout_index.dart';
import 'package:events/features/layout/favorites/presentation/views/favorites_view.dart';
import 'package:events/features/layout/home/presentation/views/home_view.dart';
import 'package:events/features/layout/map_view/presentation/views/map_view.dart';
import 'package:events/features/layout/more/presentation/views/more_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutViewBody extends StatelessWidget {
  const LayoutViewBody({super.key});

  final List<Widget> views = const [
    HomeView(),
    MapView(),
    FavoritesView(),
    MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    var layoutIndex = Provider.of<LayoutIndex>(context);

    return IndexedStack(index: layoutIndex.selectedIndex, children: views);
  }
}
