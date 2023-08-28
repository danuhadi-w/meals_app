import 'package:flutter/material.dart';
import 'package:meals_app_v2/screens/bottom_navigation_screen.dart';
import 'package:meals_app_v2/screens/filter_screen.dart';

import 'screens/category_screen.dart';
import './screens/meal_detail_screen.dart';

var customColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 197, 252));

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        cardTheme: ThemeData().cardTheme.copyWith(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
        useMaterial3: true,
        colorScheme: customColorScheme,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: customColorScheme.primary,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      title: "Meals App",
      routes: {
        "/": (context) => const BotNavScreen(),
        CategoryScreen.routeName: (context) => const CategoryScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FilterScreen.routeName: (context) => const FilterScreen()
        // CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
      },
    );
  }
}
