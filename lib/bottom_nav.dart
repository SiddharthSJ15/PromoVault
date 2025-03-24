import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promo_vault/card_page.dart';
import 'package:promo_vault/const.dart';
import 'package:promo_vault/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final List _pages = [
    HomePage(), 
    CardPage(),
  ];
  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        elevation: 1,
        currentIndex: _selectedIndex,
        onTap: onItemTap,
        selectedItemColor: primaryColor,
        items: [
          BottomNavigationBarItem(
            // tooltip: ,
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(CupertinoIcons.creditcard),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home3',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home4',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home5',
          ),
        ],
      ),
    );
  }
}
