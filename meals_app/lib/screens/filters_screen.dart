import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilters(selectedFilters);
            })
      ]),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
              'Gluten-free',
              'Only include gluten free meals',
              _glutenFree,
              (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              'Lactose-free',
              'Only include lactose free meals',
              _lactoseFree,
              (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              'Vegan',
              'Only include vegan meals',
              _vegan,
              (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              'Vegetarian',
              'Only include Vegetarian meals',
              _vegetarian,
              (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              },
            ),
          ],
        ))
      ]),
    );
  }
}
