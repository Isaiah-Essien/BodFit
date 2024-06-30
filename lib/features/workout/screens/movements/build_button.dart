import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClicked;

  const ButtonWidget({
    super.key,
    required this.icon,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        backgroundColor: MColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), // Perfect circle
        ),
      ),
      onPressed: onClicked,
      child: Icon(
        icon,
        size: 80,
      ),
    );
  }
}
