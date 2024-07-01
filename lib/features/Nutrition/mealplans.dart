import 'package:bodFit_group5_summative/features/Nutrition/food.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/utils/constants/colors.dart';
import 'package:flutter/material.dart';

///this page shows you your daily Nigerian meal plans and nutritional details
class MealPlansPage extends StatefulWidget {
  const MealPlansPage({super.key});

  @override
  _MealPlansPageState createState() => _MealPlansPageState();
}

class _MealPlansPageState extends State<MealPlansPage> {
  String _selectedDay = 'Mon 24';
  String _selectedMeal = 'Breakfast';
  int _selectedMealIndex = 0;

  ///Days of the week from monday to sunday with detailed meals
  final Map<String, Map<String, List<Meal>>> _meals = {
    'Mon 24': {
      'Breakfast': [
        Meal('Fried Yam, Eggs, and Plantain', 'assets/images/yameggs.jpg', 20,
            47, 63),
        Meal('Akamu with Akara', 'assets/images/akamu.jpg', 25, 40, 60),
        Meal('Noodles and Eggs', 'assets/images/noodles.png', 20, 30, 67)
      ],
      'Lunch': [
        Meal('Jollof Rice and Chicken', 'assets/images/jollof.jpg', 30, 40, 50),
        Meal('Efo Riro and Pounded Yam', 'assets/images/poundedyam.jpg', 35, 45,
            55),
      ],
      'Dinner': [
        Meal('Fried Rice and Fish', 'assets/images/friedrice.jpg', 25, 35, 45),
        Meal('Egusi Soup and Semovita', 'assets/images/egusi.jpg', 30, 40, 50),
      ],
    },
    'Tue': {
      'Breakfast': [
        Meal('Akamu with Akara', 'assets/images/akamu.jpg', 25, 40, 60),
        Meal('Noodles and Eggs', 'assets/images/noodles.png', 20, 30, 67),
        Meal('Fried Yam, Eggs, and Plantain', 'assets/images/yameggs.jpg', 20,
            47, 63)
      ],
      'Lunch': [
        Meal('Efo Riro and Pounded Yam', 'assets/images/poundedyam.jpg', 35, 45,
            55),
        Meal('Jollof Rice and Chicken', 'assets/images/jollof.jpg', 30, 40, 50),
      ],
      'Dinner': [
        Meal('Egusi Soup and Semovita', 'assets/images/egusi.jpg', 30, 40, 50),
        Meal('Fried Rice and Fish', 'assets/images/friedrice.jpg', 25, 35, 45),
      ],
    },
    'Wed': {
      'Breakfast': [
        Meal('Noodles and Eggs', 'assets/images/noodles.png', 20, 30, 67),
        Meal('Fried Yam, Eggs, and Plantain', 'assets/images/yameggs.jpg', 20,
            47, 63),
        Meal('Akamu with Akara', 'assets/images/akamu.jpg', 25, 40, 60),
      ],
      'Lunch': [
        Meal('Jollof Rice and Chicken', 'assets/images/jollof.jpg', 30, 40, 50),
        Meal('Efo Riro and Pounded Yam', 'assets/images/poundedyam.jpg', 35, 45,
            55),
      ],
      'Dinner': [
        Meal('Fried Rice and Fish', 'assets/images/friedrice.jpg', 25, 35, 45),
        Meal('Egusi Soup and Semovita', 'assets/images/egusi.jpg', 30, 40, 50),
      ],
    },
    'Thu': {
      'Breakfast': [
        Meal('Akamu with Akara', 'assets/images/akamu.jpg', 25, 40, 60),
        Meal('Fried Yam, Eggs, and Plantain', 'assets/images/yameggs.jpg', 20,
            47, 63),
        Meal('Noodles and Eggs', 'assets/images/noodles.png', 20, 30, 67),
      ],
      'Lunch': [
        Meal('Efo Riro and Pounded Yam', 'assets/images/poundedyam.jpg', 35, 45,
            55),
        Meal('Jollof Rice and Chicken', 'assets/images/jollof.jpg', 30, 40, 50),
      ],
      'Dinner': [
        Meal('Egusi Soup and Semovita', 'assets/images/egusi.jpg', 30, 40, 50),
        Meal('Fried Rice and Fish', 'assets/images/friedrice.jpg', 25, 35, 45),
      ],
    },
    'Fri': {
      'Breakfast': [
        Meal('Noodles and Eggs', 'assets/images/noodles.png', 20, 30, 67),
        Meal('Fried Yam, Eggs, and Plantain', 'assets/images/yameggs.jpg', 20,
            47, 63),
        Meal('Akamu with Akara', 'assets/images/akamu.jpg', 25, 40, 60),
      ],
      'Lunch': [
        Meal('Jollof Rice and Chicken', 'assets/images/jollof.jpg', 30, 40, 50),
        Meal('Efo Riro and Pounded Yam', 'assets/images/poundedyam.jpg', 35, 45,
            55),
      ],
      'Dinner': [
        Meal('Fried Rice and Fish', 'assets/images/friedrice.jpg', 25, 35, 45),
        Meal('Egusi Soup and Semovita', 'assets/images/egusi.jpg', 30, 40, 50),
      ],
    },
    'Sat': {
      'Breakfast': [
        Meal('Fried Yam, Eggs, and Plantain', 'assets/images/yameggs.jpg', 20,
            47, 63),
        Meal('Akamu with Akara', 'assets/images/akamu.jpg', 25, 40, 60),
        Meal('Noodles and Eggs', 'assets/images/noodles.png', 20, 30, 67),
      ],
      'Lunch': [
        Meal('Efo Riro and Pounded Yam', 'assets/images/poundedyam.jpg', 35, 45,
            55),
        Meal('Jollof Rice and Chicken', 'assets/images/jollof.jpg', 30, 40, 50),
      ],
      'Dinner': [
        Meal('Egusi Soup and Semovita', 'assets/images/egusi.jpg', 30, 40, 50),
        Meal('Fried Rice and Fish', 'assets/images/friedrice.jpg', 25, 35, 45),
      ],
    },
    'Sun 30': {
      'Breakfast': [
        Meal('Akamu with Akara', 'assets/images/akamu.jpg', 25, 40, 60),
        Meal('Fried Yam, Eggs, and Plantain', 'assets/images/yameggs.jpg', 20,
            47, 63),
        Meal('Noodles and Eggs', 'assets/images/noodles.png', 20, 30, 67),
      ],
      'Lunch': [
        Meal('Jollof Rice and Chicken', 'assets/images/jollof.jpg', 30, 40, 50),
        Meal('Efo Riro and Pounded Yam', 'assets/images/poundedyam.jpg', 35, 45,
            55),
      ],
      'Dinner': [
        Meal('Egusi Soup and Semovita', 'assets/images/egusi.jpg', 30, 40, 50),
        Meal('Fried Rice and Fish', 'assets/images/friedrice.jpg', 25, 35, 45),
      ],
    },
  };

  void _onMealSwiped(int index) {
    setState(() {
      _selectedMealIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        heading: 'Meal Plans',
        showAvatar: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blue text above dates
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                '<June 24-30>',
                style: TextStyle(
                  color: MColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                'Mon 24',
                'Tue',
                'Wed',
                'Thu',
                'Fri',
                'Sat',
                'Sun 30'
              ] //week days
                  .map((day) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDay = day;
                            _selectedMealIndex =
                                0; // Reset the selected meal index
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
                            _selectedMealIndex =
                                0; // Reset the selected meal index
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _selectedMeal == meal
                                ? const Color.fromARGB(255, 32, 127, 204)
                                : Colors.transparent,
                          ),
                          child: Text(
                            meal,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _selectedMeal == meal
                                  ? Colors.white
                                  : const Color.fromARGB(255, 139, 203, 255),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            if (_meals[_selectedDay] != null &&
                _meals[_selectedDay]![_selectedMeal] != null)
              SizedBox(
                height: 250,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _meals[_selectedDay]![_selectedMeal]!.length,
                  onPageChanged:
                      _onMealSwiped, //for horizontally swiping beween meal options
                  itemBuilder: (context, index) {
                    final meal = _meals[_selectedDay]![_selectedMeal]![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: MealItem(
                        title: meal.title,
                        protein: meal.protein,
                        fat: meal.fat,
                        carbs: meal.carbs,
                        imagePath: meal.imagePath,
                        isSelected: index == _selectedMealIndex,
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
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
  final bool isSelected;

  const MealItem({
    Key? key,
    required this.title,
    required this.protein,
    required this.fat,
    required this.carbs,
    required this.imagePath,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChangeFoodsPage(),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(imagePath,
                    width: double.infinity, height: 150, fit: BoxFit.cover),
                if (isSelected)
                  Positioned(
                    top: 10,
                    right: 10,
                    child:
                        Icon(Icons.check_circle, color: Colors.green, size: 24),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNutrientInfo('Protein', protein, Colors.red),
                      _buildNutrientInfo('Fat', fat, Colors.yellow),
                      _buildNutrientInfo('Carbs', carbs, Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutrientInfo(String label, int value, Color color) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 5,
        ),
        SizedBox(width: 4),
        Text('$label $value'),
      ],
    );
  }
}
