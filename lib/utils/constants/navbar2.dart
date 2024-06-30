import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar2 extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar2({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 0,
        left: 1,
        right: 1,
      ),
      child: Container(
        height: 65, // Increase height to accommodate icon and text
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
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(Iconsax.home4, 'home', 0),
                    _buildNavItem(Icons.fitness_center_rounded, 'workouts', 1),
                    _buildNavItem(Icons.lunch_dining_rounded, 'nutrition', 2),
                    _buildNavItem(Iconsax.user, 'profile', 3),
                  ],
                ))),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Color(0xff29A0E3) : Colors.grey,
            size: 29,
          ),
          const SizedBox(height: 2), // Space between icon and text
          Text(
            text,
            style: TextStyle(
              color: currentIndex == index ? Color(0xff29A0E3) : Colors.grey,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
