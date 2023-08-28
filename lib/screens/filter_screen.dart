import 'package:flutter/material.dart';
import 'package:meals_app_v2/controllers/filter_controller.dart';
import 'package:meals_app_v2/widgets/app_drawer.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  static const routeName = "filter";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late FilterController controller;
  late Worker debounceWorker;

  @override
  void initState() {
    controller = Get.put(FilterController());
    debounceWorker = debounce(
        controller.filters, (_) => controller.filterMeals(),
        time: const Duration(seconds: 1));
    super.initState();
  }

  Widget filterItemBuilder({
    required String filterName,
    required String title,
    required String subtitle,
  }) {
    return SwitchListTile(
      value: controller.filters[filterName]!,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: (newValue) {
        controller.filters[filterName] = newValue;
        // controller.filterMeals();
      },
    );
  }

  @override
  void dispose() {
    debounceWorker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        drawer: AppDrawer(statusBarHeight),
        appBar: AppBar(
          title: const Text("Filter Your Meals"),
        ),
        body: Column(
          children: [
            Obx(
              () => filterItemBuilder(
                  filterName: "isGlutenFree",
                  title: "Gluten free",
                  subtitle: "Only include gluten-free meals"),
            ),
            Obx(
              () => filterItemBuilder(
                  filterName: "isLactoseFree",
                  title: "Lactose free",
                  subtitle: "Only include lactose-free meals"),
            ),
            Obx(
              () => filterItemBuilder(
                  filterName: "isVegan",
                  title: "Vegan",
                  subtitle: "Only include vegan meals"),
            ),
            Obx(
              () => filterItemBuilder(
                  filterName: "isVegetarian",
                  title: "Vegetarian",
                  subtitle: "Only include vegetarian meals"),
            ),
          ],
        ),
      ),
    );
  }
}
