// i used in the food and recipe files
class Recipe {
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final String imagePath;

  Recipe({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.imagePath,
  });
}
