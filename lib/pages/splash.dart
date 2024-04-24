import 'package:betting_tips/constants/colors.dart';
import 'package:betting_tips/pages/onBoarding.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const OnBoardringPage()),
          (route) => false);
    });
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [myLightBlack, myLightBlack, myBlack],
                begin: Alignment.topRight,
                end: AlignmentDirectional.bottomStart)),
      ),
    );
  }
}
