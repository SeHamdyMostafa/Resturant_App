import 'package:flutter/material.dart';
import 'package:restaurantapp/Account_Page/ProfileBuilder.dart';
import 'package:restaurantapp/Cart_Page/Cart_Page.dart';
import 'package:restaurantapp/Favoriate_Page/Favoriate_Page.dart';
import 'package:restaurantapp/FoodPage/Food_Page.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() =>
      _BottomNavBarState();
}

class _BottomNavBarState
    extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final List _widgetOptions = [
    FoodPage(),
    const Cart_Page(),
    const Favoriate_Page(),
    ProfileBuilder()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor:Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
