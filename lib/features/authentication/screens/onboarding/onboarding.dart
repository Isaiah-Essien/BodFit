import 'package:bodFit_group5_summative/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/widgets/onboardig_next_button.dart';
import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    
    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: MImages.onboardingImage3,
                title: MTexts.onboardingTitle1,
                subTitle: MTexts.onboardingSubTitle1,
              ),
              OnBoardingPage(
                image: MImages.onboardingImage2,
                title: MTexts.onboardingTitle2,
                subTitle: MTexts.onboardingSubTitle2,
              ),
              OnBoardingPage(
                image: MImages.onboardingImage1,
                title: MTexts.onboardingTitle3,
                subTitle: MTexts.onboardingSubTitle3,
              ),
            ],
          ),

          ///Skip Button
          const OnBoardingSkip(),

          ///Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          ///Circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
