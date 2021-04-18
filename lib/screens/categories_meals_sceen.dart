import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesMealScreen extends StatelessWidget {
  // final Category category;
  // const CategoriesMealScreen(this.category);
  final List<Meal> meals;

  CategoriesMealScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Receitas')),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
