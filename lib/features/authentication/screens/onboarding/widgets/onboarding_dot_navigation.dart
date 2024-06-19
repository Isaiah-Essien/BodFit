import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/device/device_utils.dart';
import 'package:bodFit_group5_summative/utils/helpers/helpers_utils.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: MDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: MSizes.defaultSpace,
      child: SmoothPageIndicator(
          controller: PageController(),
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? MColors.light : MColors.dark,
              dotHeight: 6)),
    );
  }
}
