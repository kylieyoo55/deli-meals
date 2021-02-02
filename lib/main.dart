import 'package:flutter/material.dart';

import 'screen/categories_screen.dart';
import 'screen/category_meal_screen.dart';
import 'screen/meal_detail_screen.dart';
import 'screen/tabs_screen.dart';
import 'screen/filters_screen.dart';
import './dummy_data.dart';
import './model/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    "gluten": false,
    "vegan": false,
    "vegetarian": false,
    "lactose": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;

      _availableMeals = DUMMY_MEALS.where((el) {
        if (_filter["gluten"] && !el.isGlutenFree) {
          return false;
        }
        if (_filter["lactose"] && !el.isLactoseFree) {
          return false;
        }
        if (_filter["vegan"] && !el.isVegan) {
          return false;
        }
        if (_filter["vegetarian"] && !el.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

//check index toggle the favorite meal
  void _toggleFavorite(String mealId) {
    final existIndex = _favoritedMeals.indexWhere((el) => el.id == mealId);
    if (existIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existIndex);
      });
    } else {
      setState(() {
        _favoritedMeals.add(
          DUMMY_MEALS.firstWhere((el) => el.id == mealId),
        );
      });
    }
  }

bool _isMealFavorite(String id){
return _favoritedMeals.any((el) => el.id == id);
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "RaleWay",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontSize: 24,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(_favoritedMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filter),
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
