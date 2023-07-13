//widget app which contains all the design
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//Connecting to the widget which we created so that we can call here
import 'package:mobile_app/splash.dart';

void main() {
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    ),
  );
}



