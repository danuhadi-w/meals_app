import 'package:flutter/material.dart';
import 'package:meals_app_v2/models/meal.dart';
import 'package:meals_app_v2/widgets/meals_item.dart';
import 'package:get/get.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen(this.title, this.filteredMeals, {super.key});

  final List<Meal> filteredMeals;
  final String title;

  static const routeName = "/category-meals";

  List<Meal> filterMealByCategory(String categoryId) {
    return dummyMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (title == "Favorite") {
      return Obx(
        () => Scaffold(
          body: ListView.builder(
            itemCount: filteredMeals.length,
            itemBuilder: (ctx, index) {
              var meal = filteredMeals.elementAt(index);
              return MealsItem(meal);
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("$title Meals"),
        ),
        body: ListView.builder(
          itemCount: filteredMeals.length,
          itemBuilder: (ctx, index) {
            var meal = filteredMeals.elementAt(index);
            return MealsItem(meal);
          },
        ),
      );
    }
  }
}
