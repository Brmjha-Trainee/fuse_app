import 'package:flutter/material.dart';
//import '../screens/cart.dart';
import '../views/home.dart';
//import '../screens/profile.dart';
//import '../screens/favourite.sdart';

class BottomN extends StatefulWidget {
  const BottomN({Key? key}) : super(key: key);

  @override
  _BottomNState createState() => _BottomNState();
}

class _BottomNState extends State<BottomN> {
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
