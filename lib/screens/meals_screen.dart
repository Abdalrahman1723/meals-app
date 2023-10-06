import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title, //not required
      required this.meals,
      required this.onToggleFavorite});
  //--------------------
  final String? title;
  final List<Meal> meals; //filtered meals
  final void Function(Meal meal) onToggleFavorite;
  //--------------------
  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map((meal) => MealItem(
                  meal: meal,
                  onSelectMeal: (Meal meal) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MealDetailScreen(
                          meal: meal,
                          onToggleFavorite: onToggleFavorite,
                        ),
                      ),
                    );
                  },
                ))
            .toList(),
      ),
    );
  }
}
