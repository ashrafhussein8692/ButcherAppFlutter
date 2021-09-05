import 'package:flutter/cupertino.dart';

import 'package:untitled2/lay_out/cart/cart_screen.dart';
import 'package:untitled2/lay_out/home/home_screen.dart';

class LayOut extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
  ];

  void changeBottomScreens(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
