import 'package:flutter/material.dart';

import 'ServiceDetailScreen.dart';

class WishlistScreen extends StatelessWidget {
  // Mock data for wishlist services
  final List<Map<String, dynamic>> wishlistServices = [
    {
      "name": "Nail Art",
      "provider": "Elegant Nails Studio",
      "rating": 4.6,
      "price": 30.0,
      "image": "assets/close-up-manicurist-painting-nails.jpg",
    },
    {
      "name": "Body Massage",
      "provider": "Relaxation Spa",
      "rating": 4.8,
      "price": 70.0,
      "image": "assets/wellness-concept-with-woman-massage-salon.jpg",
    },
    {
      "name": "Haircut",
      "provider": "Elite Hair Studio",
      "rating": 4.5,
      "price": 40.0,
      "image": "assets/high-angle-woman-hair-salon.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Wishlist',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: wishlistServices.isEmpty
          ? Center(
        child: Text(
          'Your wishlist is empty!',
          style: TextStyle(color: Colors.grey[400], fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: wishlistServices.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final service = wishlistServices[index];
          return _buildWishlistCard(
            context,
            service['name'],
            service['provider'],
            service['rating'],
            service['price'],
            service['image'],
          );
        },
      ),
    );
  }

  Widget _buildWishlistCard(
      BuildContext context,
      String serviceName,
      String providerName,
      double rating,
      double price,
      String image,
      ) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          serviceName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              providerName,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text(
                  '$rating',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            Text(
              '\$$price',
              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            // Handle removing the service from wishlist
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: Colors.grey[900],
                title: const Text(
                  'Remove from Wishlist',
                  style: TextStyle(color: Colors.white),
                ),
                content: Text(
                  'Are you sure you want to remove $serviceName from your wishlist?',
                  style: const TextStyle(color: Colors.grey),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Logic to remove the service from the wishlist list
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Remove',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        onTap: () {
          // Navigate to service details screen
          // You can replace this with the service detail screen navigation logic
          Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailScreen(),));
        },
      ),
    );
  }
}
