//--home screen--

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TapsScreen extends StatefulWidget {
  const TapsScreen({super.key});

  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

//-----------------------------
const kInitialValue = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

//-----------------------------
class _TapsScreenState extends State<TapsScreen> {
  //-----------------------------
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars(); //to clear prev snack bars
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: MediaQuery.of(context).size.width * 0.33,
        ),
        content: Wrap(
          children: [
            Center(
              child: Text(
                message,
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
      ),
    );
  }

  //-------------------------------
  Map<Filter, bool> _selectFilter = kInitialValue;
  void _selectScreen(String id) {
    if (id == 'filters') {
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(
        //push returns Future
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: _selectFilter),
        ),
      )
          .then(
        (value) {
          setState(() {
            _selectFilter = value ?? kInitialValue;
          });
        },
      );
    }
  }

  //-----------------------------
  String activePageTitle = "Categories"; //initial value for active page
  final List<Meal> favoriteMeals = []; //list of favorite meals only
  //---------------------------------------
  void toggleMealFavorite(Meal meal) {
    bool isExisting = favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      showSnackBar('meal is no longer as a favorite');
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
      showSnackBar('meal added to favorite');
    }
  }

  @override
  Widget build(BuildContext context) {
    //---------------------------------------availableMeals
    final List<Meal> availableMeals = dummyMeals.where((meal) {
      if (_selectFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    //--------------------------------------- active pages manage
    Widget activePage = CategoriesScreen(
      onToggleFavorite: toggleMealFavorite,
      availableMeals: availableMeals,
    );

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favoriteMeals,
        onToggleFavorite: toggleMealFavorite,
      );
      activePageTitle = 'Favorites';
    }
    //---------------------------------scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
      //----------------------------drawer
      drawer: MainDrawer(
        onSelectScreen: _selectScreen,
      ),
    );
  }
}
