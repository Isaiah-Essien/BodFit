import 'package:bodFit_group5_summative/features/dashboard/dashboard.dart';
import 'package:bodFit_group5_summative/features/navigation/navigation.dart';
import 'package:bodFit_group5_summative/features/nutrition/nutrition.dart';
import 'package:bodFit_group5_summative/features/profile/profile.dart';
import 'package:bodFit_group5_summative/features/workout/options.dart';
import 'package:bodFit_group5_summative/features/workout/screens/options/workout_options.dart';
import 'package:bodFit_group5_summative/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      // home: const OnBoardingScreen(),
      // home: Movements(),
      home: Navigation(),
      routes: {
        // Four major routes
        '/dashboard': (context) => const Dashboard(),
        '/workout': (context) => const WorkoutOptions(),
        '/nutrition': (context) => const Nutrition(),
        '/profile': (context) => const Profile(),
        //   Workout Options
        '/hiit': (context) => const Hiit(),
      },
    );
  }
}
