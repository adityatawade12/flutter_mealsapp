import 'package:flutter/material.dart';
import 'package:flutter_mealsapp/models/meal.dart';
import 'package:flutter_mealsapp/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoruiteMeals;
  FavouritesScreen(this.favoruiteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoruiteMeals.isEmpty) {
      return Center(
        child: Text("You have no favourites yet!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoruiteMeals[index].id,
            title: favoruiteMeals[index].title,
            imgUrl: favoruiteMeals[index].imageUrl,
            duration: favoruiteMeals[index].duration,
            complexity: favoruiteMeals[index].complexity,
            affordability: favoruiteMeals[index].affordability,
          );
        },
        itemCount: favoruiteMeals.length,
      );
    }
  }
}
