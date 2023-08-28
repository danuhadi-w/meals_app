import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealsItem extends StatelessWidget {
  const MealsItem(this.meal, {super.key});

  final Meal meal;

  Widget mealItemTrait(BuildContext context, String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(
            width: 6,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void goToMealDetail(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/meal-detail",
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => goToMealDetail(context),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.imageUrl),
                    height: 200,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 70,
                    color: Colors.black45,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        FittedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(meal.title,
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.white)),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 1,
                              child: mealItemTrait(context,
                                  "${meal.duration} MIN", Icons.schedule),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 1,
                              child: mealItemTrait(
                                  context,
                                  meal.complexity.name.toUpperCase(),
                                  Icons.book),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 1,
                              child: mealItemTrait(
                                  context,
                                  meal.affordability.name.toUpperCase(),
                                  Icons.attach_money),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Row()
          ],
        ),
      ),
    );
  }
}
