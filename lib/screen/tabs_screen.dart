import 'package:flutter/material.dart';
import '../screen/favorite_screen.dart';
import './categories_screen.dart';
import '../widget/main_drawer.dart';
import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;
//constructor
  TabsScreen(this.favoritedMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  List<Map<String, Object>> _pages;

//to recognize widget.favoritemeals
  @override
  void initState() {
    _pages = [
      {
        "Page": CategoriesScreen(),
        "title": "Categories",
      },
      {
        "Page": FavoriteScreen(widget.favoritedMeals),
        "title": "Favorite",
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]["title"]),
        ),
        drawer: MainDrawer(),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            onTap: _selectPage,
            labelColor: Colors.white,
            indicatorColor: Theme.of(context).accentColor,
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Category",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: ("Favorite"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(widget.favoritedMeals),
          ],
        ),
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         title: Text(
//           _pages[_selectedPageIndex]["title"],
//         ),
//       ),
//       body: _pages[_selectedPageIndex]["page"],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         backgroundColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.white,
//         selectedItemColor: Theme.of(context).accentColor,
//         currentIndex: _selectedPageIndex,
//         // type: BottomNavigationBarType.shifting,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: Icon(Icons.category),
//             label: "Categories",
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: Icon(Icons.star),
//             label: "Favorites",
//           ),
//         ],
//       ),
//     );
