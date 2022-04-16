import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants/constant.dart';
import 'package:shopping_app/model/product.dart';

class ProductTile extends StatelessWidget {
  ProductsModel product;
  ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
         Hero(
            tag: 'tag',
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Flexible(child: Image.network(product.image.toString())),
                      Strings().sizeHeight,
                
                     Text(product.title.toString(),
                     maxLines: 1,
                      style: const TextStyle(
                        fontWeight:FontWeight.w600,
                        fontSize: 30,
                        color: Colors.purpleAccent
                      ),),
                    
                
                
                    Strings().sizeHeight,
                
                    Text('¥ ${product.price.toString()}',
                    style: const TextStyle(
                      fontWeight:FontWeight.w600,
                      fontSize: 30,
                      color: Colors.purpleAccent
                    ),)
                    ],
                  ),
                ),
              ),
            ),
        
          
        
      ],
    )));
  }
}
