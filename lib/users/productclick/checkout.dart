import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key?key , 
  required this.productimagecheckout,

  }): super(key:key);

  final String productimagecheckout;

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait
      
      //Portrait
      ? SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.productimagecheckout),
            Text('Product Name'),
            Text('Product Price'),
            Text('Product Quantity'),
          ]
    ),
      )

      //Landscape
      : SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.productimagecheckout),
            Text('Product Name'),
            Text('Product Price'),
            Text('Product Quantity'),
          ]
    ),
      ),
    );
  }
}