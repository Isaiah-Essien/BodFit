import 'package:bodFit_group5_summative/features/authentication/screens/login/login.dart';
import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  ///Called from main.dart
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///Function to show Relevant Screen
  screenRedirect() async {
    ///Local Storage
    if (kDebugMode) {
      print('==============GET STORAGE=============');
      print(deviceStorage.read('isFirstTime'));
    }
    
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /*-----------Email and Password sign-in--------*/

  ///[Email Authentication]-Signin
  ///[Email Authentication]-Register
  ///[Email Authentication]-Register
  ///[reauthenticate Users]-Reauthenticate User
  ///[Email Authentication]-Mail Verification
  ///[Email Authentication]-Forget Password

  /*------------federated identity and Social Signin---------------*/
  ///[Google Authentication]-GOOGLE
  ///[facebook Authentication]-FACEBOOK

  /*--------------./end Federated Identity and social signin-----------------*/
  ///[LogoutUser]- for any authentication
  ///[DeleteUser]- Remove user Auth and Firebase account
}
