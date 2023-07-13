import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/model/pws.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api_connection/api_connection.dart';
import '../../model/mydata.dart';

class ChangePasswordBtn extends StatefulWidget {
  ChangePasswordBtn({Key? key});

  @override
  State<ChangePasswordBtn> createState() => _ChangePasswordBtnState();
}

class _ChangePasswordBtnState extends State<ChangePasswordBtn> {
  final _formKey = GlobalKey<FormState>();

  var currentpasswordcontroller = TextEditingController();
  var newpasswordcontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();

  // static get http => null;

    //Getting the user details from the shared prefeerrence
  int? userId;


  // get http => null;

  @override
  void initState() {
    super.initState();
    getUserInfo(); //User Information

    //  TextEditingController nameController;
    //  TextEditingController emailController;
  }

  Future<void> getUserInfo() async {

    SharedPreferences prefs3 = await SharedPreferences.getInstance();
    int? userID = prefs3.getInt('userID');


    setState(() {
      this.userId = userID;
    });


    
  }

  //Validator for password
  String? validatePassword(String? value) {
    final newPassword = newpasswordcontroller.text;
    final confirmPassword = confirmpasswordcontroller.text;

    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    if (newPassword != confirmPassword) {
      return 'Passwords do not match';
    }

    return null; // Return null when the password is valid
  }

  //update the password
  updatepassword() async {
    MyPws usermodel = MyPws(
    userId ?? 0,
    currentpasswordcontroller.text,
    confirmpasswordcontroller.text,
  );

  try {
    var res = await http.post(
      Uri.parse(Authapi.changepassword),
      body: usermodel.toJson(),
    );

    if (res.statusCode == 200) {
      var resbodyOfSignUp = jsonDecode(res.body);

      if (resbodyOfSignUp['success'] == true) {
        Fluttertoast.showToast(msg: "Password updated successfully");
        newpasswordcontroller.clear();
        confirmpasswordcontroller.clear();
        currentpasswordcontroller.clear();
        Get.back();
      } else {
        Fluttertoast.showToast(msg: "Incorrect Current Password");
      }
    } else {
      // Handle non-200 status code if needed
    }
  } catch (e) {
    print(e.toString());
    Fluttertoast.showToast(msg: e.toString());
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp,
              color: Colors.black87, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Change Password',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
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

      //Portait
      ? Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: currentpasswordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Current Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF2B423F),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2B423F), width: 3),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: newpasswordcontroller,
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF2B423F),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2B423F), width: 3),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: confirmpasswordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF2B423F),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2B423F), width: 3),
                    ),
                  ),
                  obscureText: true,
                  validator: validatePassword, // Assign the validator method
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm Password Change'),
                            content: Text(
                                'Are you sure you want to change your password?'),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Confirm'),
                                onPressed: () {
                                  // Perform password change here
                                  updatepassword();
                                   // Close the dialog
                                  
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Please fix the errors',
                        gravity: ToastGravity.CENTER,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2B423F),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )


      //Landscape
      : Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: currentpasswordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Current Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF2B423F),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2B423F), width: 3),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: newpasswordcontroller,
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF2B423F),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2B423F), width: 3),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: confirmpasswordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF2B423F),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2B423F), width: 3),
                    ),
                  ),
                  obscureText: true,
                  validator: validatePassword, // Assign the validator method
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm Password Change'),
                            content: Text(
                                'Are you sure you want to change your password?'),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Confirm'),
                                onPressed: () {
                                  // Perform password change here
                                  updatepassword();
                                   // Close the dialog
                                  
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Please fix the errors',
                        gravity: ToastGravity.CENTER,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2B423F),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
