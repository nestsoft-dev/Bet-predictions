import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: myBlack,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              'Free Match Predictions',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.025),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
