import 'package:bodFit_group5_summative/data/repositories/authentication/auth_repository.dart';
import 'package:bodFit_group5_summative/data/repositories/user/user_repository.dart';
import 'package:bodFit_group5_summative/features/authentication/screens/login/login.dart';
import 'package:bodFit_group5_summative/features/profile/re_authenticate_user_login.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/device/network_manager.dart';
import 'package:bodFit_group5_summative/utils/popups/full_screen_loader.dart';
import 'package:bodFit_group5_summative/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';

class UserController extends GetxController{
  static UserController get instance =>Get.find();

  final profileLoading=false.obs;
  final imageUploading=false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository=Get.put(UserRepository());
  final verifyEmail=TextEditingController();
  final verifyPassword=TextEditingController();
  final hidePassword=false.obs;
  GlobalKey<FormState>reAuthFormKey=GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///Fetch user record
  Future<void>fetchUserRecord()async{
    try{
      profileLoading.value=true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch(e){
      user(UserModel.empty());
    }finally{
      profileLoading.value=false;
    }
  }

  ///Save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential?userCredentials)async{
    try{
      //Fetch Update RX user and then check if the user data is already stored. If mot, store the data
      await fetchUserRecord();

      //If no record already stored
      if(user.value.id.isEmpty){
        if(userCredentials!=null){
          //convert Name to First and Last Name
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName??'');
          final username=UserModel.generatedUsername(userCredentials.user!.displayName??'');

          //Map the data
          final user=UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length>1?nameParts.sublist(1).join(' '):'',
              username: username,
              email: userCredentials.user!.email??'',
              phoneNumber: userCredentials.user!.phoneNumber??'',
              profilePicture: userCredentials.user!.photoURL??''
          );

          //Save User data
          await userRepository.saveUserRecord(user);
        }
      }
    }catch(e){
      MLoaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information. You can re-save your data in your profile'
      );
    }
  }
  ///Delete Account Warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(MSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account? This action is not reversible and all your data will be removed permanently',
      confirm: ElevatedButton(
        onPressed: ()async=>deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: MSizes.lg),child: Text('Delete')),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: ()=>Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }
  ///Delete User account
  void deleteUserAccount()async{
    try{
      MFullScreenloader.openLoadingDialog('Processing...', MImages.docerAnimation);

      ///First re-authenticate user
      final auth=AuthRepository.instance;
      final provider=auth.authUser!.providerData.map((e)=>e.providerId).first;
      if(provider.isNotEmpty){
        //re verify email
        if(provider=='google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          MFullScreenloader.stopLoading();
          Get.offAll(()=>const LoginScreen());
        }else if(provider=='password'){
         MFullScreenloader.stopLoading();
         Get.to(()=>const ReAuthenticateUserLogin());
        }
      }
    }catch(e){
      MFullScreenloader.stopLoading();
      MLoaders.warningSnackBar(title: 'Oh, Snap!',message: e.toString());
    }
  }
  //-----------Re Authenticate before deleting---------//
  Future<void>reAuthenticateEmailAndPasswordUser()async{
    try{
      MFullScreenloader.openLoadingDialog('Processing', MImages.docerAnimation);

      //Check Internet
      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        MFullScreenloader.stopLoading();
        return;
      }

      await AuthRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthRepository.instance.deleteAccount();
      MFullScreenloader.stopLoading();
      Get.offAll(()=>const LoginScreen());
    }catch(e){
      MFullScreenloader.stopLoading();
      MLoaders.warningSnackBar(title: 'Oh, Snap!',message: e.toString());
    }
  }

  ///Upload Profile Image
  uploadUserProfilePicture()async{
    try{
      final image=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
      if(image != null){
        imageUploading.value=true;
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        //Update user Image Record
        Map<String,dynamic>json={'ProfilePicture':imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture=imageUrl;
        user.refresh();
        MLoaders.successSnackBar(title: 'Congratulations!',message: 'Your Profile Picture has been updated');
      }
    }catch(e){
      MLoaders.errorSnackBar(title: 'Oh,Snap!',message: 'Something went wrong: $e');
    }finally{
      imageUploading.value=false;
    }
  }
}