import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

class WeightLoss extends StatefulWidget {
  const WeightLoss({super.key});

  @override
  State<WeightLoss> createState() => _WeightLossState();
}

class _WeightLossState extends State<WeightLoss> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;

  List<String> warmUp = [
    "Jumping Jacks",
    "Arm Circles",
    "High Knees",
  ];

  List<String> circuit = [
    "Push-Ups",
    "Mountain Climbers",
    "Squats",
    "Plank",
    "Jump squats",
    "Bicycle Crunches",
    "Lunges",
    "Tricep Dips",
    "High Knees",
    "Burpees",
  ];

  List<String> coolDown = [
    "Standing Quad stretch",
    "Hamstring Stretch",
    "Shoulder Stretch",
    "Child's Pose",
  ];

  List<IconData> warmUpIcons = [
    Iconsax.trend_up,
    Iconsax.trend_up,
    Iconsax.trend_up,
  ];

  List<IconData> workout_icons = [
    Iconsax.flash,
    Iconsax.flash,
    Iconsax.flash,
    Iconsax.flash,
    Iconsax.flash,
    Iconsax.flash,
    Iconsax.flash,
    Iconsax.flash,
    Iconsax.flash,
    Iconsax.flash,
    Iconsax.flash,
  ];

  List<IconData> cool_icons = [
    Iconsax.trend_down,
    Iconsax.trend_down,
    Iconsax.trend_down,
    Iconsax.trend_down,
  ];

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
              itemCount: warmUp.length,
              itemBuilder: (context, index) {
                return item(index, warmUp, warmUpIcons, 0xcf29A0E3);
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
              itemCount: circuit.length,
              itemBuilder: (context, index) {
                return item(index, circuit, workout_icons, 0xdf392AE5);
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
              itemCount: coolDown.length,
              itemBuilder: (context, index) {
                return item(index, coolDown, cool_icons, 0xbf3A8ADA);
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
