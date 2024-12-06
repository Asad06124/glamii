import 'dart:async';
import 'package:demo_app/Signin_screen.dart';
import 'package:demo_app/Stylish/BusinesspageCreation.dart';
import 'package:demo_app/buttom_sheet.dart';
import 'package:flutter/material.dart';

class WaitForApprovalScreen extends StatefulWidget {
  final bool stylist;
  const WaitForApprovalScreen({super.key, required this.stylist});

  @override
  State<WaitForApprovalScreen> createState() => _WaitForApprovalScreenState();
}

class _WaitForApprovalScreenState extends State<WaitForApprovalScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Navigate to SigninScreen after 30 seconds
    _timer = Timer(Duration(seconds: 30), () {
      if(widget.stylist==true){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BusinessPageCreationScreen()),
        );
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );

      }

    });
  }

  @override
  void dispose() {
    // Cancel the timer when the screen is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.hourglass_top,
                size: 100,
                color: Color(0xff75140c),
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Profile is Under Review",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "Thank you for your interest in joining Glamii. Your application has been received. We are continually reviewing applications, and will notify you as soon as we can.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff75140c)),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff75140c),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SigninScreen()),
                    // );
                  },
                  child: const Text(
                    "Contact Support",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
