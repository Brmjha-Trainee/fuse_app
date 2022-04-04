import 'package:flutter/material.dart';
import '../view_model/cart.dart';
import '../views/home.dart';
//import '../screens/profile.dart';
//import '../screens/favourite.sdart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
   // const Cart(),
//const profile (),
//const favourite() ,
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),        
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
          ],
        ),
      );
}
