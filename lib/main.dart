import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'screen/categories_screen.dart';
import 'screen/category_meal_screen.dart';
import 'screen/categories_screen.dart';
import 'screen/meal_detail_screen.dart';
import 'screen/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
              // color: Colors.black
              ),
            ),
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx)=>TabsScreen(),
        CategoryMealsScreen.routeName :(ctx)=> CategoryMealsScreen(),
        MealDetailScreen.routeName:(ctx)=> MealDetailScreen(),
      },
      onUnknownRoute: (setting){
        return MaterialPageRoute(builder: (ctx)=>CategoriesScreen(),);
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
