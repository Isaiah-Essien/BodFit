import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 0,
        left: 1,
        right: 1,
      ),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xff282A2C),
          borderRadius: BorderRadius.circular(33),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1))
          ],
        ),
        child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  gap: 8,
                  activeColor: Colors.white,
                  color: Colors.white,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  duration: const Duration(milliseconds: 800),
                  tabBackgroundColor: const Color(0xff29A0E3),
                  tabs: const [
                    GButton(
                      icon: Iconsax.home4,
                      iconSize: 30,
                    ),
                    GButton(
                      icon: Iconsax.weight_15,
                      iconSize: 30,
                    ),
                    GButton(
                      icon: Iconsax.gift,
                      iconSize: 30,
                    ),
                    GButton(
                      icon: Iconsax.user,
                      iconSize: 30,
                    ),
                  ],
                  selectedIndex: currentIndex,
                  onTabChange: onTap,
                ))),
      ),
    );
  }
}
