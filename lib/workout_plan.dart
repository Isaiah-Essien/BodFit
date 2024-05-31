import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black87, // Set background color
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: 
                const Color.fromARGB(255, 59, 173, 225), // Set button color
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor:
                const Color.fromARGB(255, 59, 173, 225), // Set button color
            side: const BorderSide(
              color: Color.fromARGB(255, 59, 173, 225),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor:
                const Color.fromARGB(255, 59, 173, 225), // Set button color
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Workout and Nutrition Plan'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle menu selection
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'Settings',
                child: Text('Settings'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  // Workout Plan Section
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text(
                          'Workout Plan',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                              avatar: Icon(Icons.fitness_center,
                                  color: Colors.white),
                              label: Text(
                                'Morning Workout',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor:
                                  Color.fromARGB(255, 59, 173, 225),
                            ),
                            Icon(Icons.check_circle,
                                color: Color.fromARGB(255, 59, 173, 225)),
                          ],
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset('assets/images/image1.jpg'),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Start'),
                              ),
                            ),
                          ],
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          children: List.generate(4, (index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Exercise $index',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Image.asset(
                                  'assets/images/exercise$index.jpg',
                                  width: 100,
                                  height: 100,
                                ),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  // Nutrition Plan Section
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text(
                          'Nutrition Plan',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                              avatar:
                                  Icon(Icons.restaurant, color: Colors.white),
                              label: Text(
                                'Breakfast',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Color.fromARGB(255, 0, 170, 255),
                            ),
                            Icon(Icons.check_circle, color: Colors.green),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.food_bank,
                                  color: Colors.white),
                              title: Text(
                                'Meal $index',
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: OutlinedButton(
                                onPressed: () {},
                                child: const Text('Details'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Nutrition',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color.fromARGB(255, 0, 170, 255),
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: (index) {
          // Handle tab selection
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        backgroundColor: const Color.fromARGB(255, 0, 170, 255),
        child: const Icon(Icons.add),
      ),
    );
  }
}
