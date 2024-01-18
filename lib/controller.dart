import 'package:flutter/material.dart';

class SettingsController with ChangeNotifier {
  SettingsController();

  int currentIndex = 0;

  double lastOffset = 0.0;

  void updateIndex(double offset) {
    if (lastOffset < offset) {
      currentIndex = (offset / 150).ceil();
    } else {
      currentIndex = (offset / 150).floor();
    }

    notifyListeners();

    lastOffset = offset;
  }
}
