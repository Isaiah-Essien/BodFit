import 'package:bodFit_group5_summative/features/workout/screens/movements/movements.dart';
import 'package:bodFit_group5_summative/features/workout/screens/options/routine_plan.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Hiit extends StatelessWidget {
  const Hiit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: MTexts.highIntensity,
        page: '/',
      ),
      body: const HighIntensity(
        selectedWorkout: MTexts.highIntensity,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: const Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: MTexts.highIntensity,
            ),
            // () => const Test(),
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

class WeightLossPlan extends StatelessWidget {
  const WeightLossPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: MTexts.weightLoss,
        page: '/',
      ),
      body: const HighIntensity(
        selectedWorkout: MTexts.weightLoss,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: const Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: MTexts.weightLoss,
            ),
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

class RecoveryPlan extends StatelessWidget {
  const RecoveryPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: MTexts.recovery,
        page: '/',
      ),
      body: const HighIntensity(
        selectedWorkout: MTexts.recovery,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: const Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: MTexts.recovery,
            ),
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

class StrengthPlan extends StatelessWidget {
  const StrengthPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: MTexts.strength,
        page: '/',
      ),
      body: const HighIntensity(
        selectedWorkout: MTexts.strength,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: const Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: MTexts.strength,
            ),
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

class ThirtyDayPlan extends StatelessWidget {
  const ThirtyDayPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: MTexts.daysChallenge,
        page: '/',
      ),
      body: const HighIntensity(
        selectedWorkout: MTexts.daysChallenge,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: const Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: MTexts.daysChallenge,
            ),
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
