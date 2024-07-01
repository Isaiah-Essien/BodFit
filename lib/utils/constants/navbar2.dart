import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/helpers/helpers_utils.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar2 extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar2({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = MHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 0,
        left: 1,
        right: 1,
      ),
      child: Container(
        height: 57, // Increase height to accommodate icon and text
        decoration: BoxDecoration(
          color: darkMode ? MColors.grey : MColors.lightGrey,
          borderRadius: BorderRadius.circular(33),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: MColors.dark.withOpacity(0.1))
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
            color:
                currentIndex == index ? const Color(0xff29A0E3) : Colors.grey,
            size: 25,
          ),
          const SizedBox(height: 2), // Space between icon and text
          Text(
            text,
            style: TextStyle(
              color:
                  currentIndex == index ? const Color(0xff29A0E3) : Colors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
