import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants/constant.dart';
import 'package:shopping_app/controller/controller.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/pages/home.dart';

class ShoppingCart extends StatefulWidget {
  ProductsModel product;

  ShoppingCart({Key? key, required this.product}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState(product);
}

class _ShoppingCartState extends State<ShoppingCart> {
  ProductsModel product;
  _ShoppingCartState(this.product);
  final MyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Card(
                  child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Your Shopping list',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                Strings().sizeHeight,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(child: Text(product.title.toString())),
                      Text('¥ ${product.price.toString()}')
                    ],
                  ),
                ),
                Divider(),
                IconButton(
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    icon: const Icon(Icons.home))
              ],
            ),
          ))
),
    );
  }
}
