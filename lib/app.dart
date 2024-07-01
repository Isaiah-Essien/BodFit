import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/onboarding.dart';
import 'package:bodFit_group5_summative/utils/theme/theme.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
