import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/exercise.dart';
import 'package:bodFit_group5_summative/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/api_exercise.dart';
import '../../api/api_service.dart';

class PlanOverview extends StatefulWidget {
  final String selectedWorkout;
  const PlanOverview({super.key, required this.selectedWorkout});

  @override
  State<PlanOverview> createState() => _PlanOverviewState();
}

class _PlanOverviewState extends State<PlanOverview> {
  late Future<List<Exercise>> futureExercises;
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;
  late ApiService apiService;
  late String part;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });

    // Determine the workout type and set the appropriate data
    if (widget.selectedWorkout == MTexts.chest) {
      part = MTexts.chest;
    } else if (widget.selectedWorkout == MTexts.back) {
      part = MTexts.back;
    } else if (widget.selectedWorkout == MTexts.cardio) {
      part = MTexts.cardio;
    } else if (widget.selectedWorkout == MTexts.lowerLegs) {
      part = MTexts.lowerLegs;
    } else {
      part = MTexts.chest; // Default value if none of the conditions are met
    }

    apiService = ApiService(part: part);
    futureExercises = apiService.fetchExercise();
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
            Text(
              '20 EXERCISES - ${widget.selectedWorkout.toUpperCase()}',
              style: GoogleFonts.nanumGothicCoding(
                  fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text('30 SECONDS WORK, 15 SECONDS REST',
                  style: GoogleFonts.barlowSemiCondensed(
                    color: MColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<List<Exercise>>(
              future: futureExercises,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('No exercises found, try again later'));
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = snapshot.data![index];
                      return item(index, exercise.name ?? 'No name',
                          WorkoutIcons.circuit, MColors.coolDown);
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget item(int index, String text, IconData icon, int color) {
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
            '${index + 1}. $text',
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
