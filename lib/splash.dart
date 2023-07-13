import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/gradient_container.dart';

import 'package:mobile_app/responsive.dart';
import 'package:mobile_app/start_up_page1.dart';
import 'package:mobile_app/tablet_view/TabGradientContainer.dart';
import 'package:mobile_app/tablet_view/tab_start_up_page1.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  

  void initState() {
    super.initState();
    _navigateHome();      
  }

  // _navigateHome() async{
  //   await Future.delayed(Duration(milliseconds: 2000), () {});
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => ResponsiveLayout(mobileBody: StartUpPage1, tabletBody: tabletBody)),
  //   );
  // }

  _navigateHome() async{
    await Future.delayed(Duration(milliseconds: 3000), () {});
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => ResponsiveLayout(mobileBody: StartUpPage1(), tabletBody: TabStartUp1())),
    // );
    Get.to(StartUpPage1());
  }


  @override
  Widget build(context) {
    return Scaffold(
        body: GradientContainer(Color(0xFF2B423F)),
        // ResponsiveLayout(
        //   mobileBody: GradientContainer(
        //     Color(0xFF2B423F)
        //   ),

        //   tabletBody: TabGradientContainer(
        //     Color(0xFF2B423F)
        //   ),
        //   ) 
      );
  }
}