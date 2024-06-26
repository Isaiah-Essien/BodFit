import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/onboarding.dart';
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
<<<<<<< HEAD
      home:
          const OnBoardingScreen(), // Temporarily set DashboardPage as the initial screen
=======
      home: const OnBoardingScreen(), // Temporarily set DashboardPage as the initial screen
>>>>>>> c689c9a104733bde5b91e2268dc8d51a2bdbc738
    );
  }
}
