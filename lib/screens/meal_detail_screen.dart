import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.meal, required this.onToggleFavorite});
  //----------------------
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  //----------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () => onToggleFavorite(meal), //!state management
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,
                width: double.infinity, height: 300, fit: BoxFit.cover),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 12,
            ),
            for (final ingredients in meal.ingredients)
              Text(
                ingredients,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16,
                    ),
              ),
            //--------------steps
            const SizedBox(
              height: 40,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 12,
            ),
            for (final steps in meal.steps)
              Text(
                "* $steps \n",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16,
                    ),
                textAlign: TextAlign.center,
              )
          ],
        ),
      ),
    );
  }
}
