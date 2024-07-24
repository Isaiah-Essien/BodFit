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
              Get.to(() => const Hiit());
            },
            child: const CustomImageContainer(
                imageUrl: MImages.workoutOptions2, imageName: 'High Intensity'),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const WeightLossPlan());
            },
            child: const CustomImageContainer(
                imageUrl: MImages.workoutOptions7, imageName: 'Weight loss'),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const RecoveryPlan());
            },
            child: const CustomImageContainer(
                imageUrl: MImages.workoutOptions8, imageName: 'Recovery'),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const StrengthPlan());
            },
            child: const CustomImageContainer(
                imageUrl: MImages.workoutOptions5,
                imageName: 'Strength Training'),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const ThirtyDayPlan());
            },
            child: const CustomImageContainer(
                imageUrl: 'assets/images/opt-1.jpg',
                imageName: '30-Day Challenge'),
          ),
        ],
      ),
    );
  }
}
