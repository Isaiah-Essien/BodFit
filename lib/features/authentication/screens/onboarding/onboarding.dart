import 'package:bodFit_group5_summative/features/authentication/controllers/onboarding/onboarding_controller.dart';
// Importing OnBoardingController from the authentication controllers package
import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/widgets/onboardig_next_button.dart';
// Importing OnBoardingNextButton widget
import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
// Importing OnBoardingDotNavigation widget
import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
// Importing OnBoardingPage widget
import 'package:bodFit_group5_summative/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
// Importing OnBoardingSkip widget
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
// Importing image constants
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
// Importing text constants
import 'package:flutter/material.dart';
// Importing Flutter's material package for UI components
import 'package:get/get.dart';
// Importing GetX package for state management

// OnBoardingScreen widget, which is stateless
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController()); // Initializing OnBoardingController using GetX

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController, // Controller for PageView
            onPageChanged: controller.updatePageIndicator, // Callback for page change
            children: const [
              OnBoardingPage(
                image: MImages.onboardingImage1,
                title: MTexts.onboardingTitle1,
                subTitle: MTexts.onboardingSubTitle1,
              ),
              OnBoardingPage(
                image: MImages.onboardingImage2,
                title: MTexts.onboardingTitle2,
                subTitle: MTexts.onboardingSubTitle2,
              ),
              OnBoardingPage(
                image: MImages.onboardingImage3,
                title: MTexts.onboardingTitle3,
                subTitle: MTexts.onboardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
