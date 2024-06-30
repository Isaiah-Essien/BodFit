import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/onboarding.dart';
import 'package:bodFit_group5_summative/utils/theme/theme.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the publishable key
  Stripe.publishableKey =
      'pk_test_51PXDHqRohmxj8iDDXuGOSt9lsEd1FdOg8P87IoMHX3JW5E7ZlqFVITbgSsGYftdaRtbHUZNl3JQ4lphSkCH8b8q000m3YNQhyL';

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

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
