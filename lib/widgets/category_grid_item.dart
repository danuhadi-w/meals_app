import 'package:flutter/material.dart';
import 'package:meals_app_v2/screens/meals_screen.dart';
import 'package:get/get.dart';

import '../models/category.dart' as c;
import '../controllers/filter_controller.dart';
// import '../dummy_data.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(this.category, {super.key});

  final c.Category category;

  void toCategoryMealsScreen(BuildContext context) {
    var controller = Get.put(FilterController());
    print(controller.filteredMeals.length);
    var filteredMeals = controller.filteredMeals
        .where((item) => item.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return CategoryMealsScreen(category.title, filteredMeals);
        },
      ),
    );

    // Navigator.pushNamed(context, CategoryMealsScreen.routeName,
    //     arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toCategoryMealsScreen(context),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [category.color.withOpacity(0.7), category.color]),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 7),
          child: Text(
            category.title,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
