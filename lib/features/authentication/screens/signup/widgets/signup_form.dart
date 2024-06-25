import 'package:bodFit_group5_summative/features/authentication/screens/login/login.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: MSizes.spaceBtwinputfield),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwinputfield),

          ///Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: MTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: MSizes.spaceBtwinputfield),

          ///Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: MTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: MSizes.spaceBtwinputfield),

          ///Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: MTexts.phoneNumber, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: MSizes.spaceBtwinputfield),

          ///Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: MTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwSects),

          ///Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(MTexts.createAccount),
            ),
          ),
          Row(
            children: [
              const Text(MTexts.alreadyHaveAnAccount),
              const SizedBox(width: MSizes.spaceBtwItms),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    MTexts.logIn,
                    style: TextStyle(color: MColors.primaryColor),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
