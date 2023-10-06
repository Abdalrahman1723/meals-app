import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.category,
      required this.onToggleFavorite,
      required this.availableMeals});
  //--------------------
  final Category category;
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  //--------------------
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //GestureDetector
      onTap: () {
        final filteredMeal = availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeal,
              onToggleFavorite: onToggleFavorite,
            ),
          ),
        );
      },
      // splashColor: Theme.of(context).primaryColor,
      splashColor: Colors.redAccent, //---
      borderRadius: BorderRadius.circular(12),
      child: Container(
          margin: const EdgeInsets.all(5), //---
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color.withOpacity(0.9),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )),
    );
  }
}
