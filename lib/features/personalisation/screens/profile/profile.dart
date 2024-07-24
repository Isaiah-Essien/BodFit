import 'package:bodFit_group5_summative/common/widgets/custom_shapes/circular_image.dart';
import 'package:bodFit_group5_summative/common/widgets/loaders/shimmer.dart';
import 'package:bodFit_group5_summative/features/authentication/screens/signup/signup.dart';
import 'package:bodFit_group5_summative/features/personalisation/screens/profile/widgets/profile_menu.dart';
import 'package:bodFit_group5_summative/features/profile/change_name.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:bodFit_group5_summative/utils/constants/section_heading.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/users_controllers.dart';

//--------------The main Profile screen that is routed to the Bottom navigation-------//
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return Scaffold(
      appBar: const MyAppBar(heading: 'Profile',),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage=controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty?networkImage:MImages.userKanayo;
                      return controller.imageUploading.value
                          ? const MShimmerEffect(width: 80, height: 80,radius: 80)
                          :MCircularImage(image: image,width: 80,height: 80,isNetworkImage: networkImage.isNotEmpty);
                      }),
                    TextButton(
                        onPressed: () =>controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              ///Details-----------------///
              const SizedBox(height: MSizes.spaceBtwItms / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItms),

              ///Heading Profile Information
              const MSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItms/2),

              MProfileMenu(onPressed: ()=>Get.to(()=>const ChangeName()), title: 'Name', value: controller.user.value.fullName,),
              MProfileMenu(onPressed: () {}, title: 'Username', value: controller.user.value.username,),

              const SizedBox(height: MSizes.spaceBtwItms / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItms),

              ///Heading Personal Information
              const MSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItms),

              MProfileMenu(onPressed: () {}, title: 'User ID', value: controller.user.value.id,icon: Iconsax.copy,),
              MProfileMenu(onPressed: () {}, title: 'Gender', value: 'Non-Binary'),
              MProfileMenu(onPressed: () {}, title: 'Email', value: controller.user.value.email,),
              MProfileMenu(onPressed: () {}, title: 'Phone Number', value: controller.user.value.phoneNumber,),
              MProfileMenu(onPressed: () {}, title: 'Date of Birth', value: 'June 12th, 1956',),

              const SizedBox(height: MSizes.spaceBtwItms / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItms),

              ///Health Personal Information
              const MSectionHeading(
                  title: 'Health Information', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItms),

              MProfileMenu(onPressed: () {}, title: 'Weight', value: '90Kg',),
              MProfileMenu(onPressed: () {}, title: 'Fitness Goal', value: 'Lose weight',),
              MProfileMenu(onPressed: () {}, title: 'Allergen Information', value: 'Lactose Intolerant',),
              MProfileMenu(onPressed: () {}, title: 'Dietary preference', value: 'Low Sugar Diets',),
              MProfileMenu(onPressed: () {}, title: 'Health Concerns', value: 'Obesity',),

              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItms,),

              ///Delete Account
              Center(
                child: TextButton(
                  onPressed: ()=> controller.deleteAccountWarningPopup(),
                  child: const Text('Delete Account', style: TextStyle(color: Colors.red),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

