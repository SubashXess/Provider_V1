import 'package:flutter/foundation.dart';

class FavoriteItemProvider with ChangeNotifier {
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;

// add items
  void addItems(int value) {
    _selectedItem.add(value);
    notifyListeners();
  }

// remove Items
  void removeItems(int value) {
    _selectedItem.remove(value);
    notifyListeners();
  }
}
