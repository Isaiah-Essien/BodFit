import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DashBar extends StatelessWidget {
  const DashBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 500,
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: MColors.primaryColor,
            ),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size(57, 57), // Customize the size as needed
                child: Image.asset(MImages.userKanayo, fit: BoxFit.cover),
              ),
            ),
          ),
          const Column(
            children: [
              Text('Welcome Back!'),
              Text('Kanayo O Kanayo'),
            ],
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: MColors.grey,
                ),
                child: const Center(child: Icon(Icons.search_rounded)),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: MColors.grey,
                ),
                child: const Center(child: Icon(Iconsax.notification)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
