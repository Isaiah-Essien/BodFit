import 'dart:math'; // Importing Dart's math package for random number generation

import 'package:bodFit_group5_summative/features/Nutrition/mealplans.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:bodFit_group5_summative/utils/constants/images_string.dart';
import 'package:bodFit_group5_summative/utils/constants/sizes.dart';
import 'package:fl_chart/fl_chart.dart'; // Importing FL Chart package for displaying charts
import 'package:flutter/material.dart'; // Importing Flutter's material package for UI components
import 'package:iconsax/iconsax.dart'; // Importing Iconsax package for icons
// Importing a custom food feature

// DashboardColors class defines color constants used in the dashboard
class DashboardColors {
  DashboardColors._(); // Private constructor to prevent instantiation

  static const Color primaryColor =
      Color.fromARGB(255, 29, 144, 215); // Primary color for the dashboard
  static const Color dark = Colors.black; // Dark color used in dark mode
  static const Color light = Colors.white; // Light color used in light mode
}

// Main widget for the dashboard page, using a stateful widget
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key}); // Constructor

  @override
  _DashboardPageState createState() =>
      _DashboardPageState(); // Creates the state for this widget
}

// State class for DashboardPage
class _DashboardPageState extends State<DashboardPage> {
  late List<FlSpot> _spots; // List of spots for the line chart
  String _selectedPeriod = 'Day'; // Initially selected period for data
  double _distance = 0; // Distance data
  int _calories = 0; // Calories data
  String _time = ''; // Time data
  bool _showNotifications = false; // Flag to show/hide notifications
  String _activityMessage =
      '10% more active than last week.'; // Activity message

  @override
  void initState() {
    super.initState();
    _generateRandomData(); // Generate initial random data
  }

  // Generates random data for the chart and other metrics
  void _generateRandomData() {
    final random = Random();
    _spots = List.generate(
        10, (index) => FlSpot(index.toDouble(), random.nextDouble() * 10));
    _distance = random.nextDouble() * 10;
    _calories = random.nextInt(2000) + 1000;
    _time =
        '${random.nextInt(5)}:${random.nextInt(60).toString().padLeft(2, '0')}';
    setState(() {});
  }

  // Updates the chart data based on the selected period
  void _updateChartData(String period) {
    setState(() {
      _selectedPeriod = period;
      _generateRandomData();
      _activityMessage = _getActivityMessage(period);
    });
  }

  // Generates an activity message based on the selected period
  String _getActivityMessage(String period) {
    final random = Random();
    final activityPercent =
        random.nextInt(20) + 5; // percentage between 5% and 25%
    switch (period) {
      case 'Day':
        return '$activityPercent% more active than yesterday.';
      case 'Week':
        return '$activityPercent% more active than last week.';
      case 'Month':
        return '$activityPercent% more active than last month.';
      case 'Year':
        return '$activityPercent% more active than last year.';
      default:
        return '10% more active than last week.';
    }
  }

  // Toggles the visibility of notifications
  void _toggleNotifications() {
    setState(() {
      _showNotifications = !_showNotifications;
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = darkMode ? DashboardColors.light : DashboardColors.dark;
    final selectedTextColor =
        darkMode ? DashboardColors.dark : DashboardColors.light;
    const borderColor = DashboardColors.primaryColor;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: MColors.lightGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(MSizes.spaceBtwSects / 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for user profile and icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: DashboardColors.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/kanayo.jpg'),
                        radius: 20,
                        backgroundColor: DashboardColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: darkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          'Kanayo O. Kanayo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: darkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Iconsax.notification,
                              color: DashboardColors.primaryColor),
                          onPressed: _toggleNotifications,
                        ),
                        // Small red dot to indicate notifications
                        Positioned(
                          right: 15.5,
                          top: 15,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Iconsax.search_normal,
                          color: DashboardColors.primaryColor),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            // Notifications container
            if (_showNotifications)
              Container(
                width: 250,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:
                      darkMode ? DashboardColors.dark : DashboardColors.light,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.fitness_center,
                          color: DashboardColors.primaryColor),
                      title: Text('Workout Reminder'),
                      subtitle: Text('Time for your daily workout!'),
                    ),
                    ListTile(
                      leading: Icon(Icons.fastfood,
                          color: DashboardColors.primaryColor),
                      title: Text('Nutrition Tip'),
                      subtitle: Text('Eat more protein for better recovery.'),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            const Text(
              'Today',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'June 2, 2024',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            // Period selection buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildPeriodButton(
                    'Day', textColor, selectedTextColor, borderColor),
                buildPeriodButton(
                    'Week', textColor, selectedTextColor, borderColor),
                buildPeriodButton(
                    'Month', textColor, selectedTextColor, borderColor),
                buildPeriodButton(
                    'Year', textColor, selectedTextColor, borderColor),
              ],
            ),
            const SizedBox(height: 20),
            // Line chart displaying the activity data
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 8.0,
                              child: Text(days[value.toInt() % days.length]),
                            );
                          }),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: _spots,
                      isCurved: true,
                      color: DashboardColors.primaryColor,
                      barWidth: 2,
                      belowBarData: BarAreaData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Activity message
            Text(
              _activityMessage,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Summary of today's metrics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(_distance.toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Distance'),
                  ],
                ),
                Column(
                  children: [
                    Text('$_calories',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Calories'),
                  ],
                ),
                Column(
                  children: [
                    Text(_time,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Time'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Day plan section
            const Text(
              'Day plan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Day plan items
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDayPlanItem(MImages.weightlifting, 'Workout', '2 hours',
                    () {
                  // Placeholder for navigation to WorkoutPage
                }),
                buildDayPlanItem(MImages.sleep, 'Sleeping', '9 hours', () {
                  // Placeholder for navigation to WorkoutPage
                }),
                buildDayPlanItem(MImages.catering, 'Diet', '3 meals', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MealPlansPage()));
                }),
                buildDayPlanItem('assets/gifs/running.gif', 'Running', '10 km',
                    () {
                  // Placeholder for navigation to WorkoutPage
                }),
              ],
            ),
            const SizedBox(height: 20),
            // Motivational message and navigation to change food page
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MealPlansPage()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color:
                      darkMode ? DashboardColors.dark : DashboardColors.light,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Eating healthy and Exercising is important!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Click here or the icons above to learn more about your personalised fitness and diet options.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds a widget for a day plan item
  Widget buildDayPlanItem(
      String gifPath, String title, String subtitle, VoidCallback onTap) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 80,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: darkMode ? DashboardColors.dark : DashboardColors.light,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(gifPath, height: 40, width: 40),
              const SizedBox(height: 10),
              Text(title,
                  style: TextStyle(
                      color: darkMode
                          ? DashboardColors.light
                          : DashboardColors.dark)),
              Text(subtitle,
                  style: TextStyle(
                      color: darkMode
                          ? DashboardColors.light
                          : DashboardColors.dark)),
            ],
          ),
        ),
      ),
    );
  }

  // Builds a button for selecting a period (Day, Week, Month, Year)
  Widget buildPeriodButton(String period, Color textColor,
      Color selectedTextColor, Color borderColor) {
    final isSelected = _selectedPeriod == period;
    final backgroundColor = isSelected ? borderColor : Colors.transparent;
    final color = isSelected ? selectedTextColor : textColor;

    return GestureDetector(
      onTap: () => _updateChartData(period),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          period,
          style: TextStyle(
              color: color, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
