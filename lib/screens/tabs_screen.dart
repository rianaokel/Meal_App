import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_Drawer.dart';
import 'categories_screens.dart';
import 'favorite_Screen.dart';

class tabsScreen extends StatefulWidget {

  @override
  State<tabsScreen> createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {

   final List<Map<String, Object>> _pages = [
    {
      "page" : CategoriesScreen(),
      'title' : 'Categories',
    },
    {
      "page" : favoriteScreen(),
      'title' : 'Favorites',
    }
  ];

  int _selectedPageIndex = 0;

  void _selectBottomNavigationBar(int value) {

    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(_pages[_selectedPageIndex]["title"].toString())),
      body: _pages[_selectedPageIndex]["page"] as Widget ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectBottomNavigationBar,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "favorite",)
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: MainDrawer(),
    );
  }
}