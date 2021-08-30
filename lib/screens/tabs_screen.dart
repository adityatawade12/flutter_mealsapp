import 'package:flutter/material.dart';
import 'package:flutter_mealsapp/screens/categories_screen.dart';
import 'package:flutter_mealsapp/screens/favourites_screen.dart';
import 'package:flutter_mealsapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {"page": CategoriesScreen(), "title": 'Categories'},
    {"page": FavouritesScreen(), "title": "Favourites"}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: (_pages[_selectedPageIndex]['page'] as Widget),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.category,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favourites")
        ],
      ),
    );
  }
}


// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Meals"),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: "Categories",
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: "Favourites",
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(children: [CategoriesScreen(), FavouritesScreen()]),
//       ),
//     );
//   }
// }
