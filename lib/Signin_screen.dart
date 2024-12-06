import 'package:demo_app/forgotScreen.dart';
import 'package:demo_app/profileSetup.dart';
import 'package:flutter/material.dart';

import 'Signup_screen.dart';
import 'Stylish/BusinesspageCreation.dart';
import 'Stylish/Client profilesetupScreen.dart';
import 'Stylish/buttom_sheet.dart';
import 'buttom_sheet.dart';
import 'HomeScreen.dart'; // Import the Customer Home Screen

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String selectedRole = "Customer"; // Track selected role: "Customer" or "Stylists"
  bool isPasswordVisible = false; // Password visibility toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black theme
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 90),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Welcome to ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Glamii",
                    style: TextStyle(
                      color: Color(0xff75140c),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20),
            // Two Buttons for Role Selection
            // Container(
            //   height: 60,
            //   width: 320,
            //   margin: const EdgeInsets.symmetric(horizontal: 50),
            //   padding: const EdgeInsets.symmetric(vertical: 5),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20),
            //     border: Border.all(color: Colors.white),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       SizedBox(
            //         height: 50,
            //         width: 140,
            //         child: MaterialButton(
            //           color: selectedRole == "Customer"
            //               ? const Color(0xff75140c)
            //               : Colors.white,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           onPressed: () {
            //             setState(() {
            //               selectedRole = "Customer";
            //             });
            //           },
            //           child: Text(
            //             "Customer",
            //             style: TextStyle(
            //               color: selectedRole == "Customer"
            //                   ? Colors.white
            //                   : Colors.black,
            //               fontSize: 16,
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         height: 50,
            //         width: 140,
            //         child: MaterialButton(
            //           color: selectedRole == "Stylists"
            //               ? const Color(0xff75140c)
            //               : Colors.white,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           onPressed: () {
            //             setState(() {
            //               selectedRole = "Stylists";
            //             });
            //           },
            //           child: Text(
            //             "Stylists",
            //             style: TextStyle(
            //               color: selectedRole == "Stylists"
            //                   ? Colors.white
            //                   : Colors.black,
            //               fontSize: 16,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20),

            // Sign-in Form
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.black, // Matches theme
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  const SizedBox(height: 10),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.black,
                      labelText: "Email",
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    obscureText: !isPasswordVisible, // Obscure text when not visible
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.black,
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: MaterialButton(
                      color: const Color(0xff75140c),
                      highlightColor: Colors.red.shade400,
                      height: 50,
                      shape: const StadiumBorder(),
                      onPressed: () {
                        if (selectedRole == "Customer") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen2()),
                          );
                        }
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                      );
                      // Forgot password functionality
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: const Text("Sign Up"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 1,
                        width: 40,
                        color: Colors.white,
                      ),
                      Text("Sign In with Social account",style: TextStyle(color: Colors.white),),
                      Container(
                        height: 1,
                        width: 40,
                        color: Colors.white,
                      ),


                    ],
                  ),
                  // Social Media Login Buttons with Images
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Login with Facebook
                        },
                        icon: Image.asset(
                          'assets/facebook.png',
                          height: 40,
                          width: 40,
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          // Login with Google
                        },
                        icon: Image.asset(
                          'assets/m011t0447_b_social_sign_18sep22.png',
                          height: 40,
                          width: 40,
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          // Login with Twitter
                        },
                        icon: Image.asset(
                          'assets/12.png',
                          height: 30,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
