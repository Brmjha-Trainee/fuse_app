import 'package:flutter/material.dart';
import 'package:fuseapp/views/favoriate.dart';
import 'package:fuseapp/views/home.dart';
import 'package:fuseapp/views/profile.dart';
import '../views/cart.dart';
import '../views/home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const Cart(),
    const Profile(),
    const Favourite(),
  ];

  @override
     Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined ),
                 activeIcon: Icon(Icons.home ),
           
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
                
         icon: Icon(Icons.favorite_border_outlined),
            activeIcon: Icon(Icons.favorite),
              label: "Favorites",
            ),
          ],
        ),
      );
}
