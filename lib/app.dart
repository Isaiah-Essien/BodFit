import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/theme/theme.dart';
// ignore: depend_on_referenced_packages
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
      ///Loader of Circular Progress indicator while Authetication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: MColors.primaryColor,body:Center(child: CircularProgressIndicator(color: MColors.light))),
    );
  }
}
