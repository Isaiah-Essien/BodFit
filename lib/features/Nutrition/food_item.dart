// lib/widgets/food_item.dart
import 'package:bodFit_group5_summative/features/Nutrition/recipe_page.dart';
import 'package:bodFit_group5_summative/models/recipe.dart';
import 'package:flutter/material.dart';


class FoodItem extends StatelessWidget {
  final String title;
  final int protein;
  final int fat;
  final int carbs;
  final String imagePath;
  final Recipe recipe;

  const FoodItem({
    super.key,
    required this.title,
    required this.protein,
    required this.fat,
    required this.carbs,
    required this.imagePath,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipePage(recipe: recipe),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
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
      ),
    );
  }
}
