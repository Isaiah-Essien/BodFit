import 'package:bodFit_group5_summative/features/workout/plans.dart';
import 'package:bodFit_group5_summative/utils/constants/custom_options_container.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
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
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
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
              Navigator.pushNamed(context, '/hiit');
            },
            child: const CustomImageContainer(
                imageUrl: MImages.workoutOptions5, imageName: 'Calisthenics'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/hiit');
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
