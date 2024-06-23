import 'package:bodFit_group5_summative/utils/constants/custom_options_container.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:flutter/material.dart';

class WorkoutOptions extends StatelessWidget {
  const WorkoutOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 40.0,
        crossAxisSpacing: 10.0,
        children: const <Widget>[
          CustomImageContainer(
            imageUrl: MImages.workoutOptions6,
            imageName: 'Customize',
          ),
          CustomImageContainer(
              imageUrl: MImages.workoutOptions2, imageName: 'HIIT Workouts'),
          CustomImageContainer(
              imageUrl: MImages.workoutOptions3,
              imageName: 'Strength Training'),
          CustomImageContainer(
              imageUrl: MImages.workoutOptions4, imageName: 'Bulking Season'),
          CustomImageContainer(
              imageUrl: MImages.workoutOptions5, imageName: 'Calisthenics'),
          CustomImageContainer(
              imageUrl: 'assets/images/opt-1.jpg',
              imageName: '30-Day Challenge'),
        ],
      ),
    );
  }
}
