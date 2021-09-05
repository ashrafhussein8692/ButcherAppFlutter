import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/model/cart.dart';
import 'package:untitled2/model/product.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    return Scaffold(
        appBar: AppBar(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cart',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                ))
          ],
        ),
        body: cart.items.length > 0
            ? ListView.builder(
                itemBuilder: (context, index) => buildItemCart(
                      cart.items.values.toList()[index],
                    ),
                itemCount: cart.items.length)
            : Center(
                child: Text(
                  'Your Cart is empty',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ));
  }
}

class buildItemCart extends StatelessWidget {
  Product cartModel;

  buildItemCart(this.cartModel);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Column(
      children: [
        Card(
          elevation: 10,
          clipBehavior: Clip.hardEdge,
          child: Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${cartModel.title}',
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("${cartModel.price * cart.count}",
                              style: TextStyle(fontSize: 17)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text('Quantity', style: TextStyle(fontSize: 17)),
                              SizedBox(
                                width: 70,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.red[900],
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.red.shade900,
                                          spreadRadius: 2)
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                            cart.add();
                                          },
                                          child: Icon(
                                            Icons.add,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 30,
                                      child: Center(
                                        child: Text(
                                          '${cart.count}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                            if (cart.count > 1) cart.remove();
                                          },
                                          child: Icon(
                                            Icons.remove,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Image(
                        image: AssetImage('${cartModel.image}'),
                        height: 90,
                        width: 120,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.grey[700],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Add To Favorites',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[700]),
                              ),
                            ],
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            cart.removeFromCart(cartModel.id.toString());
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_rounded,
                                color: Colors.grey[700],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Delete',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[700]),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
