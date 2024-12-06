import 'package:demo_app/Signin_screen.dart';
import 'package:demo_app/Starting%20page.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to login screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartingPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black, // Optional: You can change the background color
      body: Center(
        child: Image.asset(
          'assets/1.png', // Path to your image asset
          width: 250, // Adjust width as needed
          height: 300, // Adjust height as needed
          fit: BoxFit.contain, // Adjust image fitting
        ),
      ),
    );
  }
}
