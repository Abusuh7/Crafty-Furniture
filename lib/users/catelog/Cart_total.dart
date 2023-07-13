import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mobile_app/controller/cart_controller.dart';
import 'package:mobile_app/users/catelog/checkoutscreen.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
    
    //portrait
    ? Obx(
      () => Container(
        width: double.infinity, // Full width
        height: 270,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF828A89),
                    ),
                  ),
                  Text(
                    '\$ ${controller.products.isNotEmpty ? controller.totalPrice : 0}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF2A666),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF828A89),
                    ),
                  ),
                  Text(
                    '\$ ${controller.products.isNotEmpty ? 100 : 0}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF2A666),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Make a horizontal line
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$ ${controller.products.isNotEmpty ? controller.finalPrice : 0}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF2A666),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              width: 300, // Set the desired width
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Handle add to cart button pressed
                  Get.to(CheckOutScreen());
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0C8A7B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    )

    //landscape
    : Obx(
      () => Container(
        width: double.infinity, // Full width
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
        
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(
                height: 20,
              ),
        
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF828A89),
                      ),
                    ),
                    Text(
                      '\$ ${controller.products.isNotEmpty ? controller.totalPrice : 0}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF2A666),
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(
                height: 10,
              ),
        
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF828A89),
                      ),
                    ),
                    Text(
                      '\$ ${controller.products.isNotEmpty ? 100 : 0}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF2A666),
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(
                height: 20,
              ),
        
              // Make a horizontal line
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
        
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Payment',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$ ${controller.products.isNotEmpty ? controller.finalPrice : 0}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF2A666),
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(
                height: 20,
              ),
        
              Container(
                width: 300, // Set the desired width
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle add to cart button pressed
                    Get.to(CheckOutScreen());
                  },
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0C8A7B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
        
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
