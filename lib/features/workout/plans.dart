import 'package:bodFit_group5_summative/features/workout/screens/movements/movements.dart';
import 'package:bodFit_group5_summative/features/workout/screens/options/high_intensity.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
            () => const Movements(
              title: 'heading',
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

class WeightLossPlan extends StatelessWidget {
  const WeightLossPlan({super.key});

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
            () => const Movements(title: 'heading'),
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
        heading: 'High Intensity',
        page: '/',
      ),
      body: HighIntensity(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        hoverColor: Color(0xff29A0E3),
        onPressed: () {
          Get.to(
            () => const Movements(
              title: 'heading',
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

class CalisthenicsPlan extends StatelessWidget {
  const CalisthenicsPlan({super.key});

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
            () => const Movements(
              title: 'heading',
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
