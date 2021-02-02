import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

final List<Meal> availableMeals;
//constructor
CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
String title;
List<Meal> meals;

 var _loadedInitData =false;

@override
  void initState() {
    
    super.initState();
  }

@override
  void didChangeDependencies() {
    if(!_loadedInitData){
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs["id"];
    title = routeArgs["title"];
    meals =
       widget.availableMeals.where((el) => el.categories.contains(id)).toList();
_loadedInitData=true;}
    super.didChangeDependencies();
  }


void _removeMeal(String mealId){
setState(() {
  meals.removeWhere((el) => el.id == mealId);
});
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (cxt, index) {
            var meal= meals[index];
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
          itemCount: meals.length,
        ));
  }
}
