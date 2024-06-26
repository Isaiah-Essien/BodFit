import 'package:bodFit_group5_summative/features/navigation/navigation.dart';
import 'package:bodFit_group5_summative/features/workout/screens/options/high_intensity.dart';
import 'package:bodFit_group5_summative/features/workout/screens/options/workout_options.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Options2 extends StatefulWidget {
  const Options2({super.key});

  @override
  _Options2State createState() => _Options2State();
}

class _Options2State extends State<Options2> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    WorkoutOptions(),
    // HighIntensity(),
    // WeightLoss(),
    // Recovery(),
    // ThirtyDayChallenge(),
    // StrengthTraining(),
    // Exclusive(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavBar(
        appBar: const MyAppBar(
          heading: 'Choose your workout plan',
        ),
        body: _screens[_currentIndex],
        currentIndex: _currentIndex,
        onTap: _onTap);
  }
}

class Hiit extends StatelessWidget {
  const Hiit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: 'High Intensity',
        page: '/',
      ),
      body: HighIntensity(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Navigation(),
            transition: Transition.circularReveal,
            duration: const Duration(seconds: 1),
          );
        },
        child: const Icon(
          Iconsax.play_circle5,
          size: 55,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
