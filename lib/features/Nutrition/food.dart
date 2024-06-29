// lib/pages/change_foods_page.dart
import 'package:bodFit_group5_summative/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:bodFit_group5_summative/features/Nutrition/food_item.dart';

class ChangeFoodsPage extends StatelessWidget {
  const ChangeFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change foods'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current food',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            FoodItem(
              title: 'Amala and Ewedu',
              protein: 20,
              fat: 47,
              carbs: 63,
              imagePath: 'assets/images/amala.jpg',
              recipe: Recipe(
                title: 'Amala and Ewedu',
                description: 'A traditional Nigerian dish made with yam flour and jute leaves.',
                ingredients: ['Yam flour', 'Jute leaves', 'Water', 'Salt'],
                steps: ['Mix yam flour with water', 'Cook jute leaves', 'Combine and serve'], imagePath: 'assets/images/amala.jpg',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Other suitable food',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            FoodItem(
              title: 'Garri, groundnut and Milk',
              protein: 35,
              fat: 58,
              carbs: 30,
              imagePath: 'assets/images/garri.jpg',
              recipe: Recipe(
                title: 'Garri, groundnut and Milk',
                description: 'A simple and nutritious meal.',
                ingredients: ['Garri', 'Groundnut', 'Milk', 'Water'],
                steps: ['Mix garri with water', 'Add groundnut and milk', 'Stir and serve'], imagePath: 'assets/images/garri.png',
              ),
            ),
            FoodItem(
              title: 'Afang Soup and Semolina',
              protein: 31,
              fat: 43,
              carbs: 55,
              imagePath: 'assets/images/afang.jpg',
              recipe: Recipe(
                title: 'Afang Soup and Semolina',
                description: 'A traditional Nigerian soup made with afang leaves and semolina.',
                ingredients: ['Afang leaves', 'Meat', 'Fish', 'Semolina'],
                steps: ['Cook meat and fish', 'Add afang leaves', 'Serve with semolina'],
                imagePath: 'assets/images/afang.jpg',
              ),
            ),
            FoodItem(
              title: 'Nigerian Jollof Rice',
              protein: 36,
              fat: 50,
              carbs: 60,
              imagePath: 'assets/images/jollof.jpg',
              recipe: Recipe(
                title: 'Nigerian Jollof Rice',
                description: 'A popular West African dish made with rice, tomatoes, and spices.',
                ingredients: ['Rice', 'Tomatoes', 'Onions', 'Spices'],
                steps: ['Cook tomatoes and onions', 'Add rice and spices', 'Simmer until done'],
                imagePath: 'assets/images/jollof.jpg',
              ),
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
