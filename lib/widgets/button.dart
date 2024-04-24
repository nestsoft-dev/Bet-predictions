import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.name, required this.ontap});
  final String name;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [mygrey, Colors.black],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: size.height * 0.02),
          ),
        ),
      ),
    );
  }
}
