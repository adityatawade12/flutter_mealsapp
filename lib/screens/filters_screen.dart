import 'package:flutter/material.dart';
import 'package:flutter_mealsapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routename = "/filters";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"] as bool;
    _vegetarian = widget.currentFilters["vegetarian"] as bool;
    _vegan = widget.currentFilters["vegan"] as bool;
    _lactoseFree = widget.currentFilters["lactose"] as bool;
    super.initState();
  }

  Widget _buildListTile(String title, String description, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () {
                var newFilters = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian
                };

                widget.saveFilters(newFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildListTile(
                  'Gluten Free', "Include only gluten free", _glutenFree,
                  (newval) {
                setState(() {
                  _glutenFree = newval;
                });
              }),
              _buildListTile(
                  'Lactose Free', "Include only lactose free", _lactoseFree,
                  (newval) {
                setState(() {
                  _lactoseFree = newval;
                });
              }),
              _buildListTile(
                  'Vegetarian', "Include only vegetarain", _vegetarian,
                  (newval) {
                setState(() {
                  _vegetarian = newval;
                });
              }),
              _buildListTile('Vegan', "Include only vegan", _vegan, (newval) {
                setState(() {
                  _vegan = newval;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
