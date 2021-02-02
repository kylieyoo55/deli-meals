import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/FiltersScree";

  final Function saveFilters;
  final Map<String, bool> currentFilter;
//constructor
  FiltersScreen(this.saveFilters,this.currentFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() { 
_glutenFree =widget.currentFilter["gluten"];
_vegetarian =widget.currentFilter["vegetarian"];
_vegan =widget.currentFilter["vegan"];
_lactoseFree =widget.currentFilter["lactose"];


    super.initState();
    
  }

  Widget buildSwitchListTile(var filterValue, String filterTitle,
      String filterSub, Function updateValue) {
    return SwitchListTile(
      title: Text(filterTitle),
      value: filterValue,
      subtitle: Text(filterSub),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"),
      actions: [
        IconButton(
          icon: Icon(Icons.save),
          //function passed from main.dart
          onPressed: (){
            final selectedFilter={
  "gluten":_glutenFree,
  "vegetarian":_vegetarian,
  "vegan":_vegan,
  "lactose": _lactoseFree,
            };
            widget.saveFilters(selectedFilter);},),
      ],),
      drawer: MainDrawer(),
      body: Center(
        child: Container(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                    _glutenFree,
                    "Gluten-free",
                    "Only include gluten-free meals",
                    (nv) {
                      setState(() {
                        _glutenFree = nv;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    _vegetarian,
                    "Vegetarian",
                    "Only include Vegitarian meals",
                    (nv) {
                      setState(() {
                        _vegetarian = nv;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    _vegan,
                    "Vegan",
                    "Only include Vegan meals",
                    (nv) {
                      setState(() {
                        _vegan = nv;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    _lactoseFree,
                    "Lactose-free",
                    "Only include lactose-free meals",
                    (nv) {
                      setState(() {
                        _lactoseFree = nv;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
