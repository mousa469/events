import 'package:events/constants.dart';
import 'package:events/core/utilies/language_toggler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LangaugeDropDownMenu extends StatelessWidget {
  const LangaugeDropDownMenu({super.key,});


  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LanguageToggler>(context);
    return DropdownMenu(
      onSelected: (value) {
        if (value == english) {
          language.convertLanguageToEnglish();
        } else {
          language.convertLanguageToArabic();
        }
      },
      hintText: english,
      width: double.infinity,
      dropdownMenuEntries: [
        DropdownMenuEntry(label: english, value: english),
        DropdownMenuEntry(label: arabic, value: arabic),
      ],
    );
  }
}
