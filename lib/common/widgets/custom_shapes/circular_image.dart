import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/helpers/helpers_utils.dart';
import 'package:flutter/material.dart';

class MCircularImage extends StatelessWidget {
  const MCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.padding = MSizes.sm,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (MHelperFunctions.isDarkMode(context)
                // ignore: use_full_hex_values_for_flutter_colors
                ? const Color(121212)
                : MColors.light),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: ClipOval(
          child: SizedBox.fromSize(
            size: const Size(180, 180),
            child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(image)
                  : AssetImage(image) as ImageProvider,
              color: overlayColor,
            ),
          ),
        ),
      ),
    );
  }
}
