import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('No favorites yet? Start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, id) {
          return MealItem(
            id: favoriteMeals[id].id,
            title: favoriteMeals[id].title,
            imageUrl: favoriteMeals[id].imageUrl,
            duration: favoriteMeals[id].duration,
            complexity: favoriteMeals[id].complexity,
            affordability: favoriteMeals[id].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
