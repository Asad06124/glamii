import 'package:flutter/material.dart';

import 'AddServiceScreen.dart';
import 'EditeServiceScreen.dart';

class ViewServicesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _services = [
    {
      "name": "Haircut",
      "price": 30.0, // Ensure price is a double
      "description": "A professional haircut service.",
      "image": "assets/girl-receiving-facial-treatment-beauty-salon.jpg", // Path to the image
    },
    {
      "name": "Facial",
      "price": 50.0, // Ensure price is a double
      "description": "Relaxing facial treatment.",
      "image": "assets/girl-receiving-facial-treatment-beauty-salon.jpg", // Path to the image
    },
    {
      "name": "Massage",
      "price": 70.0, // Ensure price is a double
      "description": "Full-body massage for relaxation.",
      "image": "assets/girl-receiving-facial-treatment-beauty-salon.jpg", // Path to the image
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "My Services",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddServiceScreen(),));
              // Handle Add Service action
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Add Service button clicked")),
              );
            },
          ),
        ],
      ),
      body: _services.isEmpty
          ? _buildNoServicesMessage()
          : ListView.builder(
        itemCount: _services.length,
        itemBuilder: (context, index) {
          final service = _services[index];
          return _buildServiceCard(
            context,
            name: service['name']!,
            price: service['price']!,
            description: service['description']!,
            imagePath: service['image']!,
          );
        },
      ),
    );
  }

  Widget _buildNoServicesMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.info_outline,
            color: Colors.grey,
            size: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            'No Services Added!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Text(
            'Use the "+" button to add a new service.',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
      BuildContext context, {
        required String name,
        required double price,
        required String description,
        required String imagePath,
      }) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),

            // Service Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Edit Button
            ElevatedButton(
              onPressed: () {
                // Handle Edit action
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditServiceScreen(
                      service: {
                        "name": "Haircut",
                        "price": 30.0,
                        "description": "A professional haircut service.",
                        "timeSlots": ["9:00 AM - 10:00 AM", "11:00 AM - 12:00 PM"],
                        "image": null, // Replace with actual image path if available
                      },
                    ),
                  ),
                );

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff75140c),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                "Edit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
