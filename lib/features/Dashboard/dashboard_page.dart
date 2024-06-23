import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData.dark(),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/kanayo.jpg'), // Kanayo's Image
                  radius: 30,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  onPressed: () {},
                  child: const Text('Day', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Week', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Month', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Year', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Placeholder for the graph
            Container(
              height: 200,
              color: Colors.blueAccent,
              child: const Center(child: Text('Graph Placeholder')),
            ),
            const SizedBox(height: 10),
            const Text(
              '10% more active than last week.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('8.42', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Distance'),
                  ],
                ),
                Column(
                  children: [
                    Text('1,540', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Calories'),
                  ],
                ),
                Column(
                  children: [
                    Text('3:24', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Time'),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
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
