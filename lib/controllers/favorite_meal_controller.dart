import 'package:get/get.dart';

import '../models/meal.dart';

class FavoriteController extends GetxController {
  RxList<Meal> favoriteMeals = <Meal>[].obs;

  bool isFavorite(String mealId) {
    return favoriteMeals.any((item) => item.id == mealId);
  }

  void toggleFavorite(Meal meal) {
    if (isFavorite(meal.id)) {
      favoriteMeals.removeWhere((item) => item.id == meal.id);
    } else {
      favoriteMeals.add(meal);
    }
  }
}
