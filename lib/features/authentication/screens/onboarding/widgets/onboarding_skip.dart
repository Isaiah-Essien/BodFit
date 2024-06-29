import 'package:bodFit_group5_summative/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  // ignore: use_super_parameters
  const OnBoardingSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MDeviceUtils.getAppBarHeight(),
      right: MSizes.defaultSpace,
      child: TextButton(
        
        onPressed: () {
          // Calling the skipPage method
          OnBoardingController.instance.skipPage();
        },
        child: const Text('Skip',
          style: TextStyle(color: MColors.primaryColor),
        ),
        
        
      ),
    );
  }
}
