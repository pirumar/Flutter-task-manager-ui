import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier {
  int selectedIndex = -1;
  setSelected(index) {
    selectedIndex = index;
    notifyListeners();
  }

  isSelected(index) {
    return selectedIndex == index;
  }
}
