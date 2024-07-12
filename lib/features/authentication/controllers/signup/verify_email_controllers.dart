import 'dart:async';

import 'package:bodFit_group5_summative/common/widgets/success_screen/success_screen.dart';
import 'package:bodFit_group5_summative/data/repositories/authentication/auth_repository.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:bodFit_group5_summative/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailControllers extends GetxController {
  static VerifyEmailControllers get instace => Get.find();

  /// Sends email whenever verify email screen appears and sets a timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///Send email Verification link
  sendEmailVerification() async {
    try {
      await AuthRepository.instance.sendEmailVerification();
      MLoaders.successSnackBar(
          title: 'Email sent.',
          message: 'Please check your inbox and verify your email');
    } catch (e) {
      MLoaders.errorSnackBar(title: 'O! Snap!', message: e.toString());
    }
  }

  ///Timer to auto redirect
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccesScreen(
            image: MImages.succesScreen,
            title: MTexts.yourAccountCreatedTitle,
            subTitle: MTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  ///Manually check email status
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser!=null&&currentUser.emailVerified){
      Get.off(
        () => SuccesScreen(
          image: MImages.succesScreen,
          title: MTexts.yourAccountCreatedTitle,
          subTitle: MTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
