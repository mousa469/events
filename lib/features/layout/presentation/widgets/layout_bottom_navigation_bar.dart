import 'dart:developer';
import 'package:events/core/localization/generated/l10n.dart';
import 'package:events/core/utilies/layout_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutBottomNavigationBar extends StatefulWidget {
  const LayoutBottomNavigationBar({super.key});

  @override
  State<LayoutBottomNavigationBar> createState() =>
      _LayoutBottomNavigationBarState();
}

class _LayoutBottomNavigationBarState extends State<LayoutBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    var layoutIndex = Provider.of<LayoutIndex>(context);
    log("current index is = ${layoutIndex.selectedIndex} ");
    return Container(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),

        child: BottomNavigationBar(
          currentIndex: layoutIndex.selectedIndex,
          onTap: (value) {
            layoutIndex.changeIndex(index: value);
          },
          items: [
            BottomNavigationBarItem(
              icon: layoutIndex.selectedIndex == 0
                  ? Icon(Icons.home_outlined)
                  : Icon(Icons.home_filled),
              label: S.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: layoutIndex.selectedIndex == 1
                  ? Icon(Icons.location_on_outlined)
                  : Icon(Icons.location_on),
              label: S.of(context).map,
            ),
            BottomNavigationBarItem(
              icon: layoutIndex.selectedIndex == 2
                  ? Icon(Icons.favorite_outline)
                  : Icon(Icons.favorite),
              label: S.of(context).love,
            ),
            BottomNavigationBarItem(
              icon: layoutIndex.selectedIndex == 3
                  ? Icon(Icons.person_outlined)
                  : Icon(Icons.person),
              label: S.of(context).profile,
            ),
          ],
        ),
      ),
    );
  }
}
