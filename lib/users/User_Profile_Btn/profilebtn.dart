import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobile_app/model/mydata.dart';
import 'package:mobile_app/users/navbar/userprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../api_connection/api_connection.dart';
import '../../model/user.dart';
import '../userPreferences/current_user.dart';

class ProfileBtn extends StatefulWidget {
  const ProfileBtn({super.key});

  @override
  State<ProfileBtn> createState() => _ProfileBtnState();
}

class _ProfileBtnState extends State<ProfileBtn> {
  //Used to get from the local storage
  final CurrentUser _currentUser = Get.put(CurrentUser());

  bool _isEditing = false;
  late TextEditingController nameController;
  late TextEditingController emailController;

  //Getting the user details from the shared prefeerrence
  int? userId;
  String? userName;
  String? userEmail;
  File? imagePath;

  final _formKey = GlobalKey<FormState>();

  // get http => null;

  @override
  void initState() {
    super.initState();
    getUserInfo(); //User Information
    

    //  TextEditingController nameController;
    //  TextEditingController emailController;
  }

  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('userName');

    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    String? userEmail = prefs2.getString('userEmail');

    SharedPreferences prefs3 = await SharedPreferences.getInstance();
    int? userID = prefs3.getInt('userID');

    SharedPreferences image1 = await SharedPreferences.getInstance();
    String? imagePath = image1.getString('imagePath');

    setState(() {
      this.userName = userName;
      this.userEmail = userEmail;
      this.imagePath = File(imagePath!);
      this.userId = userID;
    });

    nameController = TextEditingController(text: userName ?? 'Not Found');
    emailController = TextEditingController(text: userEmail ?? 'Not Found');

    
  }
  //Getting the user details from the shared prefeerrence

  // @override
  // void initState() {
  //   super.initState();
  //   getUserInfo(); //User Information

  //   nameController =
  //       TextEditingController(text: userName ?? 'Not Found');
  //   emailController =
  //       TextEditingController(text: userEmail ?? 'Not Found');
  // }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
      
      // userName;
      // userEmail;
    });
  }

//update the user
  updateUserInfo() async {
    MyData usermodel = MyData(
      userId ?? 0,
      this.nameController.text.trim(),
      this.emailController.text.trim(),
      '',
    );

    try {
      var res = await http.post(
        Uri.parse(Authapi.update),
        body: usermodel.toJson(),
      );

      if (res.statusCode == 200) // 200 successfull connection with API
      {
        var resbodyOfSignUp = jsonDecode(res.body);

        if (resbodyOfSignUp['success'] == true) {
          Fluttertoast.showToast(msg: "User Updated Successfully");

          //update the shared prefference for user name for the new name
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userName', this.nameController.text.trim());

          //update the shared prefference for user email for the new email
          SharedPreferences prefs2 = await SharedPreferences.getInstance();
          prefs2.setString('userEmail', this.emailController.text.trim());

          //reload the page 
          
          

          // Navigator.pushReplacement(
          //     context as BuildContext, MaterialPageRoute(builder: (context) =>  SignIn()));
        } else {
          Fluttertoast.showToast(msg: "User Update Failed");
        }
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  //set state


  @override
  Widget build(BuildContext context) {
    Widget profilepic = CircleAvatar(
      radius: 60,
      child: Icon(
        Icons.person,
        size: 60,
      ), // Adjust the size as needed
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
        radius: 60,
        backgroundImage: FileImage(imagePath!),
      );
    }

    return Scaffold(
      appBar: //App bar
          AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp,
              color: Colors.black87, size: 24),
          onPressed: () {
            Get.to(Profile());
          },
        ),
        title: Text('Edit Profile',
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
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      profilepic,
                      SizedBox(height: 16),
                      _isEditing
                          ? Container(
                              width: 300,
                              child: TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(labelText: 'Name'),
                              ),
                            )
                          : Text(
                              userName ?? 'Not Found',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      SizedBox(height: 8),
                      _isEditing
                          ? Container(
                              width: 300,
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(labelText: 'Email'),
                              ),
                            )
                          : Text(
                              userEmail ?? 'Not Found',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _isEditing ? updateUserInfo : _toggleEditing,
                        child: Text(_isEditing ? 'Save' : 'Edit'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF2B423F),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )

          //Landscape
          : SingleChildScrollView(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      profilepic,
                      SizedBox(height: 16),
                      _isEditing
                          ? Container(
                              width: 300,
                              child: TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(labelText: 'Name'),
                              ),
                            )
                          : Text(
                              userName ?? 'Not Found',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      SizedBox(height: 8),
                      _isEditing
                          ? Container(
                              width: 300,
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(labelText: 'Email'),
                              ),
                            )
                          : Text(
                              userEmail ?? 'Not Found',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _isEditing ? updateUserInfo : _toggleEditing,
                        child: Text(_isEditing ? 'Save' : 'Edit'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF2B423F),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
