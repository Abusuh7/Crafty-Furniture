import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/homepage.dart';
import 'package:mobile_app/signin.dart';
import 'package:mobile_app/users/User_Profile_Btn/changepassword.dart';
import 'package:mobile_app/users/User_Profile_Btn/deliveryaddress.dart';
import 'package:mobile_app/users/User_Profile_Btn/legalpolicy.dart';
import 'package:mobile_app/users/User_Profile_Btn/orderhistory.dart';
import 'package:mobile_app/users/User_Profile_Btn/paymentmethodbtn.dart';
import 'package:mobile_app/users/User_Profile_Btn/profilebtn.dart';
import 'package:mobile_app/users/User_Profile_Btn/supportcenter.dart';
import 'package:mobile_app/users/catelog/usercart.dart';
import 'package:mobile_app/users/userPreferences/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../userPreferences/current_user.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  File? _selectedImage;

  void _takenPicture(ImageSource source) async {
    final imagepicker = ImagePicker();
    final pickedimage = await imagepicker.pickImage(source: source);

    if (pickedimage == null) {
      return;
    }

    //save the image in the shared prefference
    SharedPreferences image = await SharedPreferences.getInstance();
    await image.setString('imagePath', pickedimage.path);

    SharedPreferences image1 = await SharedPreferences.getInstance();
    String? imagePath = image1.getString('imagePath');

    setState(() {
      _selectedImage = File(imagePath!);
    });
  }

// To make the navigation for elevated buttom pass the funtion (VoidCallback onPressed) where press in the function
  logOutUser() async {
    var resultResponce = await Get.dialog(
      AlertDialog(
        title: Text('Log Out'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: "loggedOut");
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );

//if yes is clicked user data is removed from the local storage
    if (resultResponce == "loggedOut") {
      RememberUserPref.removeUserInfo().then((value) {
        Get.off(SignIn());
      });
    }
  }

//Widget for camera or gallary
cameraPrompt() async
{
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image'),
          content: Text('Choose from'),
          contentPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          contentTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
          actions: [
            TextButton(
              onPressed: () {
                _takenPicture(ImageSource.camera);
                Get.back();
              },
              child: Text(
                'Camera',
                style: TextStyle(
                  color: Color(0xFF2B423F),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _takenPicture(ImageSource.gallery);
                Get.back();
              },
              child: Text(
                'Gallery',
                style: TextStyle(
                  color: Color(0xFF2B423F),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    ); 
}

//Widgets for profile containers
  Widget profileText(IconData iconData, String text, VoidCallback function) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        // onPressed: function,
        onPressed: function,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(iconData, color: Colors.grey),
              SizedBox(width: 16),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//Functions
  nav1() {
    return Get.to(ProfileBtn());
  }

  nav2() {
    return Get.to(PaymentMethodBtn());
  }

  nav3() {
    return Get.to(OrderHistoryBtn());
  }

  nav4() {
    return Get.to(DeliveryAddressBtn());
  }

  nav5() {
    return Get.to(SupportCenterBtn());
  }

  nav6() {
    return Get.to(LegalPolicyBtn());
  }

  nav7() {
    return Get.to(ChangePasswordBtn());
  }

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
  Widget build(BuildContext context) {
    Widget profilepic = CircleAvatar(
      radius: 60,
      child: Icon(Icons.person, size: 60,), // Adjust the size as needed
    );

    if (_selectedImage != null) {
      profilepic = CircleAvatar(
        radius: 60,
        backgroundImage: FileImage(_selectedImage!),
      );
    }else if (imagePath != null)
    {
      profilepic = CircleAvatar(
        radius: 60,
        backgroundImage: FileImage(imagePath!),
      );
    }

    // if(imagePath != null)
    // {
    //   profilepic = CircleAvatar(
    //     radius: 60,
    //     backgroundImage: FileImage(imagePath!),
    //   );
    // }

    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState) {
        _currentUser.getUserInfo();
      },
      builder: (controller) {
        return Scaffold(
          appBar: //App bar
              AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_sharp,
                  color: Colors.black87, size: 24),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                )),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),

          body: MediaQuery.of(context).orientation == Orientation.portrait

              //Portrait
              ? SingleChildScrollView(
                  child: Container(
                    color: Color(0xFFF9F9F9),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),

                        // CircleAvatar(
                        //   radius: 60,
                        //   backgroundImage: AssetImage('Asset/Images/profile1.jpg'),
                        // ),
                        InkWell(onTap: cameraPrompt, child: profilepic),

                        SizedBox(height: 16),

                        Text(
                          userName ?? 'User',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          userEmail ?? 'Email',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: 24),

                        SizedBox(height: 24),
                        profileText(Icons.person, 'Edit Profile', nav1),
                        SizedBox(height: 16),
                        profileText(Icons.payment, 'Payment Methods', nav2),
                        SizedBox(height: 16),
                        profileText(Icons.history, 'Order History', nav3),
                        SizedBox(height: 16),
                        profileText(
                            Icons.location_on, 'Delivery Address', nav4),
                        SizedBox(height: 16),
                        profileText(
                            Icons.support_agent, 'Support Center', nav5),
                        SizedBox(height: 16),
                        profileText(Icons.policy, 'Legal Policy', nav6),
                        SizedBox(height: 16),
                        profileText(Icons.lock, 'Change Password', nav7),
                        SizedBox(height: 16),

                        //add a log out button
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              logOutUser();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.logout,
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                    SizedBox(width: 16),
                                    Text(
                                      'Log Out',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 255, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              //Landscape
              : SingleChildScrollView(
                  child: Container(
                    color: Color(0xFFF9F9F9),

                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),

                        // CircleAvatar(
                        //   radius: 60,
                        //   backgroundImage: AssetImage('Asset/Images/profile1.jpg'),
                        // ),
                        InkWell(onTap: cameraPrompt, child: profilepic),

                        SizedBox(height: 16),

                        Text(
                          userName ?? 'User',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          userEmail ?? 'Email',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: 24),

                        SizedBox(height: 24),
                        profileText(Icons.person, 'Edit Profile', nav1),
                        SizedBox(height: 16),
                        profileText(Icons.payment, 'Payment Methods', nav2),
                        SizedBox(height: 16),
                        profileText(Icons.history, 'Order History', nav3),
                        SizedBox(height: 16),
                        profileText(
                            Icons.location_on, 'Delivery Address', nav4),
                        SizedBox(height: 16),
                        profileText(
                            Icons.support_agent, 'Support Center', nav5),
                        SizedBox(height: 16),
                        profileText(Icons.policy, 'Legal Policy', nav6),
                        SizedBox(height: 16),
                        profileText(Icons.lock, 'Change Password', nav7),
                        SizedBox(height: 16),

                        //add a log out button
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              logOutUser();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.logout,
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                    SizedBox(width: 16),
                                    Text(
                                      'Log Out',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 255, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

          //Bottom navigation bar
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
                  Get.to(UserCart());
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
                      Icon(Icons.favorite_outline_outlined,
                          color: Colors.black),
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
      },
    );
  }
}
