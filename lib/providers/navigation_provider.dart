import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndexPage = 0;

  int get selectedIndexPage => _currentIndexPage;

  set setIndexPage(int index) {
    if (_currentIndexPage == index) return;
    _currentIndexPage = index;
    notifyListeners();
  }
}
