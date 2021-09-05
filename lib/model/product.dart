class Product {
  String id;

  String image;

  String title;

  int price;

  int quantity;

  bool isFavorite;

  Product(
      {required this.id,
      required this.image,
      required this.title,
      required this.price,
      this.isFavorite = false,
      this.quantity = 1});
}
