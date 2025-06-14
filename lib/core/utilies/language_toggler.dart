import 'package:flutter/material.dart';

class LanguageToggler extends ChangeNotifier {
  bool isEnglish = true;
   Locale locale = Locale('en');

  void convertLanguageToArabic() {
    if (isEnglish == false || locale == Locale('ar')) return;
    isEnglish = false;
    locale = Locale('ar');
    notifyListeners();
  }

  void convertLanguageToEnglish() {
    if (isEnglish == true || locale == Locale('en')) return;

    isEnglish = true;
    locale = Locale('en');

    notifyListeners();
  }
}
