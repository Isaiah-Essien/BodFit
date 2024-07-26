import 'package:bodFit_group5_summative/common/widgets/loaders/shimmer.dart';
import 'package:bodFit_group5_summative/features/personalisation/controllers/users_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({
    super.key,
    required this.darkMode,
  });

  final bool darkMode;

  // Define the color using the hex code


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Row(
      children: [
        Obx(
              () {
            final networkImage = controller.user.value.profilePicture;
            final imageWidget = networkImage.isNotEmpty
                ? CircleAvatar(
              backgroundImage: NetworkImage(networkImage),
              radius: 20,
              backgroundColor: MColors.primaryColor, // Use the defined primary color
            )
                : const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
              radius: 20,
              backgroundColor: MColors.primaryColor, // Use the defined primary color
            );
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: MColors.primaryColor, // Use the defined primary color
                  width: 2,
                ),
              ),
              child: imageWidget,
            );
          },
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: darkMode ? Colors.white : Colors.black),
            ),
            Obx(
                  () {
                if (controller.profileLoading.value) {
                  // Display a shimmer loader while user profile is being loaded
                  return const MShimmerEffect(width: 80, height: 15);
                } else {
                  return Text(
                    controller.user.value.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: darkMode ? Colors.white : Colors.black),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
