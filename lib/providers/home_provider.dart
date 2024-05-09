import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String _selectedContinent = '';

  String get selectedContinent => _selectedContinent;

  void selectContinent(String continent) {
    _selectedContinent = continent;
    notifyListeners();
  }
}
