import 'package:bodFit_group5_summative/common/widgets/custom_shapes/circular_image.dart';
import 'package:bodFit_group5_summative/features/personalisation/controllers/users_controllers.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:flutter/material.dart';

//--------------This class is an extracted widget for the user profile-----------//
class MUserProfileTile extends StatelessWidget {
  const MUserProfileTile({
    super.key,
    required this.onPressed,
    required this.imageUrl, // Add this parameter
  });

  final VoidCallback onPressed;
  final String imageUrl; // Add this parameter

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: MCircularImage(
        image: imageUrl, // Use the passed image URL

        padding: 0,

        isNetworkImage: imageUrl.isNotEmpty, // Determine if it's a network image
      ),
      title: Text(controller.user.value.fullName,
          style: Theme.of(context).textTheme.headlineSmall!),
      subtitle: Text(controller.user.value.phoneNumber,
          style: Theme.of(context).textTheme.bodyMedium!),
      trailing: ElevatedButton(onPressed: onPressed, child: const Text('Edit')),
    );
  }
}
