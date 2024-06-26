import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:bodFit_group5_summative/utils/helpers/helpers_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed:()=> Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Center(
                child: Image(
                    image: const AssetImage(MImages.reset),
                    width: MHelperFunctions.screenWidth() * 0.6),
              ),
              const SizedBox(height: MSizes.spaceBtwSects/2),

              Text(
                MTexts.changeYourpasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBtwItms,
              ),

              Text(
                MTexts.changeYourpasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBtwSects,
              ),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text(MTexts.done))),
              const SizedBox(height: MSizes.spaceBtwItms),

              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: const Text(MTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}