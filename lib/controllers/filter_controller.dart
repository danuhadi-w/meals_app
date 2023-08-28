import 'package:get/get.dart';

import '../dummy_data.dart';

class FilterController extends GetxController {
  var filters = <String, bool>{
    "isGlutenFree": false,
    "isVegan": false,
    "isVegetarian": false,
    "isLactoseFree": false,
  }.obs;

  var filteredMeals = dummyMeals;

  void filterMeals() {
    print("test");
    filteredMeals = dummyMeals.where((item) {
      if (filters["isGlutenFree"]! && !item.isGlutenFree) {
        return false;
      }
      if (filters["isLactoseFree"]! && !item.isLactoseFree) {
        return false;
      }
      if (filters["isVegetarian"]! && !item.isVegetarian) {
        return false;
      }
      if (filters["isVegan"]! && !item.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }
}
