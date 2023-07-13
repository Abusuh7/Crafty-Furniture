// Making a widget of our own to simplify the above main code

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text, //text is taken as a parameter 
      style: const TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 29,
        color: Colors.white,
        ),
    );
  }
}