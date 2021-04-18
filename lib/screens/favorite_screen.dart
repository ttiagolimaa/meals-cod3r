import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;

  FavoriteScreen(this.favoritesMeals);
  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    }
    return ListView.builder(
      itemCount: favoritesMeals.length,
      itemBuilder: (context, index) {
        return MealItem(favoritesMeals[index]);
      },
    );
  }
}
