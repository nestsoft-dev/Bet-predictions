import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:betting_tips/constants/colors.dart';
import 'package:betting_tips/screens/betCodes.dart';
import 'package:betting_tips/screens/homePage.dart';
import 'package:betting_tips/screens/vip.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  final _controller = NotchBottomBarController(index: 0);
  final _pageController = PageController(initialPage: 0);
  int maxCount = 5;

  onTap(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = const [HomePage(), VipPage(), BetCodesPage()];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(_screens.length, (index) => _screens[index]),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Iconsax.home,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Iconsax.home,
              color: Colors.white,
            ),
            itemLabel: 'Free',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Iconsax.diamonds,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Iconsax.diamonds,
              color: Colors.yellow,
            ),
            itemLabel: 'VIP',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Iconsax.code,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Iconsax.code,
              color: Colors.white,
            ),
            itemLabel: 'Bet Codes',
          ),
        ],
        color: mygrey,
        showLabel: false,
        shadowElevation: 5,
        kBottomRadius: 28.0,
        notchColor: mygrey,
        removeMargins: false,
        bottomBarWidth: 500,
        showShadow: false,
        durationInMilliSeconds: 300,
        elevation: 1,
        onTap: onTap,
        kIconSize: size.height * 0.025,
      ),
    );
  }
}
