import 'package:flutter/material.dart';

class LayoutIndex extends ChangeNotifier {
  int selectedIndex = 0;

  void changeIndex({required index}) {
    selectedIndex = index;
    notifyListeners();
  }
}
