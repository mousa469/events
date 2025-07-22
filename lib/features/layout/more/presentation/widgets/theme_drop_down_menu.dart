import 'package:events/constants.dart';
import 'package:events/core/utilies/theme_toggler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeDropDownMenu extends StatelessWidget {
  const ThemeDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeToggler>(context);
    return DropdownMenu(
      onSelected: (value) {
        if (value == dark) {
          theme.convertToDarkMode();
        } else {
          theme.convertToLightMode();
        }
      },
      hintText: light,
      width: double.infinity,
      dropdownMenuEntries: [
        DropdownMenuEntry(label: dark, value: dark),
        DropdownMenuEntry(label: light, value: light),
      ],
    );
  }
}
