import 'package:bodFit_group5_summative/utils/helpers/helpers_utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/colors.dart';

class MShimmerEffect extends StatelessWidget {
  const MShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius=15,
    this.color,
  });

  final double width,height,radius;
  final Color?color;

  @override
  Widget build(BuildContext context) {
    final dark =MHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark?Colors.grey[850]!:Colors.grey[300]!,
      highlightColor: dark?Colors.grey[700]!:Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color??(dark?Colors.grey:MColors.light),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
