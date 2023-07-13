import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mobile_app/users/catelog/catalogproducts.dart';
import 'package:mobile_app/users/catelog/usercart.dart';

import '../catelog/cartscreen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black87,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'More Products',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.edit,
          //     color: Colors.black87,
          //   ),
          //   onPressed: () {
          //     Get.back();
          //   },
          // ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black87,
            ),
            onPressed: () => Get.to(() => CartScreen()),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            CatalogProduct(),
            // ElevatedButton(
            //   onPressed: () => Get.to(() => UserCart()),
            //   child: const Text('Add to Cart'),
            // ),
          ],
        ),
      ),
    );
  }
}
