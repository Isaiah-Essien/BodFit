import 'package:bodFit_group5_summative/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:bodFit_group5_summative/features/authentication/screens/signup/signup.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MloginForm extends StatelessWidget {
  const MloginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MSizes.spaceBtwSects),
        child: Column(
          children: [
            ///Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_left),
                labelText: MTexts.email,
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwinputfield),

            ///Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: MTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwinputfield / 2),

            ///Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember me
                Row(
                  children: [
                    ///Checkbox

                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: MColors.primaryColor,
                    ),
                    const Text(
                      MTexts.rememberMe,
                      style: TextStyle(color: MColors.primaryColor),
                    ),
                  ],
                ),

                ///Forget password
                TextButton(
                    onPressed: () => Get.to(() => const Forgetpassword()), child: const Text(MTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: MSizes.spaceBtwSects),

            ///Sign In button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(MTexts.logIn))),
            const SizedBox(height: MSizes.spaceBtwItms),

            ///Create account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()), child: const Text(MTexts.createAccount))),
            
          ],
        ),
      ),
    );
  }
}
