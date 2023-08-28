import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:get/get.dart';

import '../models/meal.dart';
import '../controllers/favorite_meal_controller.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const routeName = "/meal-detail";

  Widget recepiesAndStepsWidget(
      BuildContext context, String title, List<String> items) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.teal,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            ...items.map((item) {
              return Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Text(
                  item,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    final favoriteController = Get.put(FavoriteController());
    return Scaffold(
        appBar: AppBar(
          actions: [
            Obx(
              () => IconButton(
                onPressed: () => favoriteController.toggleFavorite(meal),
                icon: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return SizeTransition(
                      sizeFactor:
                          Tween<double>(begin: 0, end: 1).animate(animation),
                      child: child,
                    );
                  },
                  child: Icon(
                    favoriteController.isFavorite(meal.id)
                        ? Icons.star
                        : Icons.star_border,
                    key: ValueKey(favoriteController.isFavorite(meal.id)),
                  ),
                ),
              ),
            )
          ],
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: meal.id,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: 250,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                ),
              ),
              recepiesAndStepsWidget(context, "Ingredients", meal.ingredients),
              recepiesAndStepsWidget(context, "Steps", meal.steps),
            ],
          ),
        ));
  }
}
