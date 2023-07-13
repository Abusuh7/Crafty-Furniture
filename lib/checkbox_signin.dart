import 'package:flutter/material.dart';


class CheckboxSignin extends StatefulWidget {
  const CheckboxSignin({super.key});

  @override
  State<CheckboxSignin> createState() => _CheckboxSigninState();
}

class _CheckboxSigninState extends State<CheckboxSignin> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color.fromARGB(255, 0, 0, 0);
    }

    return CheckboxListTile(
      title: const Text('Remember Me', style: TextStyle(fontWeight: FontWeight.w300),),
      checkColor: Colors.white,
      activeColor:const Color.fromARGB(255, 0, 0, 0),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
    
  }
}
