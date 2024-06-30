// lib/pages/change_foods_page.dart
import 'package:flutter/material.dart';
import 'package:bodFit_group5_summative/models/recipe.dart';
import 'package:bodFit_group5_summative/utils/constants/app_bar.dart';
import 'package:bodFit_group5_summative/features/Nutrition/food_item.dart';

class ChangeFoodsPage extends StatelessWidget {
  const ChangeFoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        heading: 'Change Food',
        showAvatar: true,
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
            const SizedBox(height: 20),
            FoodItem(
              title: 'Fried Yam and Eggs',
              protein: 15,
              fat: 20,
              carbs: 50,
              imagePath: 'assets/images/friedyam.jpeg',
              recipe: Recipe(
                title: 'Fried Yam and Eggs',
                description: 'A delicious combination of fried yam and scrambled eggs.',
                ingredients: ['Yam', 'Eggs', 'Oil', 'Salt'],
                steps: ['Peel and slice yam', 'Fry yam in oil', 'Scramble eggs', 'Serve together'],
                imagePath: 'assets/images/friedyam.jpeg',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Other suitable food',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            FoodItem(
              title: 'Garri, Groundnut and Milk',
              protein: 35,
              fat: 58,
              carbs: 30,
              imagePath: 'assets/images/garri.jpg',
              recipe: Recipe(
                title: 'Garri, Groundnut and Milk',
                description: 'A simple and nutritious meal.',
                ingredients: ['Garri', 'Groundnut', 'Milk', 'Water'],
                steps: ['Mix garri with water', 'Add groundnut and milk', 'Stir and serve'],
                imagePath: 'assets/images/garri.jpg',
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
            FoodItem(
              title: 'Pounded Yam and Egusi Soup',
              protein: 40,
              fat: 45,
              carbs: 70,
              imagePath: 'assets/images/egusiyam.jpg',
              recipe: Recipe(
                title: 'Pounded Yam and Egusi Soup',
                description: 'A classic Nigerian dish made with pounded yam and melon seed soup.',
                ingredients: ['Yam', 'Egusi seeds', 'Meat', 'Vegetables'],
                steps: ['Pound yam', 'Prepare egusi soup', 'Combine and serve'],
                imagePath: 'assets/images/egusiyam.jpg',
              ),
            ),
            FoodItem(
              title: 'Efo Riro and Amala',
              protein: 28,
              fat: 38,
              carbs: 52,
              imagePath: 'assets/images/amala.jpg',
              recipe: Recipe(
                title: 'Efo Riro and Amala',
                description: 'A flavorful Nigerian spinach stew served with yam flour paste.',
                ingredients: ['Spinach', 'Meat', 'Fish', 'Amala'],
                steps: ['Cook meat and fish', 'Add spinach and spices', 'Serve with amala'],
                imagePath: 'assets/images/amala.jpg',
              ),
            ),
            FoodItem(
              title: 'Moi Moi and Pap',
              protein: 25,
              fat: 10,
              carbs: 40,
              imagePath: 'assets/images/moimoi.jpg',
              recipe: Recipe(
                title: 'Moi Moi and Pap',
                description: 'A nutritious meal of steamed bean pudding and fermented maize pudding.',
                ingredients: ['Beans', 'Pepper', 'Onions', 'Pap'],
                steps: ['Blend beans with pepper and onions', 'Steam mixture', 'Serve with pap'],
                imagePath: 'assets/images/moimoi.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
