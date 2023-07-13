

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/model/product.dart';

class CartController extends GetxController {
  var _products = {}.obs;
  // int get count => _products.length;
  // double get totalPrice => _products.fold(0, (sum, item) => sum + item['price']);

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      'Product Added', 'You have added ${product.name}',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
      );
  }

  

  get products => _products;


  //remove product
  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }

    Get.snackbar(
      'Product Removed', 'You have removed ${product.name}',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
      );
  }


  //sub total
  get productSubTotal => _products.entries
  .map((product) => product.key.price * product.value)
  .toList();

  //total price
  get totalPrice => _products.entries
  .map((product) => product.key.price * product.value)
  .toList().reduce((value, element) => value + element).toStringAsFixed(2);

  //final price
  get finalPrice => _products.entries
  .map((product) => product.key.price * product.value + 100)
  .toList().reduce((value, element) => value + element).toStringAsFixed(2);
}