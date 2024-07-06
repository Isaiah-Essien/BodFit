import 'package:bodFit_group5_summative/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app.dart';

Future<void> main() async {

  //Todo: Add Widgets Binding
  //Todo: Init Local Storage
  //Todo: Init Payment method
  //Todo: Await Native Splash
  //Todo:Init Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  //   (FirebaseApp value)=>Get.put(AuthenticationRepository()),
  // );
  //Todo:Init Authentication
  runApp(const App());
}
