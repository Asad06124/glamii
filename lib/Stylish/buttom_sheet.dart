import 'dart:async';

import 'package:demo_app/CalenderPage.dart';
import 'package:demo_app/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../CatagoryScreen.dart';
import '../ProfileScreen.dart';
import 'BookingsScreens.dart';
import 'Homestylish.dart';
import 'ProfileScreen.dart';



class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ProviderHomePage(),
    BookingsScreen(),
    CalendarPage(),
    ProviderProfilePage(),
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
                "Bookings",
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


