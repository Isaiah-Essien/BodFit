import 'package:bodFit_group5_summative/common/widgets/loaders/shimmer.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:bodFit_group5_summative/utils/helpers/helpers_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//This class creates the circular shape around profile images and account setting images
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ?CachedNetworkImage(
                fit: fit,
                color: overlayColor,
                imageUrl: image,
                progressIndicatorBuilder: (context,url,downloadProgress)=>const MShimmerEffect(width: 55, height: 55),
                errorWidget: (context,url,error)=>const Icon(Icons.error),
              )
              :Image(
                fit: fit,
                image: AssetImage(image),
                color: overlayColor,
              ),
        ),
      ),
    );
  }
}
