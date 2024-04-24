import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constants/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  NativeAd? nativeAd;
  bool _nativeAdIsLoaded = false;
  loadNative() {
    final String _adUnitId = Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/2247696110'
        : 'ca-app-pub-3940256099942544/3986624511';
    nativeAd = NativeAd(
        adUnitId: _adUnitId,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            debugPrint('$NativeAd loaded.');
            setState(() {
              _nativeAdIsLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            // Dispose the ad here to free resources.
            debugPrint('$NativeAd failed to load: $error');
            ad.dispose();
          },
        ),
        request: const AdRequest(),
        // Styling
        nativeTemplateStyle: NativeTemplateStyle(
            // Required: Choose a template.
            templateType: TemplateType.medium,
            // Optional: Customize the ad's style.
            mainBackgroundColor: myLightBlack,
            cornerRadius: 10.0,
            callToActionTextStyle: NativeTemplateTextStyle(
                textColor: Colors.cyan,
                backgroundColor: Colors.red,
                style: NativeTemplateFontStyle.monospace,
                size: 16.0),
            primaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.red,
                backgroundColor: Colors.cyan,
                style: NativeTemplateFontStyle.italic,
                size: 16.0),
            secondaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.green,
                backgroundColor: Colors.black,
                style: NativeTemplateFontStyle.bold,
                size: 16.0),
            tertiaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.brown,
                backgroundColor: mygrey,
                style: NativeTemplateFontStyle.normal,
                size: 16.0)))
      ..load();
  }

  @override
  void initState() {
    super.initState();
    loadNative();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: myBlack,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.1),
            Text(
              'Obettaikenna19@gmail.com',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.025,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              'Ikenna obetta',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: size.height * 0.02,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              width: size.width,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: mygrey,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Plan Type',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                      Text(
                        'Free',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Buy Plan',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                      Text(
                        'Select Plans',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delete Account',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                      Text(
                        'Delete',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 320, // minimum recommended width
                minHeight: 320, // minimum recommended height
                maxWidth: 400,
                maxHeight: 400,
              ),
              child: AdWidget(ad: nativeAd!),
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.18,
                        decoration: BoxDecoration(
                            color: mygrey,
                            borderRadius: BorderRadius.circular(15)),
                        child: SvgPicture.asset(
                          'assets/facebook.svg',
                          height: size.height * 0.07,
                          width: size.width * 0.18,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Center(
                      child: Text(
                        'Facebook',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: size.height * 0.01,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.18,
                        decoration: BoxDecoration(
                            color: mygrey,
                            borderRadius: BorderRadius.circular(15)),
                        child: SvgPicture.asset(
                          'assets/whatsapp.svg',
                          height: size.height * 0.07,
                          width: size.width * 0.18,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Center(
                      child: Text(
                        'Whatsapp',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: size.height * 0.01,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.18,
                        decoration: BoxDecoration(
                            color: mygrey,
                            borderRadius: BorderRadius.circular(15)),
                        child: SvgPicture.asset(
                          'assets/x.svg',
                          height: size.height * 0.07,
                          width: size.width * 0.18,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Center(
                      child: Text(
                        'X',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: size.height * 0.01,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Center(
              child: Text(
                'Follow us on social Media',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: size.height * 0.01,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
