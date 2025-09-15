import 'package:flutter/material.dart';

enum NavigationSection {
  inicio,
  reportes,
  configuracion,
}

class NavigationProvider extends ChangeNotifier {
  NavigationSection _currentSection = NavigationSection.inicio;

  NavigationSection get currentSection => _currentSection;

  void changeSection(NavigationSection section) {
    if (_currentSection != section) {
      _currentSection = section;
      notifyListeners();
    }
  }
}