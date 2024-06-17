import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:bodFit_group5_summative/utils/helpers/helpers_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal scrollable pages
          PageView(
            children: [
              Column(
                children: [
                  Image(
                    width: MHelperFunctions.screenWidth()*0.8,
                    height: MHelperFunctions.screenHeight()*0.6,
                    image: const AssetImage(MImages.onboardingImage2),
                  ),
                  Text(
                    MTexts.onboardingTitle1,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: MSizes.spaceBtwItms),
                  Text(
                    MTexts.onboardingSubTitle1,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          )
          ///Skip Button
          
          ///Dot Navigation SmoothPageIndicator
          
          ///Circular button
        ],
      ),
    );
  }
}