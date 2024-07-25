import 'dart:async';

import 'package:bodFit_group5_summative/features/workout/screens/movements/build_button.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/exercise.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../api/api_exercise.dart';
import '../../api/api_service.dart';

class Movements extends StatefulWidget {
  final String title;

  const Movements({super.key, required this.title});

  @override
  State<Movements> createState() => _MovementsState();
}

class _MovementsState extends State<Movements> {
  double screenHeight = 0;
  double screenWidth = 0;
  int _currentIndex = 0;
  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;
  late List<String> allExercises;
  late Future<List<Exercise>> futureExercises;

  void resetTimer() {
    setState(() {
      seconds = maxSeconds;
    });
  }

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  void _onTap() {
    if (_currentIndex < (allExercises.length - 1)) {
      setState(() {
        _currentIndex++;
      });
      futureExercises = ApiService.fetchExercise();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.title.contains('Recovery')) {
      allExercises = Recovery.allExercises;
    } else if (widget.title.contains('WeightLoss')) {
      allExercises = WeightLoss.allExercises;
    } else if (widget.title.contains('HIntensity')) {
      allExercises = HIntensity.allExercises;
    } else if (widget.title.contains('StrengthTraining')) {
      allExercises = StrengthTraining.allExercises;
    } else {
      allExercises = Challenge.allExercises;
    }

    futureExercises = ApiService.fetchExercise();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(
        heading: widget.title,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenWidth / 1.2,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MColors.primaryColor,
              ),
              child: Center(
                child: Text(
                  allExercises[_currentIndex],
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: screenWidth - 40,
              height: screenHeight / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MColors.light,
              ),
              child: FutureBuilder<List<Exercise>>(
                future: futureExercises,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: MColors.primaryColor));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No exercises found'));
                  } else {
                    Exercise exercise = snapshot.data!.first;
                    return exercise.gifUrl != null
                        ? Image.network(exercise.gifUrl!)
                        : const Text('No GIF available');
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () {
                    if (_currentIndex > 0) {
                      setState(() {
                        _currentIndex--;
                      });
                    }
                  },
                  child: const Icon(
                    Iconsax.arrow_circle_left,
                    size: 50,
                  ),
                ),
                InkWell(
                    onTap: () {
                      _onTap();
                    },
                    child: const Icon(Iconsax.arrow_circle_right, size: 50)),
              ],
            ),
            buildTimer(),
            buildButton(),
            const SizedBox(
              height: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = seconds == maxSeconds || seconds == 0;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                icon:
                    isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                onClicked: () {
                  if (isRunning) {
                    stopTimer(reset: false);
                  } else {
                    startTimer(reset: false);
                  }
                },
              ),
              const SizedBox(width: 20),
              ButtonWidget(
                icon: Icons.stop_rounded,
                onClicked: () {
                  stopTimer();
                },
              ),
            ],
          )
        : ButtonWidget(
            icon: Icons.play_arrow_rounded,
            onClicked: () {
              startTimer();
            });
  }

  Widget buildTimer() {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(fit: StackFit.expand, children: [
        CircularProgressIndicator(
          value: seconds / maxSeconds,
          strokeWidth: 8,
          valueColor: const AlwaysStoppedAnimation(MColors.primaryColor),
          backgroundColor: const Color(0xff282A2C),
        ),
        Center(
          child: buildTime(),
        ),
      ]),
    );
  }

  Widget buildTime() {
    return Text(
      '$seconds',
      style: const TextStyle(
        fontFamily: 'poppins',
        fontWeight: FontWeight.bold,
        fontSize: 75,
        color: MColors.primaryColor,
      ),
    );
  }
}
