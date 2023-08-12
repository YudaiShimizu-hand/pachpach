import 'package:flutter/material.dart';

class PlaceNotifier extends ChangeNotifier {
  List<String> _places = [];

  List<String> get places => _places;

  void setPlaces(List<String> places) {
    _places = places;
    notifyListeners();
  }

  void addPlace(String place) {
    _places.add(place);
    notifyListeners();
  }
}