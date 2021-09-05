import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> items = [
    Product(
      id: '1',
      image: 'images/pic1.jpg',
      title: " Large Herfy",
      price: 1300,
      isFavorite: false, quantity: 1,
    ),
    Product(
        id: '2',
        image: 'images/pic2.jpg',
        title: "Medium Herfy",
        price: 1200,
        isFavorite: false, quantity: 1),
    Product(
        id: '3',
        image: 'images/pic3.jpg',
        title: "Bkhet sheep",
        price: 1550,
        isFavorite: false, quantity: 1),
    Product(
        id: '4',
        image: 'images/pic4.jpg',
        title: "Gabr harry",
        price: 1100,
        isFavorite: false, quantity: 1),
    Product(
        id: '5',
        image: 'images/pic5.jpg',
        title: "Small Herfy",
        price: 1200,
        isFavorite: false, quantity: 1),
    Product(
        id: '6',
        image: 'images/pic6.jpg',
        title: "سواكني مرابي",
        price: 1300,
        isFavorite: false, quantity: 1),
    Product(
        id: '7',
        image: 'images/pic7.jpg',
        title: " رفيدي جنوبي",
        price: 1100,
        isFavorite: false, quantity: 1)
  ];

  double _totalPrice = 0.0;



  static List<String> drop1 = [
    'حجم صغير',
    'حجم كبير',
  ];

  static List<String> drop2 = [
    'ثلاجه',
    'انصاف',
    '(4 قطع)',
    '8 قطع',
    '12 قطعه',
    'مفطح',
    'غوزي كامل'
  ];

  static List<String> drop3 = ['مغلف', 'بدون تغليف'];

  static List<String> drop4 = ['مسلوخ', 'مشلوط'];

  String newVal1 = 'حجم صغير';
  String newVal2 = 'ثلاجه';
  String newVal3 = 'مغلف';
  String newVal4 = 'مسلوخ';

  List<DropdownMenuItem<String>> dropDwonMenuItem1 = drop1
      .map((String value) =>
          DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();
  List<DropdownMenuItem<String>> dropDwonMenuItem2 = drop2
      .map((String value) =>
          DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();
  List<DropdownMenuItem<String>> dropDwonMenuItem3 = drop3
      .map((String value) =>
          DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();
  List<DropdownMenuItem<String>> dropDwonMenuItem4 = drop4
      .map((String value) =>
          DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();

  void changeDropdown1(String value) {
    newVal1 = value;
    notifyListeners();
  }

  void changeDropdown2(String value) {
    newVal2 = value;
    notifyListeners();
  }

  void changeDropdown3(String value) {
    newVal3 = value;
    notifyListeners();
  }

  void changeDropdown4(String value) {
    newVal4 = value;
    notifyListeners();
  }
}
