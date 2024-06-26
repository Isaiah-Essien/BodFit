import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
        left: 1,
        right: 1,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff282A2C),
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
                  tabBackgroundColor: Color(0xff29A0E3),
                  tabs: const [
                    GButton(
                      icon: Iconsax.home4,
                      text: 'home',
                    ),
                    GButton(
                      icon: Iconsax.weight_15,
                      text: 'workouts',
                    ),
                    GButton(
                      icon: Iconsax.gift,
                      text: 'nutrition',
                    ),
                    GButton(
                      icon: Iconsax.user,
                      text: 'profile',
                    ),
                  ],
                  selectedIndex: currentIndex,
                  onTabChange: onTap,
                ))),
      ),
    );
  }
}
