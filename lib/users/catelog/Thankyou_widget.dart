import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mobile_app/homepage.dart';

class Thankyou extends StatelessWidget {
  const Thankyou({super.key});

  @override
  Widget build(BuildContext context) {
    return   MediaQuery.of(context).orientation == Orientation.portrait
    
    //Portrait
    ?Container(
      width: double.infinity, // Full width
      height: 470,
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
          //a large tick icon with the circular green background

          SizedBox(
            height: 20,
          ),

          //Tick Sign
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFF0C8A7B),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 60,
            ),
          ),

          SizedBox(
            height: 30,
          ),

          //Thank you message
          Text(
            'Thank you for your order!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //Descripton
          Container(
            width: 300,
            child: Text(
              'Your order been place successfully! you can track the dwlivery in the order section',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(156, 0, 0, 0),
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(
            height: 30,
          ),

          //Home Button
          Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 248, 247, 247),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Get.to(Homepage());
              },
              child: Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          //Track Button
          Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF0C8A7B),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Track Your Order',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //Order more text
          Text(
            'Order More',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(156, 0, 0, 0),
            ),
          ),
        ],
      ),
    )


    //Landscape
    : Container(
      width: double.infinity, // Full width
      height: double.maxFinite,
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
            //a large tick icon with the circular green background
      
            SizedBox(
              height: 20,
            ),
      
            //Tick Sign
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFF0C8A7B),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 60,
              ),
            ),
      
            SizedBox(
              height: 30,
            ),
      
            //Thank you message
            Text(
              'Thank you for your order!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
      
            SizedBox(
              height: 20,
            ),
      
            //Descripton
            Container(
              width: 300,
              child: Text(
                'Your order been place successfully! you can track the dwlivery in the order section',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(156, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
      
            SizedBox(
              height: 30,
            ),
      
            //Home Button
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 247, 247),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  Get.to(Homepage());
                },
                child: Text(
                  'Back to Home',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
      
            SizedBox(
              height: 10,
            ),
      
            //Track Button
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF0C8A7B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Track Your Order',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
      
            SizedBox(
              height: 20,
            ),
      
            //Order more text
            Text(
              'Order More',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(156, 0, 0, 0),
              ),
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
