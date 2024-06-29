import 'package:flutter/material.dart';

class MealPlansPage extends StatefulWidget {
  const MealPlansPage({super.key});

  @override
  _MealPlansPageState createState() => _MealPlansPageState();
}

class _MealPlansPageState extends State<MealPlansPage> {
  String _selectedDay = 'Mon 24';
  String _selectedMeal = 'Breakfast';

  final Map<String, Map<String, List<Meal>>> _meals = {
    'Mon 24': {
      'Breakfast': [
        Meal('Fried Yam, Eggs, and Plantain', 'assets/images/yameggs.jpg', 20, 47, 63),
        Meal('Akamu with Akara', 'assets/images/akamu.jpg', 25, 40, 60),
        Meal('Noodles and Eggs', 'assets/images/noodles.png', 20, 30, 67)
      ],
      'Lunch': [
        Meal('Jollof Rice and Chicken', 'assets/images/jollof.jpg', 30, 40, 50),
        Meal('Efo Riro and Pounded Yam', 'assets/images/poundedyam.jpg', 35, 45, 55),
      ],
      'Dinner': [
        Meal('Fried Rice and Fish', 'assets/images/friedrice.jpg', 25, 35, 45),
        Meal('Egusi Soup and Semovita', 'assets/images/egusi.jpg', 30, 40, 50),
      ],
    },
    // Add more days and their respective meals
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Plans'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/kanayo.jpg'), // Profile image
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Mon 24', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun 30']
                  .map((day) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDay = day;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              day,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _selectedDay == day
                                    ? const Color.fromARGB(255, 18, 120, 204)
                                    : const Color.fromARGB(255, 145, 202, 240),
                              ),
                            ),
                            if (_selectedDay == day)
                              Container(
                                height: 2,
                                width: 20,
                                color: Colors.blue,
                              ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Breakfast', 'Lunch', 'Dinner']
                  .map((meal) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMeal = meal;
                          });
                        },
                        child: Text(
                          meal,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _selectedMeal == meal
                                ? const Color.fromARGB(255, 32, 127, 204)
                                : const Color.fromARGB(255, 139, 203, 255),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            if (_meals[_selectedDay] != null && _meals[_selectedDay]![_selectedMeal] != null)
              Column(
                children: _meals[_selectedDay]![_selectedMeal]!
                    .map((meal) => MealItem(
                          title: meal.title,
                          protein: meal.protein,
                          fat: meal.fat,
                          carbs: meal.carbs,
                          imagePath: meal.imagePath,
                        ))
                    .toList(),
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
            icon: Icon(Icons.fitness_center),
            label: 'Fitness',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class Meal {
  final String title;
  final String imagePath;
  final int protein;
  final int fat;
  final int carbs;

  Meal(this.title, this.imagePath, this.protein, this.fat, this.carbs);
}

class MealItem extends StatelessWidget {
  final String title;
  final int protein;
  final int fat;
  final int carbs;
  final String imagePath;

  const MealItem({
    Key? key,
    required this.title,
    required this.protein,
    required this.fat,
    required this.carbs,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Protein $protein'),
            Text('Fat $fat'),
            Text('Carbs $carbs'),
          ],
        ),
      ),
    );
  }
}
