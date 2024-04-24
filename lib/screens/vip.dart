import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../widgets/button.dart';
import 'plansPage.dart';

class VipPage extends StatelessWidget {
  const VipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: myBlack,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              'VIP Predictions',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.025,
              ),
            ),
            Spacer(),
            Center(
              child: MyButton(
                  name: 'Click to Subscribe',
                  ontap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const PlanPage()));
                  }),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
