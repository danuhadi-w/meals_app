import 'package:flutter/material.dart';
import 'package:meals_app_v2/screens/meals_screen.dart';
import 'package:get/get.dart';

import '../controllers/favorite_meal_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());

    return Scaffold(
      body: CategoryMealsScreen("Favorite", favoriteController.favoriteMeals),
    );
  }
}
