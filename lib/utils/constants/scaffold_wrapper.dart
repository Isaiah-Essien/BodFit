import 'package:bodFit_group5_summative/utils/constants/navbar.dart';
import 'package:flutter/material.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final int currentIndex;
  final Function(int) onTap;

  const ScaffoldWithNavBar({
    super.key,
    required this.body,
    this.appBar,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}
