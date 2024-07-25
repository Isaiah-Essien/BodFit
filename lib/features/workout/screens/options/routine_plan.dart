import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/exercise.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';

class HighIntensity extends StatefulWidget {
  final String selectedWorkout;
  const HighIntensity({super.key, required this.selectedWorkout});

  @override
  State<HighIntensity> createState() => _HighIntensityState();
}

class _HighIntensityState extends State<HighIntensity> {
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;

  late List<String> warmUp;
  late List<String> circuit;
  late List<String> coolDown;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });

    // Determine the workout type and set the appropriate data
    if (widget.selectedWorkout == MTexts.recovery) {
      warmUp = Recovery.warmUp;
      circuit = Recovery.circuit;
      coolDown = Recovery.coolDown;
    } else if (widget.selectedWorkout == MTexts.weightLoss) {
      warmUp = WeightLoss.warmUp;
      circuit = WeightLoss.circuit;
      coolDown = WeightLoss.coolDown;
    } else if (widget.selectedWorkout == MTexts.highIntensity) {
      warmUp = HIntensity.warmUp;
      circuit = HIntensity.circuit;
      coolDown = HIntensity.coolDown;
    } else if (widget.selectedWorkout == MTexts.strength) {
      warmUp = StrengthTraining.warmUp;
      circuit = StrengthTraining.circuit;
      coolDown = StrengthTraining.coolDown;
    } else {
      warmUp = Challenge.warmUp;
      circuit = Challenge.circuit;
      coolDown = Challenge.coolDown;
    }
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
                fontFamily: 'Roboto',
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
                return item(index, warmUp, WorkoutIcons.warmUp, MColors.warmUp);
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
                fontFamily: 'Roboto',
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
                return item(
                    index, circuit, WorkoutIcons.circuit, MColors.workOut);
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
                fontFamily: 'Roboto',
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
                return item(
                    index, coolDown, WorkoutIcons.coolDown, MColors.coolDown);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget item(int index, List texts, IconData icon, int color) {
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
            icon,
          ),
        ],
      ),
    );
  }
}
