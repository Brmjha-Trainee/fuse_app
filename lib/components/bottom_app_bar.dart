import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/views/favoriate.dart';
import 'package:fuseapp/views/home.dart';
import 'package:fuseapp/views/profile.dart';
import '../views/cart.dart';
import '../views/home.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const Profile(),
    const Cart(),
    const Favorite(),
  ];
//done-todo rawabi insert icon for the unactive + change class name to root
  @override
  Widget build(BuildContext context) => Scaffold(
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
                
         icon: Icon(Icons.favorite_border_outlined, color: COLOR_PRIMARY,),
            activeIcon: Icon(Icons.favorite, color: COLOR_PRIMARY,),
              label: "Favorites",
            ),
          ],
        ),
      );
}
