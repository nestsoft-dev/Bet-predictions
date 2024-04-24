import 'dart:io';

import 'package:betting_tips/screens/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/colors.dart';
import '../widgets/freeGamesTile.dart';
import '../widgets/freeGamesTile.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  BannerAd? _anchoredAdaptiveAd;
  bool _isLoaded = false;
  bool _isLoadedReward = false;
  RewardedAd? _rewardedAd;

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

  @override
  void initState() {
    super.initState();
    loadRewards();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Free Match Predictions',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.025,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (_isLoadedReward) {
                        _rewardedAd!.show(onUserEarnedReward: (red, val) {});
                      }

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ProfilePage()));
                    },
                    icon: const Icon(
                      Iconsax.user,
                      color: Colors.white,
                    ))
              ],
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
                  padding: EdgeInsets.only(bottom: 10),
                  child: FreeGameTile(),
                ), // Replace `Container()` with your actual list item
              ),
            ),
          ],
        ),
      ),
    );
  }
}
