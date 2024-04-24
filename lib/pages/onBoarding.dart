import 'package:betting_tips/constants/colors.dart';
import 'package:betting_tips/pages/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/button.dart';

class OnBoardringPage extends StatefulWidget {
  const OnBoardringPage({super.key});

  @override
  State<OnBoardringPage> createState() => _OnBoardringPageState();
}

class _OnBoardringPageState extends State<OnBoardringPage> {
  int _currentPage = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> text = [
    'Get the Best Match Predictions',
    'Enjoy VIP Advantages on games',
    'Get Match BettingBetting Codes',
  ];

  List<String> lotties = [
    'assets/bet_predict.json',
    'assets/vip.json',
    'assets/beeting_codes.json',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: myBlack,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    itemCount: 3,
                    onPageChanged: (val) {
                      setState(() {
                        _currentPage = val;
                      });
                    },
                    itemBuilder: (_, index) => Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.15,
                            ),
                            Container(
                              height: size.height * 0.25,
                              width: size.width * 0.55,
                              decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Lottie.asset(
                                repeat: false,
                                lotties[index],
                                height: size.height * 0.25,
                                width: size.width * 0.55,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.15,
                            ),
                            Text(
                              text[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.025),
                            ),
                          ],
                        ))),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                MyButton(
                    name: _currentPage < 2 ? 'Next' : 'Sign Up',
                    ontap: _currentPage < 2
                        ? () {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          }
                        : () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (_) => const RegisterPage()),
                                (route) => false);
                          }),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedSmoothIndicator(
                    activeIndex: _currentPage,
                    count: 3,
                    effect: WormEffect(
                      dotHeight: size.height * 0.0055,
                      dotWidth: size.height * 0.02,
                      dotColor: mygrey,
                      activeDotColor: Colors.white,
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
