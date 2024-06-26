import 'package:bodFit_group5_summative/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:bodFit_group5_summative/utils/helpers/helpers_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Image
              Center(
                child: Image(
                    image: const AssetImage(MImages.thinking),
                    width: MHelperFunctions.screenWidth() * 0.6),
              ),
              const SizedBox(height: MSizes.spaceBtwSects/2),
              ///Headings
              Text(MTexts.forgtPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: MSizes.spaceBtwItms),
              Text(MTexts.forgtPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MSizes.spaceBtwSects*2),
        
              ///Text Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: MTexts.email,prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSects),
        
              ///Submit Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>Get.off(()=>const ResetPassword()), child: const Text(MTexts.submit))),
            ],
          ),
        ),
      ),
    );
  }
}