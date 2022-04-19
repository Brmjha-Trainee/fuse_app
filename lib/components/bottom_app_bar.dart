import 'package:flutter/material.dart';
import 'package:fuseapp/views/favoriate.dart';
import 'package:fuseapp/views/home.dart';
import 'package:fuseapp/views/profile.dart';
import '../views/cart.dart';
import '../views/home.dart';

class root extends StatefulWidget {
  const root({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<root> {
    int currentIndex = 0;
  final screens = [
    const HomePage(),
    const Cart(),
    const Profile(),
    const Favourite(),
  ];
//todo rawabi insert icon for the unactive + change class name to root
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
              activeIcon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              activeIcon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              activeIcon: Icon(Icons.favorite_outlined),
              label: "Favorites",
            ),
          ],
        ),
      );
}
