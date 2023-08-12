import 'package:flutter/material.dart';

class ShopNotifier extends ChangeNotifier {
  List<String> _shops = [];

  List<String> get shops => _shops;

  void setShops(List<String> shops) {
    _shops = shops;
    notifyListeners();
  }

  void addShop(String shop) {
    _shops.add(shop);
    notifyListeners();
  }
}