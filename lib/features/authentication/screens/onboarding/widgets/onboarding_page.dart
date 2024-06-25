import 'package:bodFit_group5_summative/features/authentication/screens/signup/signup.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/helpers/helpers_utils.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: MHelperFunctions.screenWidth() * 0.7,
            height: MHelperFunctions.screenHeight() * 0.5,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: MSizes.spaceBtwItms),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: MSizes.spaceBtwItms),
          
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MColors.primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 15.0,
              ),
              textStyle: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}

