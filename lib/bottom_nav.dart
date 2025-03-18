import 'package:flutter/material.dart';
import 'package:promo_vault/const.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('data')),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items:  [
          BottomNavigationBarItem(backgroundColor: primaryColor,icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(backgroundColor: primaryColor,icon: Icon(Icons.home), label: 'Home2'),
          BottomNavigationBarItem(backgroundColor: primaryColor,icon: Icon(Icons.home), label: 'Home3'),
          BottomNavigationBarItem(backgroundColor: primaryColor,icon: Icon(Icons.home), label: 'Home4'),
          BottomNavigationBarItem(backgroundColor: primaryColor,icon: Icon(Icons.home), label: 'Home5'),
        ],
      ),
    );
  }
}
