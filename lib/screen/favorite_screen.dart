import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;

  FavoriteScreen(this.favoritedMeals);

  @override
  Widget build(BuildContext context) {
    if(favoritedMeals.isEmpty){
      return Center(child: Text("No Favorite added yet!"),);
    }else{
      return  ListView.builder(
          itemBuilder: (cxt, index) {
            var meal= favoritedMeals[index];
            return MealItem(
              id:meal.id,
                title: meal.title,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                complexity: meal.complexity,
                affordability: meal.affordability,
                
                );
// Text(meals[index].title);
          },
          itemCount: favoritedMeals.length,
        );}
    }
  }
