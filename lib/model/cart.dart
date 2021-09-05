import 'package:flutter/cupertino.dart';
import 'package:untitled2/model/product.dart';

class Cart extends ChangeNotifier {
  Map<String, Product> _items = {};

  Map<String, Product> get items {
    return {..._items};
  }

  var count = 1;

  void add() {
    count++;

    notifyListeners();
  }

  void remove() {
    count--;

    notifyListeners();
  }

  int get totalPrice {
    int total = 0;

    _items.forEach((key, product) {
      total += product.price;
    });
    return total;
  }

  void addToCart(String productId, String title, String image, int price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (product) => Product(
                id: product.id,
                title: product.title,
                image: product.image,
                price: product.price,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => Product(
                id: productId,
                title: title,
                image: image,
                price: price,
              ));
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
