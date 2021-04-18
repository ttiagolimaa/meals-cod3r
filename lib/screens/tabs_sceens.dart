import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';

import 'caregories_screen.dart';
import 'favorite_screen.dart';
import '../models/meal.dart';

class _TabScreenType {
  final Widget screen;
  final String title;

  _TabScreenType({required this.screen, required this.title});
}

class TabsScreens extends StatefulWidget {
  final List<Meal> favoritesMeals;

  TabsScreens(this.favoritesMeals);
  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  int _selectedScreenIndex = 0;
  late List<_TabScreenType> _screens;

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      _TabScreenType(screen: CategoriesScreen(), title: 'Lista de Categorias'),
      _TabScreenType(
          screen: FavoriteScreen(widget.favoritesMeals),
          title: 'Meus Favoritos'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex].title),
      ),
      body: _screens[_selectedScreenIndex].screen,
      drawer: Drawer(
        child: MainDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
