import 'package:bodFit_group5_summative/common/widgets/custom_shapes/circular_image.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:flutter/material.dart';

class MUserProfileTile extends StatelessWidget {
  const MUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const MCircularImage(
        image: MImages.userKanayo,
        width: 55,
        height: 100,
        padding: 0,
        backgroundColor: MColors.primaryColor,
        
        
      ),
      title: Text('Kanayo O. Kanayo',
          style: Theme.of(context).textTheme.headlineSmall!),
      subtitle: Text('+234-815-5014-578',
          style: Theme.of(context).textTheme.bodyMedium!),
      trailing: ElevatedButton(onPressed: onPressed, child: const Text('Edit')),
    );
  }
}