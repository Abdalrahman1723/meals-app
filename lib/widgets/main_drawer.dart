import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  //------------------------------
  final void Function(String id) onSelectScreen;
  //------------------------------
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 142, 29, 21),
                  Colors.red.withOpacity(0.7),
                ],
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 40,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Cocking..",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('meals');
            },
            leading: const Icon(Icons.restaurant),
            title: Text( 
              "Meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary, fontSize: 22),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
            },
            leading: const Icon(Icons.settings),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
