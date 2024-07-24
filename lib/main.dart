import 'package:bodFit_group5_summative/data/repositories/authentication/auth_repository.dart';
import 'package:bodFit_group5_summative/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

Future<void> main() async {
  // Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Init Local Storage
  await GetStorage.init();

  //Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Init Firebase and Authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthRepository()),
  );

// Load all the material designs, themes, modes, bindings
  runApp(const App());
}
