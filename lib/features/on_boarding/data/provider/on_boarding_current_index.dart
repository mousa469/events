import 'package:flutter/material.dart';

class OnBoardingCurrentIndex extends ChangeNotifier {
  double currentIndex = 0;
  PageController pageController = PageController();

  void incrementCurrentIndex() {
    currentIndex++;
    pageController.jumpToPage(currentIndex.toInt());
    notifyListeners();
  }

  void decrementCurrentIndex() {
    currentIndex--;
    pageController.jumpToPage(currentIndex.toInt());

    notifyListeners();
  }
}
