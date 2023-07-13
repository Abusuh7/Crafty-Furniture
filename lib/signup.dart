import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/api_connection/api_connection.dart';
import 'package:mobile_app/homepage.dart';
import 'package:mobile_app/model/user.dart';
import 'package:mobile_app/signin.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var namecontroller = TextEditingController();

  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

   validateUserEmail() async
   {
    try {
      var res = await http.post(
        Uri.parse(Authapi.validate),
        body: {
          'email': emailcontroller.text.trim(),
        },
      );

      if (res.statusCode == 200) // 200 successfull connection with API
      {
        var resbodyOfValidateEmail = jsonDecode(res.body);

        if (resbodyOfValidateEmail['emailFound']) {
          Fluttertoast.showToast(msg: "Email already used by someone");
        } else {
          registerAndSaveUserRecord();
        }
      } else {
        return "error";
      }
    } catch (e) 
    {
      // ignore: avoid_print
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  registerAndSaveUserRecord() async
  {
    User usermodel = User(
         1,
          namecontroller.text.trim(),
          emailcontroller.text.trim(),
          passwordcontroller.text.trim(),
      );

    try
    {
      var res = await http.post(
        Uri.parse(Authapi.signup),
        body: usermodel.toJson(),
      );

      if (res.statusCode == 200) // 200 successfull connection with API
      {
        var resbodyOfSignUp = jsonDecode(res.body);

        if (resbodyOfSignUp['success'] == true) {
          Fluttertoast.showToast(msg: "User Registered Successfully");
          
          //clear the contents in the text field
          namecontroller.clear();
          emailcontroller.clear();
          passwordcontroller.clear();
          // Navigator.pushReplacement(
          //     context as BuildContext, MaterialPageRoute(builder: (context) =>  SignIn()));
        } else {
          Fluttertoast.showToast(msg: "User Registration Failed"); 
        }

      } else {

      }
    }
    catch(e)
    {
      // ignore: avoid_print
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
      
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
                              builder: (context) =>  SignIn()));
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
                      "Create Account",
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
                      "Let's Create Account Together",
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

                //Full Name Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: const Text(
                      "Full Name:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // SizedBox(height: 5,),

                //Full Name Input Box
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name!';
                        }
                        return null;
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xD92B423F),
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: 'Enter your full name',
                      ),
                    ),
                  ),
                ),

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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email address';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return  'Please enter your password';
                        }
                        return null;
                      },
                      controller: passwordcontroller,
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
                        validateUserEmail();
                      }
                    },
                    child: const Text(
                      'SignUp',
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  Homepage()),
                      );
                    },
                    icon: Image.asset(
                      'Asset/Images/google-icon.png',
                    ),
                    label: const Text(
                      'Sign Up With Google',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ), //Space

                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already Have An Account?",
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
                              MaterialPageRoute(
                                  builder: (context) =>  SignIn()),
                            );
                          },
                          child: const Text(
                            'Sign In',
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
                              builder: (context) =>  SignIn()));
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
                      "Create Account",
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
                      "Let's Create Account Together",
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

                //Full Name Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: const Text(
                      "Full Name:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // SizedBox(height: 5,),

                //Full Name Input Box
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name!';
                        }
                        return null;
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xD92B423F),
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: 'Enter your full name',
                      ),
                    ),
                  ),
                ),

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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email address';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return  'Please enter your password';
                        }
                        return null;
                      },
                      controller: passwordcontroller,
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
                        validateUserEmail();
                      }
                    },
                    child: const Text(
                      'SignUp',
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  Homepage()),
                      );
                    },
                    icon: Image.asset(
                      'Asset/Images/google-icon.png',
                    ),
                    label: const Text(
                      'Sign Up With Google',
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ), //Space

                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already Have An Account?",
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
                              MaterialPageRoute(
                                  builder: (context) =>  SignIn()),
                            );
                          },
                          child: const Text(
                            'Sign In',
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
