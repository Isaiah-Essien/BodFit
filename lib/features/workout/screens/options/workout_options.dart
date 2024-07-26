import 'package:bodFit_group5_summative/features/Subscription/subscription.dart';
import 'package:bodFit_group5_summative/features/workout/plans.dart';
import 'package:bodFit_group5_summative/utils/constants/custom_options_container.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutOptions extends StatelessWidget {
  const WorkoutOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 40.0,
        crossAxisSpacing: 10.0,
        children: <Widget>[
          InkWell(
            onTap: () => Get.to(() => const SubscriptionPage()),
            child: const CustomImageContainer(
              imageUrl: MImages.workoutOptions6,
              imageName: 'Customize',
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const CardioPlan());
            },
            child: const CustomImageContainer(
                imageUrl: MImages.workoutOptions2, imageName: 'Cardio'),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const ShouldersPlan());
            },
            child: const CustomImageContainer(
                imageUrl: MImages.workoutOptions5, imageName: 'Shoulders'),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const LowerLegsPlan());
            },
            child: const CustomImageContainer(
                imageUrl: MImages.workoutOptions7, imageName: 'Lower Legs'),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const BackPlan());
            },
            child: const CustomImageContainer(
                imageUrl: MImages.workoutOptions3, imageName: 'Back'),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const ChestPlan());
            },
            child: const CustomImageContainer(
                imageUrl: 'assets/images/opt-1.jpg', imageName: 'Chest'),
          ),
        ],
      ),
    );
  }
}
