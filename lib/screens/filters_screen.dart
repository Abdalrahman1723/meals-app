import 'package:flutter/material.dart';
import 'package:meals_app/widgets/showSnackBar.dart';
// import 'package:meals_app/screens/taps_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.currentFilters[Filter.glutenFree]!;
    _isLactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    _isVegan = widget.currentFilters[Filter.vegan]!;
    _isVegetarian = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _isGlutenFree,
            Filter.lactoseFree: _isLactoseFree,
            Filter.vegan: _isVegan,
            Filter.vegetarian: _isVegetarian,
          });

          return false;
        },
        child: Column(
          children: [
            customSwitch(
              context,
              'Gluten-free',
              'Only food that is gluten-free',
              _isGlutenFree,
              (bool value) {
                setState(() {
                  _isGlutenFree = value;
                });
                ShowSnackBar(context: context)
                    .showSnackBar("your filter has applied");
              },
            ),
            customSwitch(
              context,
              'lactose-free',
              'Only food that is lactose-free',
              _isLactoseFree,
              (bool value) {
                setState(() {
                  _isLactoseFree = value;
                });
                ShowSnackBar(context: context)
                    .showSnackBar("your filter has applied");
              },
            ),
            customSwitch(
              context,
              'Vegan',
              'Only food that is vegan',
              _isVegan,
              (bool value) {
                setState(() {
                  _isVegan = value;
                });
                ShowSnackBar(context: context)
                    .showSnackBar("your filter has applied");
              },
            ),
            customSwitch(
              context,
              'Vegetarian',
              'Only food that is vegetarian',
              _isVegetarian,
              (bool value) {
                setState(() {
                  _isVegetarian = value;
                });
                ShowSnackBar(context: context)
                    .showSnackBar("your filter has applied");
              },
            ),
          ],
        ),
      ),
      //---------------------------------
      // drawer: MainDrawer(
      //   onSelectScreen: (id) {
      //     Navigator.of(context).pop();
      //     if (id == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (context) => const TapsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }

  SwitchListTile customSwitch(BuildContext context, String title,
      String subTitle, bool filter, Function(bool value) onChanged) {
    return SwitchListTile(
      value: filter,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 22,
            ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary, fontSize: 16),
      ),
    );
  }
}
