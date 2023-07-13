import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductView2Page extends StatefulWidget {
  const ProductView2Page({
    Key? key,
    required this.productimage,
    required this.productname,
    required this.productprice
  }) : super(key: key);

  final String productimage;
  final String productname;
  final String productprice;

  @override
  State<ProductView2Page> createState() => _ProductView2PageState();
}

class _ProductView2PageState extends State<ProductView2Page> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF9F9F9),
          title: Center(
            child: Text(
              'View Product',
              style: TextStyle(
                color: Colors.black, // Set the color of the text in the app bar
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button pressed
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              ),
              color: isFavorite ? Colors.red : Colors.black,
              onPressed: toggleFavorite,
            ),
          ],
          iconTheme: IconThemeData(
            color: Colors
                .black, // Set the color of all icons in the app bar to black
          ),
        ),

        body: MediaQuery.of(context).orientation == Orientation.portrait
        
        //Portrait
        ? Container(
          color: Color(0xFFF9F9F9),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(widget.productimage),

                SizedBox(
                  height: 30,
                ),

                // Product Name and price in a row
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        widget.productname,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFF2A666),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.productprice,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFF2A666),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                // product view count and number of likes in a row with icon
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'View',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'View',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //Rating stars
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFF2A666),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFF2A666),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFF2A666),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFF2A666),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFF2A666),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                // Product description
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // Product description with overflowed text go to other line
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    'Sofas are comfortable seating furniture pieces designed for relaxation and socializing in living rooms, lounges, or other gathering spaces. They typically feature a long, padded seat with a backrest and armrests, providing a supportive and comfortable place to sit or recline. Sofas come in various sizes, styles, and materials, allowing for customization to fit different preferences and interior designs.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ], //main colomn
            ),
          ),
        )


        //Landscape
        : Container(
          color: Color(0xFFF9F9F9),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(widget.productimage),

                SizedBox(
                  height: 30,
                ),

                // Product Name and price in a row
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        widget.productname,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFF2A666),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.productprice,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFF2A666),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                // product view count and number of likes in a row with icon
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'View',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'View',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //Rating stars
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFF2A666),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFF2A666),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFF2A666),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFF2A666),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFF2A666),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                // Product description
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // Product description with overflowed text go to other line
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    'Sofas are comfortable seating furniture pieces designed for relaxation and socializing in living rooms, lounges, or other gathering spaces. They typically feature a long, padded seat with a backrest and armrests, providing a supportive and comfortable place to sit or recline. Sofas come in various sizes, styles, and materials, allowing for customization to fit different preferences and interior designs.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ], //main colomn
            ),
          ),
        ),

        // Add to cart button and share button in a row using elevated button
        bottomNavigationBar: Container(
          height: 70,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
          child: Row(
            children: [
              Container(
                width: 260,
                height: 70,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle add to cart button pressed
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0C8A7B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        bottomLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40),
              Container(
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle share button pressed
                  },
                  child: Icon(
                    Icons.share, // Use the desired icon from the icon library
                    size: 30,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0C8A7B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}