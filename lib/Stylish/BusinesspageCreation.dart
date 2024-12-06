import 'package:demo_app/Stylish/buttom_sheet.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class BusinessPageCreationScreen extends StatefulWidget {
  const BusinessPageCreationScreen({super.key});

  @override
  State<BusinessPageCreationScreen> createState() =>
      _BusinessPageCreationScreenState();
}

class _BusinessPageCreationScreenState
    extends State<BusinessPageCreationScreen> {
  final _formKey = GlobalKey<FormState>();

  // State variables
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessAddressController =
  TextEditingController();
  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController servicePriceController = TextEditingController();
  final TextEditingController openingHoursController = TextEditingController();
  final TextEditingController brandingDetailsController =
  TextEditingController();
  final List<Map<String, dynamic>> services = [];
  final List<Map<String, dynamic>> teamMembers = [];
  final List<Map<String, dynamic>> portfolio = [];

  String? businessLogoPath;
  double overallRating = 4.5; // Example static rating, can be updated later.

  // Helper functions
  Future<void> pickImage(Function(String) onPicked) async {
    // Implement image picking logic
    String dummyPath = "assets/sample.jpg"; // Replace with picked image logic
    onPicked(dummyPath);
  }

  void addService(String name, String price) {
    setState(() {
      services.add({'name': name, 'price': price});
    });
  }

  void addTeamMember(String name, String role) {
    setState(() {
      teamMembers.add({'name': name, 'role': role});
    });
  }

  void addPortfolioItem(String imagePath) {
    setState(() {
      portfolio.add({'image': imagePath});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Business Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Business Profile
              sectionHeader("Business Profile"),
              const SizedBox(height: 10),
              buildTextField("Business Name", businessNameController),
              const SizedBox(height: 10),
              buildTextField("Business Address", businessAddressController),
              const SizedBox(height: 20),

              // Portfolio of Work
              sectionHeader("Portfolio of Work"),
              const SizedBox(height: 10),
              ...portfolio.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Image.file(
                  File(item['image']),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              )),
              ElevatedButton(
                style: elevatedButtonStyle(),
                onPressed: () {
                  pickImage((imagePath) => addPortfolioItem(imagePath));
                },
                child: const Text(
                  "Upload Portfolio Photo",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Overall Business Reviews: ${overallRating.toStringAsFixed(1)} / 5.0",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Services and Hours
              sectionHeader("Services and Hours"),
              const SizedBox(height: 10),
              ...services.map((service) => ListTile(
                title: Text(
                  service['name'],
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  "\$${service['price']}",
                  style: const TextStyle(color: Colors.white),
                ),
              )),
              ElevatedButton(
                style: elevatedButtonStyle(),
                onPressed: () {
                  _showAddServiceDialog(context);
                },
                child: const Text(
                  "Add Service",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              buildTextField("Opening Hours (e.g., 9:00 AM - 5:00 PM)",
                  openingHoursController),
              const SizedBox(height: 20),

              // Logo and Branding
              sectionHeader("Logo and Branding"),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  pickImage((imagePath) {
                    setState(() {
                      businessLogoPath = imagePath;
                    });
                  });
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: businessLogoPath != null
                      ? FileImage(File(businessLogoPath!))
                      : null,
                  child: businessLogoPath == null
                      ? const Icon(Icons.add_a_photo, size: 30)
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              buildTextField(
                "Branding Details (Optional)",
                brandingDetailsController,
              ),
              const SizedBox(height: 20),

              // Team Management
              sectionHeader("Team Management"),
              const SizedBox(height: 10),
              ...teamMembers.map((member) => ListTile(
                title: Text(
                  member['name'],
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  member['role'],
                  style: const TextStyle(color: Colors.white),
                ),
              )),
              ElevatedButton(
                style: elevatedButtonStyle(),
                onPressed: () {
                  _showAddTeamMemberDialog(context);
                },
                child: const Text(
                  "Add Employee/Contractor",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // Call to Action
              sectionHeader("Call to Action"),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: elevatedButtonStyle(),
                  onPressed: () {
                    // Logic for booking
                  },
                  child: const Text(
                    "Book Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: elevatedButtonStyle(),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen2(),));
                    if (_formKey.currentState!.validate()) {
                      // Save Business Page Logic
                    }
                  },
                  child: const Text(
                    "Save Business Page",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to show dialog for adding service
  Future<void> _showAddServiceDialog(BuildContext context) async {
    final nameController = TextEditingController();
    final priceController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Add Service",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextField("Service Name", nameController),
              const SizedBox(height: 10),
              buildTextField("Service Price", priceController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: elevatedButtonStyle(),
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    priceController.text.isNotEmpty) {
                  addService(nameController.text, priceController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  // Helper to show dialog for adding team members
  Future<void> _showAddTeamMemberDialog(BuildContext context) async {
    final nameController = TextEditingController();
    final roleController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Add Team Member",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextField("Name", nameController),
              const SizedBox(height: 10),
              buildTextField("Role", roleController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: elevatedButtonStyle(),
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    roleController.text.isNotEmpty) {
                  addTeamMember(nameController.text, roleController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  // Helper to create section headers
  Widget sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // Helper to create text fields with a consistent style
  Widget buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
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
      validator: (value) => value!.isEmpty ? "$label is required" : null,
    );
  }

  // Helper to style elevated buttons
  ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff75140c),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
