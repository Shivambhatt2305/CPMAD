import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/screens/home_screen.dart';
import 'package:invoice_app/screens/product_screen.dart';
import 'package:invoice_app/screens/profile_screen.dart';
import 'package:invoice_app/screens/settings_screen.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  List screens = [HomeScreen(), ProfileScreen(),ProductScreen(), SettingsScreen()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Invoice App")),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
      //params
      onPressed: () {},
      child: Icon(Icons.add),
   ),
   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
      icons: [Icons.home, Icons.person, Icons.settings,Icons.add_box],
      activeIndex: currentIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) => setState(() => currentIndex = index),
      //other params
   ),
    );
  }
}