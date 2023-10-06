import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.availableMeals});
//----------------------
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
//----------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Food Categories"),
      // ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 6,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onToggleFavorite: onToggleFavorite,
              availableMeals: availableMeals,
            )
        ],
      ),
    );
  }
}
