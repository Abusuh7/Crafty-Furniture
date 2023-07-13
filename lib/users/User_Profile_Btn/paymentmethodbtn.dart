import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mobile_app/users/productclick/checkout.dart';

class PaymentMethodBtn extends StatefulWidget {
  const PaymentMethodBtn({super.key}); 


  @override
  State<PaymentMethodBtn> createState() => _PaymentMethodBtnState();
}

class _PaymentMethodBtnState extends State<PaymentMethodBtn> {

//Make sure to media query for responsiveness
  
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Image.asset(''), //Add image
      appBar: AppBar(
        //build a app bar with button
        title: Text('Payment Method'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              
            },
          )
        ],
        
      )
      );
      
  }
}