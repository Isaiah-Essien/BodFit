import 'package:bodFit_group5_summative/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:bodFit_group5_summative/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:bodFit_group5_summative/features/Community/community.dart';
import 'package:bodFit_group5_summative/features/Subscription/subscription.dart';
import 'package:bodFit_group5_summative/features/personalisation/screens/profile/profile.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/section_heading.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

//This class is the  Settings page routed to the Bottom navigation//
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const MyAppBar(heading: MTexts.accountTitle1,showAvatar: false,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///User profile
            MUserProfileTile(onPressed: ()=>Get.to(()=> const ProfileScreen())),
            const SizedBox(height: MSizes.spaceBtwSects/3),

            ///Body
            Padding(
              padding: const EdgeInsets.all(MSizes.defaultSpace),
              child: Column(
                children: [
                  ///Account Settings
                  const MSectionHeading(title: 'Account Settings'),
                  const SizedBox(height: MSizes.spaceBtwItms),

                  MSettingMenuTile(icon: Iconsax.location, title: 'Location', subTitle: 'Set Location',trailing: const Icon(Icons.arrow_forward_ios),onTap: (){},),
                  MSettingMenuTile(icon: Iconsax.wallet, title: 'Subscribe to Premium', subTitle: 'Select your prefered payment method',trailing: const Icon(Icons.arrow_forward_ios),onTap: ()=>Get.to(()=>const SubscriptionPage()),),
                  MSettingMenuTile(icon: Iconsax.health1, title: 'Dietary preference', subTitle: 'Set your dietary needs',trailing: const Icon(Icons.arrow_forward_ios),onTap: ()=>Get.to(()=>const ProfileScreen()),),
                  MSettingMenuTile(icon: Iconsax.health5, title: 'Allergien Information', subTitle: 'Set your Allergies',trailing: const Icon(Icons.arrow_forward_ios),onTap: () => Get.to(() => const ProfileScreen()),),
                  MSettingMenuTile(icon: Iconsax.health4, title: 'Health Concerns', subTitle: 'Set your Health concerns',trailing: const Icon(Icons.arrow_forward_ios),onTap: () => Get.to(() => const ProfileScreen()),),
                  MSettingMenuTile(icon: Iconsax.text, title: 'Feedback', subTitle: 'Tell us how you feel about BODFiT',trailing: const Icon(Icons.arrow_forward_ios),onTap: ()=>Get.to(()=> const FAQPage())),
                  MSettingMenuTile(icon: Iconsax.logout, title: 'Logout', subTitle: 'Sign out',trailing: const Icon(Icons.arrow_forward_ios),onTap: (){},),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
