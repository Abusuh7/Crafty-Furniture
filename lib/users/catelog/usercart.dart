import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mobile_app/controller/cart_controller.dart';
import 'package:mobile_app/model/product.dart';

class UserCart extends StatelessWidget {
  final CartController controller = Get.find();

  UserCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait 
    
    //Portrait
    ? Obx(
      () {
        if (controller.products.isEmpty) {
          return 
          
          
           Center(
            child: Text(
              'Cart is empty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              height: 460,
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartProductsCard(
                    controller: controller,
                    product: controller.products.keys.toList()[index],
                    quantity: controller.products.values.toList()[index],
                    index: index,
                  );
                },
              ),
            ),
          );
        }
      },
    )

    //landscape
    : Obx(
      () {
        if (controller.products.isEmpty) {
          return  Center(
            child: Text(
              'Cart is empty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              height: 150,
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartProductsCard(
                    controller: controller,
                    product: controller.products.keys.toList()[index],
                    quantity: controller.products.values.toList()[index],
                    index: index,
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

class CartProductsCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductsCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //For image
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 20,
            ),

            //For name and price
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ ${product.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF2A666),
                  ),
                ),
              ],
            ),

            //For quantity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    controller.removeProduct(product);
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.addProduct(product);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
