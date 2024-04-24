import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constants/colors.dart';

class BetCodesPage extends StatefulWidget {
  const BetCodesPage({super.key});

  @override
  State<BetCodesPage> createState() => _BetCodesPageState();
}

class _BetCodesPageState extends State<BetCodesPage> {
  BannerAd? _anchoredAdaptiveAd;
  bool _isLoaded = false;
  bool _isLoadedReward = false;
  RewardedAd? _rewardedAd;

  @override
  void initState() {
    super.initState();
    loadRewards();
  }

  @override
  void dispose() {
    _anchoredAdaptiveAd?.dispose();
    super.dispose();
  }

  loadRewards() {
    final adUnitIdR = Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/5224354917'
        : 'ca-app-pub-3940256099942544/1712485313';
    RewardedAd.load(
        adUnitId: adUnitIdR,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            setState(() {
              _isLoadedReward = true;
            });
            debugPrint('$ad loaded.---------------------Reward');
            // Keep a reference to the ad so you can show it later.
            _rewardedAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedAd failed to load: $error');
          },
        ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  Future<void> _loadAd() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      return;
    }

    _anchoredAdaptiveAd = BannerAd(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _anchoredAdaptiveAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
      ),
    );
    return _anchoredAdaptiveAd!.load();
  }

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
              'Bet Code',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.025,
              ),
            ),
            SizedBox(
              height: size.height * 0.012,
            ),
            if (_anchoredAdaptiveAd != null && _isLoaded)
              Container(
                color: Colors.green,
                width: _anchoredAdaptiveAd!.size.width.toDouble(),
                height: _anchoredAdaptiveAd!.size.height.toDouble(),
                child: AdWidget(ad: _anchoredAdaptiveAd!),
              ),
            SizedBox(
              height: size.height * 0.012,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount:
                    10, // Replace `itemCount` with the actual number of items
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _betCode(context, () async {
                    if (_isLoadedReward) {
                      _rewardedAd!.show(onUserEarnedReward: (val, rel) async {
                        await Clipboard.setData(
                            const ClipboardData(text: 'HVCYVSC25'));
                      }).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Bet Code has been Copied')));
                      });
                    }
                    await Clipboard.setData(
                            const ClipboardData(text: 'HVCYVSC25'))
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Bet Code has been Copied')));
                    });
                  }),
                ), // Replace `Container()` with your actual list item
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _betCode(BuildContext context, VoidCallback copy) {
  final size = MediaQuery.of(context).size;
  return Container(
    // height: size.height * 0.25,
    width: size.width,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.2), // myLightBlack,
        borderRadius: BorderRadius.circular(15)),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fri, 14 2024',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: size.height * 0.015,
              ),
            ),
            SizedBox(
              height: size.height * 0.012,
            ),
            Text(
              'Odds: 2.5',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.02,
              ),
            ),
            SizedBox(
              height: size.height * 0.012,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '25HDBKVMMS',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.02,
                  ),
                ),
                IconButton(
                    onPressed: copy,
                    icon: const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(
              height: size.height * 0.012,
            ),
            Text(
              'Bet 9ja',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.02,
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          child: Icon(
            Icons.check,
            color: Colors.green,
            size: size.height * 0.05,
          ),
        )
      ],
    ),
  );
}
