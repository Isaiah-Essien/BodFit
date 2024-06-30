import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/onboarding.dart';
import 'package:bodFit_group5_summative/features/workout/screens/options/workout_options.dart';
import 'package:bodFit_group5_summative/utils/theme/theme.dart';
// ignore: depend_on_referenced_packages
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
      home: const OnBoardingScreen(),
      // home: Movements(),
      routes: {
        // Four major routes
        '/workout': (context) => const WorkoutOptions(),
        //   Workout Options
        //   Workout Routines
      },
    );
  }
}
