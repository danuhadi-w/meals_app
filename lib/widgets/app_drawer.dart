import 'package:flutter/material.dart';
import 'package:meals_app_v2/screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(
    this.statusBarHeight, {
    super.key,
  });

  final double statusBarHeight;

  // void navigateTo(BuildContext context, String routeName) {
  //   var currentRoute = ModalRoute.of(context)?.settings.name;

  //   if (currentRoute != null &&
  //       currentRoute != routeName &&
  //       currentRoute != FilterScreen.routeName) {
  //     Navigator.pop(context);
  //     Navigator.pushReplacementNamed(context, routeName);
  //   } else if (currentRoute == FilterScreen.routeName) {
  //     Navigator.pop(context);
  //   } else {
  //     Navigator.pop(context);
  //   }
  // }

  void toFilterRoute(BuildContext context) {
    final currentRoute = ModalRoute.of(context)!.settings.name;
    if (currentRoute == FilterScreen.routeName) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(FilterScreen.routeName);
    }
  }

  void toMealsRoute(BuildContext context) {
    final currentRoute = ModalRoute.of(context)!.settings.name;
    if (currentRoute == "/") {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
  }

  Widget tileBuilder(
      BuildContext context, IconData icon, String title, Function navigateTo) {
    // var routeName = title == "Meals" ? "/" : FilterScreen.routeName;
    return ListTile(
      onTap: () {
        // navigateTo(context, routeName);
        navigateTo(context);
      },
      leading: Icon(
        icon,
        size: 24,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Drawer(
        elevation: 3,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: Border.all(width: 0, style: BorderStyle.none),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              color: Theme.of(context).appBarTheme.backgroundColor,
              width: double.maxFinite,
              height: 79 - statusBarHeight,
              child: const Text(
                "Meal App by DN",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            tileBuilder(
              context,
              Icons.fastfood,
              "Meals",
              toMealsRoute,
            ),
            tileBuilder(
              context,
              Icons.settings,
              "Filter",
              toFilterRoute,
            ),
          ],
        ),
      ),
    );
  }
}
