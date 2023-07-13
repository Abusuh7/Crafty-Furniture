import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_app/signin.dart';
import 'package:mobile_app/users/User_Profile_Btn/paymentmethodbtn.dart';
import 'package:mobile_app/users/navbar/catalogscreen.dart';
import 'package:mobile_app/users/catelog/usercart.dart';
import 'package:mobile_app/users/navbar/userprofile.dart';
import 'package:mobile_app/users/productclick/viewproduct.dart';
import 'package:mobile_app/users/productclick/viewproduct1.dart';
import 'package:mobile_app/users/userPreferences/current_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  @override
  State<Homepage> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  //This is for the catagories container to to change colour when selected
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;

  //This is for the nav bar container to to change colour when selected
  bool isActive5 = false;
  bool isActive6 = false;
  bool isActive7 = false;
  bool isActive8 = false;

  final String image1 = 'Asset/Images/product1.jpg';
  final String name1 = 'Ox Mathis Sofa';
  final String price1 = '200';

  final String image2 = 'Asset/Images/product2.jpg';
  final String name2 = 'Fuji Arm Chair';
  final String price2 = '400';

  final String image3 = 'Asset/Images/product3.jpg';
  final String name3 = 'Pool Chair';
  final String price3 = '80';

//If local storage is used
  final CurrentUser _currentUser = Get.put(CurrentUser());

//Getting the user details from the shared prefeerrence
  String? userName;
  String? userEmail;
  File? imagePath;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('userName');

    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    String? userEmail = prefs2.getString('userEmail');

    SharedPreferences image1 = await SharedPreferences.getInstance();
    String? imagePath = image1.getString('imagePath');

    setState(() {
      this.userName = userName;
      this.userEmail = userEmail;
      this.imagePath = File(imagePath!);
    });
  }
//Getting the user details from the shared prefeerrence

  @override
  Widget build(context) {
    Widget profilepic = CircleAvatar(
      radius: 25,
      child: Icon(Icons.person, size: 40,), // Adjust the size as needed
    );

    // if(_selectedImage != null)
    // {
    //   profilepic = CircleAvatar(
    //     radius: 60,
    //     backgroundImage: FileImage(_selectedImage!),
    //   );
    // }

    if (imagePath != null) {
      profilepic = CircleAvatar(
        radius: 25,
        backgroundImage: FileImage(imagePath!),
      );
    }

    return Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.portrait
      
      //Portrait
      ? Padding(
        padding: EdgeInsets.only(top: 70, left: 20),
        child: SingleChildScrollView(
          //This is Profile and notification button
          child: Container(
            child: Column(
              children: [
                //Profile logo and notification
                Row(children: [
                  Container(
                    //give a with of 143 and height of 40 with circular image button and text by the side align this on top left
                    height: 50,
                    decoration: const BoxDecoration(color: Color(0xF9F9F9)),
                    child: Row(
                      children: [
                        //Profile Image
                        profilepic,
                        const SizedBox(
                          width: 10,
                        ),
                        //Text for welcome and te user name
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: const Text(
                                'Welcome,',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Color.fromARGB(200, 57, 57, 57),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                userName ?? 'User',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 19,
                                  color: Color(0xFF2B423F),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          width: 180,
                        ),

                        //Notification button
                        GestureDetector(
                          onTap: () {
                            //What happens when notification button is tapped
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 233, 238, 237),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Icon(
                              Icons.notifications,
                              color: Color.fromARGB(255, 79, 79, 79),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),

                const SizedBox(
                  height: 35,
                ),

                //This is the search bar
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Center(
                    child: Container(
                      width: 360,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 233, 235, 235),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 79, 79, 79),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search Furniture',
                                hintStyle: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 79, 79, 79),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          // SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.filter_alt_outlined,
                              color: Color.fromARGB(255, 79, 79, 79),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //This is the speacial offer text
                Container(
                  width: 370,
                  height: 50,
                  child: Text(
                    'Special Offers',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w800,
                      fontSize: 21,
                      color: Color(0xFF2B423F),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),

                //This is the special offer image conatiners
                Container(
                  height: 160, // Adjust the height as needed
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      //image containers with the text and learn more button
                      Container(
                        width: 264,
                        margin: EdgeInsets.only(left: 3, right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'Asset/Images/discount1.png',
                              fit: BoxFit.fill,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '50% Discount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'For a cozy yellow set!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button onPressed logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF0C8A7B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: Text(
                                      'Learn More',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 264,
                        margin: EdgeInsets.only(left: 3, right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'Asset/Images/discount2.png',
                              fit: BoxFit.fill,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '25% Discount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'For a cozy yellow set!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button onPressed logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF0C8A7B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: Text(
                                      'Learn More',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 264,
                        margin: EdgeInsets.only(left: 3, right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'Asset/Images/discount1.png',
                              fit: BoxFit.fill,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '10% Discount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'For a cozy yellow set!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button onPressed logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF0C8A7B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: Text(
                                      'Learn More',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //This is catagories part small containers
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActive1 =
                                !isActive1; // Toggle the isActive flag when the button is pressed

                            isActive2 = false;
                            isActive3 = false;
                            isActive4 = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isActive1
                              ? Color(0xFF0C8A7B)
                              : Colors
                                  .grey, // Use different background colors based on the isActive flag
                          fixedSize: Size(120, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.chair),
                            SizedBox(width: 5),
                            Text(
                              'Armchair',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActive2 =
                                !isActive2; // Toggle the isActive flag when the button is pressed

                            isActive1 = false;
                            isActive3 = false;
                            isActive4 = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isActive2
                              ? Color(0xFF0C8A7B)
                              : Colors
                                  .grey, // Use different background colors based on the isActive flag
                          fixedSize: Size(120, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.weekend),
                            SizedBox(width: 5),
                            Text(
                              'Sofa',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActive3 =
                                !isActive3; // Toggle the isActive flag when the button is pressed

                            isActive1 = false;
                            isActive2 = false;
                            isActive4 = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isActive3
                              ? Color(0xFF0C8A7B)
                              : Colors
                                  .grey, // Use different background colors based on the isActive flag
                          fixedSize: Size(120, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bed),
                            SizedBox(width: 5),
                            Text(
                              'Bed',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActive4 =
                                !isActive4; // Toggle the isActive flag when the button is pressed

                            isActive1 = false;
                            isActive2 = false;
                            isActive3 = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isActive4
                              ? Color(0xFF0C8A7B)
                              : Colors
                                  .grey, // Use different background colors based on the isActive flag
                          fixedSize: Size(120, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lightbulb_outline),
                            SizedBox(width: 5),
                            Text(
                              'Light',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 5,
                      )
                      // Repeat the same code for the other buttons...
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //More interested text and view all button
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'More Interested',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w800,
                          fontSize: 21,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 130), // Add spacing between the text and button

                    //View All button
                    ElevatedButton(
                      onPressed: () {
                        // Add your button onPressed logic here
                        Get.to(CatalogScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(
                            255, 240, 240, 240), // Customize button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 103, 65),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                //The more interested product list
                Container(
                  height: 240,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        
                        Container(
                          width: 200, // Adjust the width as needed
                          child: Column(
                            children: [
                              //The image
                              Container(
                                width: 200,
                                height: 150,
                                child: Image.asset(
                                  image1, // Replace with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              //The text and the cart button
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //the text product name,price
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name1, // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Text(
                                        'Hans j. wegner', // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color.fromARGB(131, 0, 0, 0),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      //text showing the price
                                      Row(
                                        children: [
                                          Text(
                                            '\$', // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                          Text(
                                            price1, // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Add to cart button onPressed logic here
                                      Get.to(ProductViewPage(
                                        productimage: image1,
                                        productname: name1,
                                        productprice: price1,
                                      ));
                                    },
                                    icon: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF0C8A7B),
                                      ),
                                      padding: EdgeInsets.all(4),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.shopping_bag_outlined,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 16), // Add spacing between containers

                        Container(
                          width: 200, // Adjust the width as needed
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 150,
                                child: Image.asset(
                                  image2, // Replace with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //the text product name,price
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name2, // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Text(
                                        'Hans j. wegner', // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color.fromARGB(131, 0, 0, 0),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      //text showing the price
                                      Row(
                                        children: [
                                          Text(
                                            '\$', // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                          Text(
                                            price2, // Replace with your product name
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
                                                color: Color(0xFFF2A666)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Add to cart button onPressed logic here
                                      Get.to(ProductViewPage(
                                        productimage: image2,
                                        productname: name2,
                                        productprice: price2,
                                      ));
                                    },
                                    icon: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF0C8A7B),
                                      ),
                                      padding: EdgeInsets.all(4),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.shopping_bag_outlined,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 16), // Add spacing between containers

                        Container(
                          width: 200, // Adjust the width as needed
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 150,
                                child: Image.asset(
                                  image3, // Replace with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //the text product name,price
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name3, // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Text(
                                        'Hans j. wegner', // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color.fromARGB(131, 0, 0, 0),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      //text showing the price
                                      Row(
                                        children: [
                                          Text(
                                            '\$', // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                          Text(
                                            price3, // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      // Add to cart button onPressed logic here
                                      Get.to(ProductViewPage(
                                        productimage: image3,
                                        productname: name3,
                                        productprice: price3,
                                      ));
                                    },
                                    icon: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF0C8A7B),
                                      ),
                                      padding: EdgeInsets.all(4),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.shopping_bag_outlined,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              
              
              
              //Test Products

              
              ],
            ),
          ),
        ),
      )


      //Landscape
      : Padding(
        padding: EdgeInsets.only(top: 70, left: 20),
        child: SingleChildScrollView(
          //This is Profile and notification button
          child: Container(
            child: Column(
              children: [
                //Profile logo and notification
                Row(children: [
                  Container(
                    //give a with of 143 and height of 40 with circular image button and text by the side align this on top left
                    height: 50,
                    decoration: const BoxDecoration(color: Color(0xF9F9F9)),
                    child: Row(
                      children: [
                        //Profile Image
                        profilepic,
                        const SizedBox(
                          width: 10,
                        ),
                        //Text for welcome and te user name
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: const Text(
                                'Welcome,',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Color.fromARGB(200, 57, 57, 57),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                userName ?? 'User',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 19,
                                  color: Color(0xFF2B423F),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          width: 580,
                        ),

                        //Notification button
                        GestureDetector(
                          onTap: () {
                            //What happens when notification button is tapped
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 233, 238, 237),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Icon(
                              Icons.notifications,
                              color: Color.fromARGB(255, 79, 79, 79),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),

                const SizedBox(
                  height: 35,
                ),

                //This is the search bar
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Center(
                    child: Container(
                      width: 660,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 233, 235, 235),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 79, 79, 79),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search Furniture',
                                hintStyle: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 79, 79, 79),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          // SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.filter_alt_outlined,
                              color: Color.fromARGB(255, 79, 79, 79),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //This is the speacial offer text
                Container(
                  width: 800,
                  height: 50,
                  child: Text(
                    'Special Offers',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w800,
                      fontSize: 21,
                      color: Color(0xFF2B423F),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),

                //This is the special offer image conatiners
                Container(
                  height: 160, // Adjust the height as needed
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      //image containers with the text and learn more button
                      Container(
                        width: 264,
                        margin: EdgeInsets.only(left: 3, right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'Asset/Images/discount1.png',
                              fit: BoxFit.fill,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '50% Discount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'For a cozy yellow set!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button onPressed logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF0C8A7B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: Text(
                                      'Learn More',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 264,
                        margin: EdgeInsets.only(left: 3, right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'Asset/Images/discount2.png',
                              fit: BoxFit.fill,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '25% Discount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'For a cozy yellow set!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button onPressed logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF0C8A7B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: Text(
                                      'Learn More',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 264,
                        margin: EdgeInsets.only(left: 3, right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'Asset/Images/discount1.png',
                              fit: BoxFit.fill,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '10% Discount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'For a cozy yellow set!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button onPressed logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF0C8A7B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: Text(
                                      'Learn More',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    
                      Container(
                        width: 264,
                        margin: EdgeInsets.only(left: 3, right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'Asset/Images/discount1.png',
                              fit: BoxFit.fill,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '10% Discount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'For a cozy yellow set!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button onPressed logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF0C8A7B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: Text(
                                      'Learn More',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //This is catagories part small containers
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActive1 =
                                !isActive1; // Toggle the isActive flag when the button is pressed

                            isActive2 = false;
                            isActive3 = false;
                            isActive4 = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isActive1
                              ? Color(0xFF0C8A7B)
                              : Colors
                                  .grey, // Use different background colors based on the isActive flag
                          fixedSize: Size(120, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.chair),
                            SizedBox(width: 5),
                            Text(
                              'Armchair',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActive2 =
                                !isActive2; // Toggle the isActive flag when the button is pressed

                            isActive1 = false;
                            isActive3 = false;
                            isActive4 = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isActive2
                              ? Color(0xFF0C8A7B)
                              : Colors
                                  .grey, // Use different background colors based on the isActive flag
                          fixedSize: Size(120, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.weekend),
                            SizedBox(width: 5),
                            Text(
                              'Sofa',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActive3 =
                                !isActive3; // Toggle the isActive flag when the button is pressed

                            isActive1 = false;
                            isActive2 = false;
                            isActive4 = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isActive3
                              ? Color(0xFF0C8A7B)
                              : Colors
                                  .grey, // Use different background colors based on the isActive flag
                          fixedSize: Size(120, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bed),
                            SizedBox(width: 5),
                            Text(
                              'Bed',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isActive4 =
                                !isActive4; // Toggle the isActive flag when the button is pressed

                            isActive1 = false;
                            isActive2 = false;
                            isActive3 = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isActive4
                              ? Color(0xFF0C8A7B)
                              : Colors
                                  .grey, // Use different background colors based on the isActive flag
                          fixedSize: Size(120, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lightbulb_outline),
                            SizedBox(width: 5),
                            Text(
                              'Light',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 5,
                      )
                      // Repeat the same code for the other buttons...
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //More interested text and view all button
                Container(
                  width: 800,
                  child: Row(
                    children: [
                      Text(
                        'More Interested',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w800,
                          fontSize: 21,
                          color: Colors.black,
                        ),
                      ),
                
                      SizedBox(
                          width: 530), // Add spacing between the text and button
                
                      //View All button
                      ElevatedButton(
                        onPressed: () {
                          // Add your button onPressed logic here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(
                              255, 240, 240, 240), // Customize button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 103, 65),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //The more interested product list
                Container(
                  height: 240,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 200, // Adjust the width as needed
                          child: Column(
                            children: [
                              //The image
                              Container(
                                width: 200,
                                height: 150,
                                child: Image.asset(
                                  image1, // Replace with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              //The text and the cart button
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //the text product name,price
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name1, // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Text(
                                        'Hans j. wegner', // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color.fromARGB(131, 0, 0, 0),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      //text showing the price
                                      Row(
                                        children: [
                                          Text(
                                            '\$', // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                          Text(
                                            price1, // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Add to cart button onPressed logic here
                                      Get.to(ProductViewPage(
                                        productimage: image1,
                                        productname: name1,
                                        productprice: price1,
                                      ));
                                    },
                                    icon: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF0C8A7B),
                                      ),
                                      padding: EdgeInsets.all(4),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.shopping_bag_outlined,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 16), // Add spacing between containers

                        Container(
                          width: 200, // Adjust the width as needed
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 150,
                                child: Image.asset(
                                  image2, // Replace with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //the text product name,price
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name2, // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Text(
                                        'Hans j. wegner', // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color.fromARGB(131, 0, 0, 0),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      //text showing the price
                                      Row(
                                        children: [
                                          Text(
                                            '\$', // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                          Text(
                                            price2, // Replace with your product name
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
                                                color: Color(0xFFF2A666)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Add to cart button onPressed logic here
                                      Get.to(ProductViewPage(
                                        productimage: image2,
                                        productname: name2,
                                        productprice: price2,
                                      ));
                                    },
                                    icon: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF0C8A7B),
                                      ),
                                      padding: EdgeInsets.all(4),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.shopping_bag_outlined,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 16), // Add spacing between containers

                        Container(
                          width: 200, // Adjust the width as needed
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 150,
                                child: Image.asset(
                                  image3, // Replace with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //the text product name,price
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name3, // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Text(
                                        'Hans j. wegner', // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color.fromARGB(131, 0, 0, 0),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      //text showing the price
                                      Row(
                                        children: [
                                          Text(
                                            '\$', // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                          Text(
                                            price3, // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      // Add to cart button onPressed logic here
                                      Get.to(ProductViewPage(
                                        productimage: image3,
                                        productname: name3,
                                        productprice: price3,
                                      ));
                                    },
                                    icon: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF0C8A7B),
                                      ),
                                      padding: EdgeInsets.all(4),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.shopping_bag_outlined,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      
                        SizedBox(width: 16,),

                        Container(
                          width: 200, // Adjust the width as needed
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 150,
                                child: Image.asset(
                                  image3, // Replace with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //the text product name,price
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name3, // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      Text(
                                        'Hans j. wegner', // Replace with your product name
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color.fromARGB(131, 0, 0, 0),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      //text showing the price
                                      Row(
                                        children: [
                                          Text(
                                            '\$', // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                          Text(
                                            price3, // Replace with your product name
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xFFF2A666),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      // Add to cart button onPressed logic here
                                      Get.to(ProductViewPage(
                                        productimage: image3,
                                        productname: name3,
                                        productprice: price3,
                                      ));
                                    },
                                    icon: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF0C8A7B),
                                      ),
                                      padding: EdgeInsets.all(4),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.shopping_bag_outlined,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

      //Bottom Bavigation bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          // Perform actions based on the tapped button
          switch (index) {
            case 0:
              // Home button tapped
              // Perform home-related actions
              Get.to(Homepage());
              break;
            case 1:
              // Favorites button tapped
              // Perform favorites-related actions
              break;
            case 2:
              // Shopping button tapped
              // Perform shopping-related actions
              // Get.to(UserCart());
              Get.to(CatalogScreen());
              break;
            case 3:
              // Profile button tapped
              // Perform profile-related actions
              //navigate to profile page
              Get.to(Profile());
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 12, left: 5),
              child: Column(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(height: 5),
                  Text('Home', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Icon(Icons.favorite_outline_outlined, color: Colors.black),
                  SizedBox(height: 5),
                  Text('Favorites', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.shopping_cart_outlined, color: Colors.black),
                SizedBox(height: 5),
                Text('Shopping', style: TextStyle(color: Colors.black)),
              ],
            ),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.person_outline_outlined, color: Colors.black),
                SizedBox(height: 5),
                Text('Profile', style: TextStyle(color: Colors.black)),
              ],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
