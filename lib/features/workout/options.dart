import 'package:bodFit_group5_summative/features/workout/fitness_options.dart';
import 'package:bodFit_group5_summative/features/workout/workout_options.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/scaffold_wrapper.dart';
import 'package:flutter/material.dart';

class Options2 extends StatefulWidget {
  const Options2({super.key});

  @override
  _Options2State createState() => _Options2State();
}

class _Options2State extends State<Options2> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    FitnessOptions(),
    WorkoutOptions(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavBar(
        appBar: MyAppBar(
          heading: 'Choose your workout plan',
        ),
        body: _screens[_currentIndex],
        currentIndex: _currentIndex,
        onTap: _onTap);
  }
}
