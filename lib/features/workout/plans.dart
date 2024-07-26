import 'package:bodFit_group5_summative/features/workout/screens/movements/movements.dart';
import 'package:bodFit_group5_summative/features/workout/screens/options/new_plan.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CardioPlan extends StatelessWidget {
  const CardioPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: "Cardio",
        page: '/',
      ),
      body: const PlanOverview(
        selectedWorkout: MTexts.cardio,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: const Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: MTexts.cardio,
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

class ShouldersPlan extends StatelessWidget {
  const ShouldersPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: MTexts.shoulders,
        page: '/',
      ),
      body: const PlanOverview(
        selectedWorkout: MTexts.shoulders,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: const Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: MTexts.shoulders,
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

class LowerLegsPlan extends StatelessWidget {
  const LowerLegsPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: MTexts.lowerLegs,
        page: '/',
      ),
      body: const PlanOverview(
        selectedWorkout: MTexts.lowerLegs,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: const Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: MTexts.lowerLegs,
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

class BackPlan extends StatelessWidget {
  const BackPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: MTexts.back,
        page: '/',
      ),
      body: const PlanOverview(
        selectedWorkout: MTexts.back,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: const Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: MTexts.back,
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

class ChestPlan extends StatelessWidget {
  const ChestPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: MTexts.chest,
        page: '/',
      ),
      body: const PlanOverview(
        selectedWorkout: MTexts.chest,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: const Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: MTexts.chest,
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
