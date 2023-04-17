import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  List<int> list = [1, 2, 3, 4];

  void add() {
    list.add(list.last + 1);
    notifyListeners();
  }
}
