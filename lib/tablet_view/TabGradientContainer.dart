// //Here i used single colour

// import 'package:flutter/material.dart';
// import 'package:mobile_app/tablet_view/tab_text_widger.dart';

// import 'package:mobile_app/text_widget.dart';

// //Variables
// var startBackgroundColourVar = Color(0xFF2B423F);

// //Constants
// const startbackgroundColourConst = Color(0xFF2B423F);

// // Making a widget of our own to simplify the above main code

// class TabGradientContainer extends StatelessWidget {
//   const TabGradientContainer(this.colour, {super.key});

//   final Color colour;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(color: colour),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 400,
//               // height: 400,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
                  
//                   Container(
//                     width: 400,
//                     height: 400,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 6.0,
//                       ),
//                     ),
//                     child: ClipOval(
//                       child: Image.asset(
//                         'Asset/Images/Crafty-Furniture2.png',
//                         fit: BoxFit.contain,
//                         color: Color.fromARGB(153, 255, 255, 255),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            
//             SizedBox(height: 70),
            
//             TabTextWidget('Crafty Furniture'),
//           ],
//         ),
//       ),
//     );
//   }
// }
