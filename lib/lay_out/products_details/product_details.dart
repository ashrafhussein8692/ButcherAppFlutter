import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/components.dart';
import 'package:untitled2/lay_out/shop_layout/lay_out.dart';
import 'package:untitled2/model/prduct_provider.dart';
import 'package:untitled2/model/cart.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = 'product_details';

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map;
    final itemId = routeArg['id'];
    final itemImage = routeArg['image'];
    final itemTitle = routeArg['title'];
    final itemPrice = routeArg['price'];

    var provider = Provider.of<Products>(context);

    var cart = Provider.of<Cart>(context);

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage(itemImage),
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black26,
                          child: IconButton(
                            onPressed: () {
                              navigateAndFinish(context, HomeLayOut());
                            },
                            icon: Icon(Icons.arrow_back_sharp),
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.black26,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_sharp),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      itemTitle!,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Text(
                      'Price : ',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      '$itemPrice',
                      style: TextStyle(fontSize: 20, color: Colors.red[900]),
                    ),
                    Text(
                      ' SAR ',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Receive Way ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.album_outlined,
                      color: Colors.red[900],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'slaughtered ',
                      style: TextStyle(fontSize: 20, color: Colors.red[900]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200]),
                      child: ListTile(
                        leading: Text(
                          'Size',
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: Container(
                          width: 180,
                          alignment: Alignment.topCenter,
                          transformAlignment: Alignment.topCenter,
                          child: DropdownButtonFormField<String>(
                            isDense: false,
                            decoration: InputDecoration(
                                isCollapsed: true,
                                enabledBorder: InputBorder.none),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            value: provider.newVal1,
                            onChanged: (value) {
                              provider.changeDropdown1(value.toString());
                            },
                            items: provider.dropDwonMenuItem1,
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200]),
                      child: ListTile(
                        leading: Text(
                          'Cutting Methods',
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: Container(
                          width: 180,
                          alignment: Alignment.topCenter,
                          transformAlignment: Alignment.topCenter,
                          child: DropdownButtonFormField(
                            isDense: false,
                            decoration: InputDecoration(
                                isCollapsed: true,
                                isDense: true,
                                enabledBorder: InputBorder.none),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            value: provider.newVal2,
                            onChanged: (value) {
                              provider.changeDropdown2(value.toString());
                            },
                            items: provider.dropDwonMenuItem2,
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200]),
                      child: ListTile(
                        leading: Text(
                          'Preparation Way',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        trailing: Container(
                          width: 180,
                          alignment: Alignment.topCenter,
                          transformAlignment: Alignment.topCenter,
                          child: DropdownButtonFormField(
                            isDense: false,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              isCollapsed: true,
                            ),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            value: provider.newVal3,
                            onSaved: (value) {
                              provider.changeDropdown3(value.toString());
                            },
                            onChanged: (value) {
                              provider.changeDropdown3(value.toString());
                            },
                            items: provider.dropDwonMenuItem3,
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200]),
                      child: ListTile(
                        leading: Text(
                          'Head Type',
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: Container(
                          width: 180,
                          alignment: Alignment.topCenter,
                          transformAlignment: Alignment.topCenter,
                          child: DropdownButtonFormField(
                            isDense: false,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                isCollapsed: true,
                                isDense: true),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            value: provider.newVal4,
                            onChanged: (value) {
                              provider.changeDropdown4(value.toString());
                            },
                            items: provider.dropDwonMenuItem4,
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Notes',
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Write you notes',
                    labelStyle: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
        bottomNavigationBar: MaterialButton(
          child: Text(
            'Add To Cart',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            cart.addToCart(itemId, itemTitle, itemImage, itemPrice);
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (context) {
                  return Container(
                      height: 150,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.green[800],
                                      child: Icon(
                                        Icons.check_rounded,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          itemTitle,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'In Cart',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[800]),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text(
                                          'Total Cart',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[800]),
                                        ),
                                        Text(
                                          '${cart.totalPrice}',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 160,
                                        height: 45,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.red.shade900,
                                                  spreadRadius: 1)
                                            ]),
                                        child: Center(
                                          child: InkWell(
                                            child: Center(
                                              child: Text(
                                                'Continue Shopping',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.red[900]),
                                              ),
                                            ),
                                            onTap: () {
                                              navigateAndFinish(
                                                  context, HomeLayOut());
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 170,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.red[900]),
                                        child: Center(
                                          child: InkWell(
                                            child: Text(
                                              'Complete The Purchase',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.white),
                                            ),
                                            onTap: () {},
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ));
                });
          },
          clipBehavior: Clip.hardEdge,
          color: Colors.red[900],
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
        ));
  }
}
