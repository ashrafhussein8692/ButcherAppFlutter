import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/lay_out/cart/cart_screen.dart';
import 'package:untitled2/model/cart.dart';
import 'package:untitled2/model/prduct_provider.dart';
import 'lay_out/products_details/product_details.dart';
import 'lay_out/shop_layout/lay_out.dart';
import 'lay_out/shop_layout/layout_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: LayOut()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'ZillaSlab3',
          appBarTheme: AppBarTheme(backgroundColor: Colors.red[900]),
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.red[900]),
        ),
        home: HomeLayOut(),
        routes: {
          ProductDetails.routeName: (context) => ProductDetails(),
          CartScreen.routeName: (context) => CartScreen(),

        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
