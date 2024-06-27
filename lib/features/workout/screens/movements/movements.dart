import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Movements extends StatefulWidget {
  const Movements({super.key});

  @override
  State<Movements> createState() => _MovementsState();
}

class _MovementsState extends State<Movements> {
  double screenHeight = 0;
  double screenWidth = 0;
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(
        heading: '500-Calorie Burn',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 230,
              height: 49,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MColors.primaryColor,
              ),
              child: Center(
                child: Text(
                  'test',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: screenWidth - 40,
              height: screenHeight / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Icon(
                Iconsax.play_circle5,
                size: 100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Iconsax.arrow_circle_left,
                  size: 50,
                ),
                Icon(Iconsax.arrow_circle_right, size: 50),
              ],
            ),
            Text(
              '30',
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                fontSize: 75,
              ),
            ),
            Icon(
              Iconsax.play_circle,
              size: 80,
              color: MColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
