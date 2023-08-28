import 'package:flutter/material.dart';
import 'package:meals_app_v2/screens/category_screen.dart';
import 'package:meals_app_v2/screens/favorite_meals_screen.dart';

import '../widgets/app_drawer.dart';

class BotNavScreen extends StatefulWidget {
  const BotNavScreen({super.key});

  @override
  State<BotNavScreen> createState() => _BotNavScreenState();
}

class _BotNavScreenState extends State<BotNavScreen> {
  var screens = [
    {'screen': const CategoryScreen(), 'title': "Meal Categories"},
    {'screen': const FavoriteScreen(), 'title': "Favorite Meals"},
  ];
  var selectedScreen = 0;

  void selectScreen(int index) {
    setState(() {
      selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context);
    var currentScreen = screens[selectedScreen];
    return Scaffold(
      drawer: AppDrawer(screenData.viewPadding.top),
      appBar: AppBar(
        title: Text(currentScreen['title'] as String),
      ),
      body: currentScreen["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onTap: selectScreen,
          currentIndex: selectedScreen,
          selectedItemColor: Colors.yellow,
          selectedLabelStyle: TextStyle(color: Colors.yellow),
          unselectedLabelStyle: TextStyle(color: Colors.white),
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              label: "Meals Catalog",
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(label: "Favorite", icon: Icon(Icons.star))
          ]),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   print("rebuilding");
  //   return Scaffold(
  //     body: screens[selectedScreen],
  //     bottomNavigationBar: BottomNavigationBar(
  //         onTap: selectScreen,
  //         currentIndex: selectedScreen,
  //         items: [
  //           BottomNavigationBarItem(
  //             label: "Test",
  //             icon: Icon(Icons.category),
  //           ),
  //           BottomNavigationBarItem(label: "Test2", icon: Icon(Icons.star))
  //         ]),
  //   );
  // }
}
