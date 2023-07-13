import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/checkbox_signin.dart';
import 'package:mobile_app/homepage.dart';
import 'package:mobile_app/signup.dart';
import 'package:mobile_app/start_up_page3.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_app/api_connection/api_connection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/model/user.dart';
import 'package:mobile_app/users/userPreferences/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  loginusernow() async 
  {
    // try
    // {
      var res = await http.post(
      Uri.parse(Authapi.login),
      body: {
        "email": emailcontroller.text,
        "password": passwordcontroller.text,
      },
    );

    if (res.statusCode == 200) // 200 successfull connection with API
    {
      var resbodyOfLogin = jsonDecode(res.body);

      if (resbodyOfLogin['success'] == true) {
        Fluttertoast.showToast(msg: "Successfully Logged In");

        

        // Save user info
        User userInfo = User.fromJson(resbodyOfLogin['userdata']);

        //geth the user details from the userdata
        int userID = userInfo.user_id;
        String userName = userInfo.user_name;
        String userEmail = userInfo.user_email;

        print('The Username is: ' + userName);

        print('The Email is: ' + userEmail);

        

        // Save user name using shared_preferences for latter use
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', userName);

        // Save user email using shared_preferences for latter use
        SharedPreferences prefs2 = await SharedPreferences.getInstance();
        await prefs2.setString('userEmail', userEmail);

        // Save user id using shared_preferences for latter use
        SharedPreferences prefs3 = await SharedPreferences.getInstance();
        await prefs3.setInt('userID', userID);


        //save user info to local storage using shared preference
        await RememberUserPref.storeUserInfo(userInfo);



        //give a nice loading animation
        await Future.delayed(const Duration(seconds: 2));

        //navigate to the home page
        Get.to(Homepage());

      
        //clear the text fields
        // emailcontroller.clear();
        // passwordcontroller.clear();
      } else {
        Fluttertoast.showToast(msg: "Invalid Email Or Password! Try Again");
      }
    } else {}
    // } 
    // catch(e)
    // {
    //   print('Error :: ' + e.toString());
    // }
  }



  @override
  Widget build(context) {
    return
        //build a sign in form with 2 fields email and password with a signin button
        //and if the form is submitted, navigate to the home page
        //if the
        Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.portrait
      
      //Portait
      ? Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //Back Arrow Button
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      //natigate to start_up_page2 when this button is clicked
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartUpPage3()));
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_sharp,
                      color: Color.fromARGB(217, 138, 155, 153),
                    ),
                    iconSize: 60,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ), //Space

                //Welcome Back Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: const Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5,
                ), //Space

                //Welcome Back Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: const Text(
                      "Welcome Back! Please Enter Your Details.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 35,
                ), //Space

                //Email Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: const Text(
                      "Email:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // SizedBox(height: 5,),

                //Email Input Box
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color(0xD92B423F),
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: 'Enter your email address',
                      ),
                    ),
                  ),
                ),

                //Password Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: const Text(
                      "Password:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                //Password Input Box
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: TextFormField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color(0xD92B423F),
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: 'Enter your password',
                      ),
                    ),
                  ),
                ),

                //Checkbox
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: CheckboxSignin(),
                  ),
                ),

                //Forgot Password Text
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ), // Space

                //Sign In Button
                Container(
                  width: 350,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 12, 138, 123),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    onPressed: () {
                      //  Navigator.pushReplacement(
                      //    context,
                      //    MaterialPageRoute(builder: (context) => const Homepage()),
                      //  );
                      if (_formKey.currentState!.validate()) {
                        loginusernow();
                      }
                    },
                    child: const Text(
                      'SignIn',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ), //Space

                //Sign Up Google
                Container(
                  width: 350,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(217, 220, 221, 221),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton.icon(
                    onPressed: () {
                      //  Navigator.pushReplacement(
                      //    context,
                      //    MaterialPageRoute(builder: (context) => const Homepage()),
                      //  );
                    },
                    icon: Image.asset(
                      'Asset/Images/google-icon.png',
                    ),
                    label: const Text(
                      'Sign in With Google',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ), //Space

                //No Account
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xD92B423F),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]),
                )

                //Text('Welcome Back', style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600,),),
                //SizedBox(height: 20,),
                //Text('Welcome Back! Please Enter Your Details.', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),)
              ],
            ),
          ),
        ),
      )


      //Landscape
      : Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //Back Arrow Button
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      //natigate to start_up_page2 when this button is clicked
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartUpPage3()));
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_sharp,
                      color: Color.fromARGB(217, 138, 155, 153),
                    ),
                    iconSize: 60,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ), //Space

                //Welcome Back Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: const Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5,
                ), //Space

                //Welcome Back Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: const Text(
                      "Welcome Back! Please Enter Your Details.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 35,
                ), //Space

                //Email Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: const Text(
                      "Email:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // SizedBox(height: 5,),

                //Email Input Box
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color(0xD92B423F),
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: 'Enter your email address',
                      ),
                    ),
                  ),
                ),

                //Password Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: const Text(
                      "Password:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                //Password Input Box
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: TextFormField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color(0xD92B423F),
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: 'Enter your password',
                      ),
                    ),
                  ),
                ),

                //Checkbox
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: CheckboxSignin(),
                  ),
                ),

                //Forgot Password Text
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ), // Space

                //Sign In Button
                Container(
                  width: 350,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 12, 138, 123),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    onPressed: () {
                      //  Navigator.pushReplacement(
                      //    context,
                      //    MaterialPageRoute(builder: (context) => const Homepage()),
                      //  );
                      if (_formKey.currentState!.validate()) {
                        loginusernow();
                      }
                    },
                    child: const Text(
                      'SignIn',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ), //Space

                //Sign Up Google
                Container(
                  width: 350,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(217, 220, 221, 221),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton.icon(
                    onPressed: () {
                      //  Navigator.pushReplacement(
                      //    context,
                      //    MaterialPageRoute(builder: (context) => const Homepage()),
                      //  );
                    },
                    icon: Image.asset(
                      'Asset/Images/google-icon.png',
                    ),
                    label: const Text(
                      'Sign in With Google',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ), //Space

                //No Account
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xD92B423F),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]),
                )

                //Text('Welcome Back', style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600,),),
                //SizedBox(height: 20,),
                //Text('Welcome Back! Please Enter Your Details.', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//sgfsgsfdgsf
