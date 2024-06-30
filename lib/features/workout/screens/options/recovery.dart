import 'package:bodFit_group5_summative/utils/constants/exercise.dart';
import 'package:flutter/cupertino.dart';

class Recovery extends StatefulWidget {
  const Recovery({super.key});

  @override
  State<Recovery> createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Warm Up - 3 mins',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                fontFamily: 'poppins',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: HIntensity.warmUp.length,
              itemBuilder: (context, index) {
                return item(index, HIntensity.warmUp, HIntensity.warmUpIcons,
                    0xcf29A0E3);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Workout Circuit - 9 mins x 3',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                fontFamily: 'poppins',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: HIntensity.circuit.length,
              itemBuilder: (context, index) {
                return item(index, HIntensity.circuit, HIntensity.workoutIcons,
                    0xdf392AE5);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Cool Down - 3 mins',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                fontFamily: 'poppins',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: HIntensity.coolDown.length,
              itemBuilder: (context, index) {
                return item(index, HIntensity.coolDown, HIntensity.coolIcons,
                    0xbf3A8ADA);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget item(int index, List texts, List icons, int color) {
    return AnimatedContainer(
      height: 55,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 150)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${index + 1}. ${texts[index]}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            icons[index],
          ),
        ],
      ),
    );
  }
}
