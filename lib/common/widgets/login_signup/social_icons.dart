import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MSocialIcons extends StatelessWidget {
  const MSocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: MSizes.iconMd,
              height: MSizes.iconMd,
              image: AssetImage(MImages.google),
            ),
          ),
        ),
        const SizedBox(width: MSizes.spaceBtwItms),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: MSizes.iconMd,
              height: MSizes.iconMd,
              image: AssetImage(MImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
