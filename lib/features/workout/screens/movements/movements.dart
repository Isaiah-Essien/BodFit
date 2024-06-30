import 'dart:async';

import 'package:bodFit_group5_summative/features/workout/screens/movements/build_button.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Movements extends StatefulWidget {
  const Movements({super.key});

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

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const MyAppBar(
        heading: '500-Calorie Burn',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 230,
              height: 49,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MColors.primaryColor,
              ),
              child: const Center(
                child: Text(
                  'test',
                  style: TextStyle(
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
                color: Colors.grey,
              ),
              child: const Icon(
                Iconsax.play_circle5,
                size: 100,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Iconsax.arrow_circle_left,
                  size: 50,
                ),
                Icon(Iconsax.arrow_circle_right, size: 50),
              ],
            ),
            buildTimer(),
            buildButton(),
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
