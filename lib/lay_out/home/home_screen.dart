import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/model/prduct_provider.dart';
import 'package:untitled2/lay_out/products_details/product_details.dart';
import 'package:untitled2/model/product.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Products>(context);
    return Scaffold(
        appBar: AppBar(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Main',
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
        backgroundColor: Colors.brown[100],
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildHomeItem(provider.items[index], context),
          itemCount: provider.items.length,
        ));
  }

  buildHomeItem(Product item, context) => InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetails.routeName, arguments: {
            'id': item.id,
            'image': item.image,
            'title': item.title,
            'price': item.price,
          });
        },
        child: Card(
          elevation: 5,
          clipBehavior: Clip.hardEdge,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  clipBehavior: Clip.hardEdge,
                  child: Image(
                    image: AssetImage('${item.image}'),
                    width: 175,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${item.title}',
                      style:
                          TextStyle(fontSize: 22, color: Colors.redAccent[700]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${item.price}  SAR',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
