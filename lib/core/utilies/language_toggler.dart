import 'package:events/core/services/local_storage.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:flutter/material.dart';

class LanguageToggler extends ChangeNotifier {
  bool isEnglish = true;
  Locale locale = Locale('en');
  LocalStorage localStorage;
  LanguageToggler({required this.localStorage});

  void convertLanguageToArabic() async {
    if (isEnglish == false || locale == Locale(Keys.ar)) return;
    isEnglish = false;
    await localStorage.setString(key: Keys.language, value: Keys.ar);

    locale = Locale(await localStorage.getString(key: Keys.language));

    notifyListeners();
  }

  void convertLanguageToEnglish()  async{
    if (isEnglish == true || locale == Locale(Keys.en)) return;

    isEnglish = true;

    await localStorage.setString(key: Keys.language, value: Keys.en);

    locale = Locale(await localStorage.getString(key: Keys.language));

    notifyListeners();
  }
}
