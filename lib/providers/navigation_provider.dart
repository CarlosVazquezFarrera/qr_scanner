import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndexPage = 0;

  int get selectedIndexPage => _currentIndexPage;

  setIndexPage(int index) {
    _currentIndexPage = index;
    notifyListeners();
  }
}
