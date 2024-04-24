import 'package:betting_tips/constants/colors.dart';
import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  const MyTextInput(
      {super.key,
      required this.hint,
      required this.controller,
      required this.obscureText,
      required this.type,
      this.child});
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType type;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: type,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          suffix: child,
          fillColor: mygrey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          hintText: hint,
          hintStyle:
              TextStyle(color: const Color.fromARGB(255, 158, 158, 158))),
    );
  }
}
