import 'dart:math';

import 'package:bodFit_group5_summative/utils/constants/dash_nav.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late List<FlSpot> _spots;
  String _selectedPeriod = 'Day';
  double _distance = 0;
  int _calories = 0;
  String _time = '';

  @override
  void initState() {
    super.initState();
    _generateRandomData();
  }

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

  void _updateChartData(String period) {
    setState(() {
      _selectedPeriod = period;
      _generateRandomData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashNav(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/kanayo.jpg'), // Kanayo's Image
                  radius: 30,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Kanayo O Kanayo',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _updateChartData('Day'),
                  child: Text('Day',
                      style: TextStyle(
                          color: _selectedPeriod == 'Day'
                              ? Colors.blue
                              : const Color.fromARGB(255, 132, 194, 229))),
                ),
                TextButton(
                  onPressed: () => _updateChartData('Week'),
                  child: Text('Week',
                      style: TextStyle(
                          color: _selectedPeriod == 'Week'
                              ? Colors.blue
                              : const Color.fromARGB(255, 132, 194, 229))),
                ),
                TextButton(
                  onPressed: () => _updateChartData('Month'),
                  child: Text('Month',
                      style: TextStyle(
                          color: _selectedPeriod == 'Month'
                              ? Colors.blue
                              : const Color.fromARGB(255, 132, 194, 229))),
                ),
                TextButton(
                  onPressed: () => _updateChartData('Year'),
                  child: Text('Year',
                      style: TextStyle(
                          color: _selectedPeriod == 'Year'
                              ? Colors.blue
                              : const Color.fromARGB(255, 132, 194, 229))),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
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
                      color: Colors.blue,
                      barWidth: 2,
                      belowBarData: BarAreaData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '10% more active than last week.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('${_distance.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Distance'),
                  ],
                ),
                Column(
                  children: [
                    Text('$_calories',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Calories'),
                  ],
                ),
                Column(
                  children: [
                    Text('$_time',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Time'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Day plan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDayPlanItem(Icons.fitness_center, 'Workout', '2 hours'),
                buildDayPlanItem(Icons.bed, 'Sleeping', '9 hours'),
                buildDayPlanItem(Icons.directions_run, 'Running', '10 km'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDayPlanItem(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, size: 40),
        Text(title),
        Text(subtitle),
      ],
    );
  }
}
