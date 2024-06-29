import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:flutter/material.dart';

class MAuthLogo extends StatelessWidget {
  const MAuthLogo({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        height: 200,
        image: AssetImage(dark ? MImages.lightLogo : MImages.darkLogo),
      ),
    );
  }
}
