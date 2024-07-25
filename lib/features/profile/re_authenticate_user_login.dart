import 'package:bodFit_group5_summative/features/personalisation/controllers/users_controllers.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:bodFit_group5_summative/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/sizes.dart';

class ReAuthenticateUserLogin extends StatelessWidget {
  const ReAuthenticateUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return  Scaffold(
      appBar: const MyAppBar(heading: 'Re-Authenticate Account',),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: MValidator.validateEmail,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: MTexts.email),
                ),
                const SizedBox(height: MSizes.spaceBtwinputfield,),

                ///Password
                Obx(
                    ()=> TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value)=>MValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                        labelText: MTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value,
                          icon: const Icon(Iconsax.eye_slash),
                        )
                      ),
                    )
                ),
                const SizedBox(height: MSizes.spaceBtwSects,),

                ///Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=>controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text('Verify'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
