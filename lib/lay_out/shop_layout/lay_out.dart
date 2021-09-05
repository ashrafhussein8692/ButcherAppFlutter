import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'layout_provider.dart';

class HomeLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LayOut>(context);
    return Scaffold(
      body: provider.screens[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.changeBottomScreens(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),

        ],
      ),
    );
  }
}
