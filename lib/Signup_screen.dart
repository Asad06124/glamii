import 'package:flutter/material.dart';
import 'package:demo_app/Stylish/Client%20profilesetupScreen.dart';
import 'package:demo_app/profileSetup.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String selectedRole = "Client"; // Default role
  bool isPasswordVisible = false; // Password visibility toggle

  // List of services and selected services
  final List<String> services = [
    "Hair Styling",
    "Makeup",
    "Massage",
    "Nail Art",
    "Facial",
  ];
  final List<String> selectedServices = [];
  String? selectedexperinece;
  final List<String> experince = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "10+"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black, // Black theme
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              const SizedBox(height: 30),

              // Role Selection Buttons
              Container(
                height: 60,
                // width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 120,
                      child: MaterialButton(
                        color: selectedRole == "Client"
                            ? const Color(0xff75140c)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedRole = "Client";
                          });
                        },
                        child: Text(
                          "Client",
                          style: TextStyle(
                            color: selectedRole == "Client"
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 122,
                      child: MaterialButton(
                        color: selectedRole == "Beauty"
                            ? const Color(0xff75140c)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedRole = "Beauty";
                          });
                        },
                        child: Text(
                          "Beauty  Professional",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedRole == "Beauty"
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Dynamic Form
              if (selectedRole == "Client")
                buildCustomerSignupForm()
              else
                buildStylistSignupForm(),

              // Signup Button
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: MaterialButton(
                    color: const Color(0xff75140c),
                    height: 50,
                    shape: const StadiumBorder(),
                    onPressed: () {
                      if (selectedRole == "Client") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const ClientProfileSetupScreen()),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const ProfileSetupScreen()),
                        );
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Sign In"),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 1,
                    width: 80,
                    color: Colors.white,
                  ),
                  Text("Sign up with Social account",style: TextStyle(color: Colors.white),),
                  Container(
                    height: 1,
                    width: 80,
                    color: Colors.white,
                  ),


                ],
              ),
              SizedBox(height: 10,),

              // Social Media Login Buttons in Row (Only Icons)
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Customer Signup Form
  Widget buildCustomerSignupForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          buildTextField("First Name"),
          const SizedBox(height: 10),
          buildTextField("Last Name"),
          const SizedBox(height: 10),
          buildTextField("Email"),
          const SizedBox(height: 10),
          buildPasswordField("Password"),
          const SizedBox(height: 10),
          buildTextField("Phone Number"),
        ],
      ),
    );
  }

  // Stylist Signup Form
  Widget buildStylistSignupForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          buildTextField("First Name"),
          const SizedBox(height: 10),
          buildTextField("Last Name"),
          const SizedBox(height: 10),
          buildTextField("Email"),
          const SizedBox(height: 10),
          buildPasswordField("Password"),
          const SizedBox(height: 10),
          buildTextField("Phone Number"),
          // const SizedBox(height: 20),
          // SizedBox(
          //   height: 55,
          //   width: double.infinity,
          //   child: GestureDetector(
          //     onTap: () => _showMultiSelectDialog(context),
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          //       decoration: BoxDecoration(
          //         color: Colors.black,
          //         borderRadius: BorderRadius.circular(12),
          //         border: Border.all(color: Colors.white),
          //       ),
          //       child: Text(
          //         selectedServices.isNotEmpty
          //             ? selectedServices.join(", ")
          //             : "Select Services",
          //         style: const TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 20),
          // DropdownButtonFormField<String>(
          //   style: TextStyle(color: Colors.white),
          //   dropdownColor: Colors.black,
          //   value: selectedexperinece,
          //   onChanged: (String? newValue) {
          //     setState(() {
          //       selectedexperinece = newValue!;
          //     });
          //   },
          //   items: experince.map<DropdownMenuItem<String>>((String service) {
          //     return DropdownMenuItem<String>(
          //       value: service,
          //       child: Text(service),
          //     );
          //   }).toList(),
          //   decoration: InputDecoration(
          //     labelText: "Year of Experience",
          //     labelStyle: const TextStyle(color: Colors.white),
          //     filled: true,
          //     fillColor: Colors.black,
          //
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       borderSide: const BorderSide(color: Colors.white),
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       borderSide: const BorderSide(color: Colors.white),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       borderSide: const BorderSide(color: Color(0xff75140c)),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Show Multi-Select Dialog
  void _showMultiSelectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Temporary state for managing checkbox selection
        List<String> tempSelectedServices = List.from(selectedServices);

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter dialogSetState) {
            return AlertDialog(
              title: const Text("Select Services"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: services.map((service) {
                    return CheckboxListTile(
                      title: Text(service),
                      value: tempSelectedServices.contains(service),
                      onChanged: (bool? isChecked) {
                        dialogSetState(() {
                          if (isChecked == true) {
                            tempSelectedServices.add(service);
                          } else {
                            tempSelectedServices.remove(service);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    // Update the main state with the selected items
                    setState(() {
                      selectedServices.clear();
                      selectedServices.addAll(tempSelectedServices);
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text("Confirm"),
                ),
              ],
            );
          },
        );
      },
    );
  }



  // Reusable TextField
  Widget buildTextField(String labelText) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff75140c)),
        ),
      ),
    );
  }

  // Password Field with Eye Button
  Widget buildPasswordField(String labelText) {
    return TextFormField(
      obscureText: !isPasswordVisible,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff75140c)),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
      ),
    );
  }
}
