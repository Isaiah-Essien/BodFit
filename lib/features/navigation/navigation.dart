import 'package:bodFit_group5_summative/features/dashboard/dashboard.dart';
import 'package:bodFit_group5_summative/features/nutrition/nutrition.dart';
import 'package:bodFit_group5_summative/features/profile/profile.dart';
import 'package:bodFit_group5_summative/features/workout/screens/options/workout_options.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/scaffold_wrapper.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Dashboard(),
    const WorkoutOptions(),
    const Nutrition(),
    const Profile(),
  ];

  final List<String> _heading = [
    'none',
    'Choose workout plan',
    'Nutrition',
    'none'
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String currentHeading = _heading[_currentIndex];

    return ScaffoldWithNavBar(
        body: _screens[_currentIndex],
        appBar: currentHeading != 'none'
            ? MyAppBar(
                heading: currentHeading,
              )
            : null,
        currentIndex: _currentIndex,
        onTap: _onTap);
  }
}
