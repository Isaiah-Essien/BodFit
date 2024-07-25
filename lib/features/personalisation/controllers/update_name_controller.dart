import 'package:bodFit_group5_summative/data/repositories/user/user_repository.dart';
import 'package:bodFit_group5_summative/features/personalisation/controllers/users_controllers.dart';
import 'package:bodFit_group5_summative/features/personalisation/screens/profile/profile.dart';
import 'package:bodFit_group5_summative/utils/device/network_manager.dart';
import 'package:bodFit_group5_summative/utils/popups/full_screen_loader.dart';
import 'package:bodFit_group5_summative/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constants/images_string.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance =>Get.find();

  final firstName=TextEditingController();
  final lastName=TextEditingController();
  final userController =UserController.instance;
  final userRepository=Get.put(UserRepository());
  GlobalKey<FormState>updateUserNameFormkey=GlobalKey<FormState>();

  ///Init user Data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  ///Fetch User Record
  Future<void>initializeNames()async{
    firstName.text=userController.user.value.firstName;
    lastName.text=userController.user.value.lastName;
  }

  Future<void>updateUserName()async {
    try {
      //Start Loading
      MFullScreenloader.openLoadingDialog(
          'BoDFiT is updating your information...', MImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenloader.stopLoading();
        return;
      }

      //Form Validation
      if (!updateUserNameFormkey.currentState!.validate()) {
        MFullScreenloader.stopLoading();
        return;
      }

      //Update User's First and Lastname in the Firebase firestore
      Map<String, dynamic>name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //Update The Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loader
      MFullScreenloader.stopLoading();

      //Show Success Message
      MLoaders.successSnackBar(
          title: 'Congratulations!', message: 'Your nme has been updated.');

      //Move to Previous Screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      MFullScreenloader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh, Snap!', message: e.toString());
    }
  }
}