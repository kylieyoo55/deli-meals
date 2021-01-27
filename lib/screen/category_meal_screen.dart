import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widget/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/CategoryMealsScreen";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs["id"];
    final title = routeArgs["title"];
    final meals =
        DUMMY_MEALS.where((el) => el.categories.contains(id)).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (cxt, index) {
            var meal= meals[index];
            return MealItem(
                title: meal.title,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                complexity: meal.complexity,
                affordability: meal.affordability);
// Text(meals[index].title);
          },
          itemCount: meals.length,
        ));
  }
}
