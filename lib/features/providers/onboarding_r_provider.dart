import 'package:flutter/material.dart';

class OnboardingRProvider extends ChangeNotifier {
  final PageController controllerPage = PageController();
  int pageIndex = 0;
  void onPageChanged(value) {
    pageIndex = value;
    notifyListeners();
  }

  void animateToPage() {
    controllerPage.animateToPage(1,
        duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
    notifyListeners();
  }

  bool isPage(int i) => i == pageIndex;
}
