import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_grid_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  static const routeName = "category-screen";

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        upperBound: 1,
        lowerBound: 0);
    super.initState();

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return SlideTransition(
            position: Tween(
              begin: Offset(0, 0.2),
              end: Offset(0, 0),
            ).animate(
              animationController,
            ),
            child: child,
          );
        },
        child: GridView.builder(
            padding: const EdgeInsets.all(7),
            itemCount: availableCategories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.57,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (ctx, index) {
              var item = availableCategories.elementAt(index);
              return CategoryGridItem(item);
            }),
      ),
    );
  }
}
