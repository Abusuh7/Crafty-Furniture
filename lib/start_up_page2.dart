import 'package:flutter/material.dart';
import 'package:mobile_app/start_up_page3.dart';

class StartUpPage2 extends StatelessWidget {
  const StartUpPage2({super.key});

  @override
  Widget build(context) {
    return //make a circular image at the center of 80% width pixle with a circular next button with arrow and skip button side by side at the bottom of the page
    Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.portrait
      
    //Portrait
      ? Container(
        decoration: const BoxDecoration(
          color: Color(0xF9F9F9)
        ),
        padding: EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('Asset/Images/startup2.png', width: 400,),
              const Padding(padding: EdgeInsets.only(bottom: 20),),
              const Text('Design Your Space With Augmented Reality By Creating Room', style: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 50,),

              //Icon between text n button
              const Icon(
                Icons.more_horiz,
                color: Color.fromARGB(255, 93, 93, 93),
                size: 60,
              ),

              SizedBox(height: 50,),


              //Both buttons are here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Button 1
                  TextButton(onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const StartUpPage3()),
                    );                   
                  }, 
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xD92B423F),
                        fontWeight: FontWeight.w900,
                        fontSize: 20
                      ),
                    ), 
                  ),
                                   
                SizedBox(width: 200,),

                  //Button 2
                  IconButton(onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StartUpPage3()));
                  }, 
                    icon: const Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Color(0xD92B423F),

                    ),
                    iconSize: 70,
                  ),
                ],
              ),
               
            ],
          ), 
        ),
      )
    
    
    //Landscape
      : Container(
        decoration: const BoxDecoration(
          color: Color(0xF9F9F9)
        ),
        padding: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('Asset/Images/startup2.png', width: 300,),
                const Padding(padding: EdgeInsets.only(bottom: 20),),
                const Text('Design Your Space With Augmented Reality By Creating Room', style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
        
                SizedBox(height: 50,),
        
                //Icon between text n button
                const Icon(
                  Icons.more_horiz,
                  color: Color.fromARGB(255, 93, 93, 93),
                  size: 60,
                ),
        
                SizedBox(height: 50,),
        
        
                //Both buttons are here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Button 1
                    TextButton(onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const StartUpPage3()),
                      );                   
                    }, 
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xD92B423F),
                          fontWeight: FontWeight.w900,
                          fontSize: 20
                        ),
                      ), 
                    ),
                                     
                  SizedBox(width: 600,),
        
                    //Button 2
                    IconButton(onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StartUpPage3()));
                    }, 
                      icon: const Icon(
                        Icons.arrow_circle_right_sharp,
                        color: Color(0xD92B423F),
        
                      ),
                      iconSize: 70,
                    ),
                  ],
                ),
                 
              ],
            ), 
          ),
        ),
      ), 
    );
    
  }
}