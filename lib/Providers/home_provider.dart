import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider.autoDispose((ref) {
  return HomeProvider();
});

class HomeProvider with ChangeNotifier {
  int _currentTabIndex = 0;
  bool _checked = false;

  int get currentTabIndex => _currentTabIndex;

  bool get checked => _checked;

  void onItemTapped(int index) {
    _currentTabIndex = index;
    log(_currentTabIndex.toString());
    notifyListeners();
  }

  void updateChecked(value) {
    _checked = value;
    notifyListeners();
  }
}
