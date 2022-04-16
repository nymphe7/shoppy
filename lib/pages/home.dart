import 'package:flutter/material.dart';
import 'package:shopping_app/controller/controller.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/pages/cart.dart';
import 'package:shopping_app/pages/productDetail.dart';
import 'package:shopping_app/pages/register.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myController = Get.put(MyController());

  String title = 'Shopping App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarOpacity: 1,
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.white],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const Register());
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          (() {
            if (myController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.0),
                  itemCount: myController.makeupList.length,
                  itemBuilder: (context, index) {
                    var makeupData = myController.makeupList[index];
                    return Container(
                      height: 200,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: ListTile(
                        title: Hero(
                          tag: 'tag$index',
                          child: Image.network(
                            makeupData.image.toString(),
                            height: 100.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              makeupData.title.toString(),
                              maxLines: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('¥ ${makeupData.price.toString()}'),
                                IconButton(
                                    onPressed: () {
                                      Get.to(ShoppingCart(product: makeupData));
                                    },
                                    icon: const Icon(Icons.add_shopping_cart))
                              ],
                            ),
                          ],
                        ),
                        onTap: () async {
                          Get.to(ProductTile(product: makeupData));
                        },
                      ),
                    );
                  });
            }
          }),
        ),
      ),
    );
  }
}
