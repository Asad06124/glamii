import 'dart:async';

import 'package:demo_app/CalenderPage.dart';
import 'package:demo_app/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'CatagoryScreen.dart';
import 'ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    CategoryViewScreen(),
    CalendarPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black, // Set dark background for the bottom bar
        child: SalomonBottomBar(
          backgroundColor: Colors.black, // Dark background
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          unselectedItemColor: Colors.grey, // Grey for unselected tabs
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text(
                "Home",
                style: TextStyle(color: _currentIndex == 0 ? Colors.white : Colors.grey),
              ),
              selectedColor: Color(0xff75140c), // Custom red color
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.category),
              title: Text(
                "Categories",
                style: TextStyle(color: _currentIndex == 1 ? Colors.white : Colors.grey),
              ),
              selectedColor: Color(0xff75140c), // Custom red color
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.calendar_month),
              title: Text(
                "Calendar",
                style: TextStyle(color: _currentIndex == 2 ? Colors.white : Colors.grey),
              ),
              selectedColor: Color(0xff75140c), // Custom red color
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(color: _currentIndex == 3 ? Colors.white : Colors.grey),
              ),
              selectedColor: Color(0xff75140c), // Custom red color
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border, // Icon for favorites
            size: 60, // Adjust the size of the icon
            color: Colors.red, // Icon color
          ),
          SizedBox(height: 20), // Add some space between the icon and text
          Text(
            'Favorites is empty', // Message
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey, // Text color
            ),
          ),
        ],
      ),
    );
  }
}
