import 'package:bodFit_group5_summative/features/Community/community.dart';
import 'package:bodFit_group5_summative/features/Dashboard/dashboard_page.dart';
import 'package:bodFit_group5_summative/features/Nutrition/food.dart';
import 'package:bodFit_group5_summative/features/Nutrition/mealplans.dart';
import 'package:bodFit_group5_summative/features/Subscription/subscription.dart';
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
      home: const MealPlansPage(), // Temporarily set sub page  as the initial screen
    );
  }
}
