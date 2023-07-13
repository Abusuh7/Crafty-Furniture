import 'package:flutter/material.dart';
import 'package:mobile_app/signin.dart';

class StartUpPage3 extends StatelessWidget {
  const StartUpPage3({super.key});

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
        padding: const  EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('Asset/Images/startup3.png', width: 400,),
              const Padding(padding: EdgeInsets.only(bottom: 20),),
              const Text('Explore World Class Top Furnitures As Per Your Requirements & Choice', style: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 50,),

              //Icon between text n button
              const Icon(
                Icons.more_horiz,
                color: Color.fromARGB(255, 93, 93, 93),
                size: 60,
              ),

              const SizedBox(height: 50,),


              //Both buttons are here
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     //Button 1
              //     TextButton(onPressed: () {}, 
              //       child: const Text(
              //         'Skip',
              //         style: TextStyle(
              //           color: Color(0xD92B423F),
              //           fontSize: 20
              //         ),
              //       ), 
              //     ),
                                   
              //   SizedBox(width: 200,),

              //     //Button 2
              //     IconButton(onPressed: () {}, 
              //       icon: const Icon(
              //         Icons.arrow_circle_right_sharp,
              //         color: Color(0xD92B423F),

              //       ),
              //       iconSize: 80,
              //     ),
              //   ],
              // ),

              //Create a text button with a background colour
              Container(
                width: 250,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xD92B423F),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TextButton(onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  SignIn()),
                  );
                }, 
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ), 
                ),
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
        padding: const  EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('Asset/Images/startup3.png', width: 300,),
                const Padding(padding: EdgeInsets.only(bottom: 20),),
                const Text('Explore World Class Top Furnitures As Per Your Requirements & Choice', style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
        
                const SizedBox(height: 50,),
        
                //Icon between text n button
                const Icon(
                  Icons.more_horiz,
                  color: Color.fromARGB(255, 93, 93, 93),
                  size: 60,
                ),
        
                const SizedBox(height: 50,),
        
        
                //Both buttons are here
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     //Button 1
                //     TextButton(onPressed: () {}, 
                //       child: const Text(
                //         'Skip',
                //         style: TextStyle(
                //           color: Color(0xD92B423F),
                //           fontSize: 20
                //         ),
                //       ), 
                //     ),
                                     
                //   SizedBox(width: 200,),
        
                //     //Button 2
                //     IconButton(onPressed: () {}, 
                //       icon: const Icon(
                //         Icons.arrow_circle_right_sharp,
                //         color: Color(0xD92B423F),
        
                //       ),
                //       iconSize: 80,
                //     ),
                //   ],
                // ),
        
                //Create a text button with a background colour
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xD92B423F),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextButton(onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>  SignIn()),
                      );
                    }, 
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ), 
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