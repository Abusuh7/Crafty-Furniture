import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mobile_app/users/catelog/Cart_total.dart';
import 'package:mobile_app/users/catelog/Thankyou_widget.dart';
import 'package:mobile_app/users/catelog/usercart.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({Key? key}) : super(key: key);

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
          'Purchase Successful',
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
          // IconButton(
          //   icon: Icon(
          //     Icons.shopping_cart,
          //     color: Colors.black87,
          //   ),
          //   onPressed: () => Get.to(() => UserCart()),
          // ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            // UserCart(),
            // ElevatedButton(
            //   onPressed: () => Get.to(() => UserCart()),
            //   child: const Text('Add to Cart'),
            // ), 
            
          ],
        ),
      ),
      bottomNavigationBar: Thankyou(),
    );
    
    
  }
}