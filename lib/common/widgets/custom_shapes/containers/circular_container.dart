import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MCircularContainer extends StatelessWidget {
  const MCircularContainer({
    super.key,
    this.child,
    this.width=56,
    this.height=56,
    this.radius=100,
    this.padding=0,
    this.backgroundColor = MColors.light,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final double padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
