import 'package:demo_app/MyReviewsClient.dart';
import 'package:demo_app/Signin_screen.dart';
import 'package:demo_app/Stylish/WalletStylist.dart';
import 'package:demo_app/ViewPointScreen.dart';
import 'package:flutter/material.dart';

import '../EditeProfileScreen.dart';
import '../NotificationScreen.dart';
import '../PrivacyPolicey.dart';
import '../SettingsScreen.dart';
import 'BussinessPageView.dart';
import 'ChatList.dart';
import 'EditeProviderScreen.dart';
import 'ProviderServiesScreen.dart';

class ProviderProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Container(
          height: 50,
          width: 150,
          // color: Colors.white,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/6.png"),fit: BoxFit.cover)
          ),
        ),
        centerTitle: true,

        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Provider Profile",
              style: TextStyle(color: Colors.white,fontSize: 30),
            ),
            const SizedBox(height: 40),

            // Profile Picture with Edit Button
            Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/avatar.jpg'), // Avatar image
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProviderProfileScreen(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color(0xff75140c),
                      child: const Icon(Icons.edit, color: Colors.white, size: 18),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // User Name and Email
            const Text(
              'Provider Name', // Replace with dynamic name if needed
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'provider@example.com', // Replace with dynamic email if needed
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
              ),
            ),

            const SizedBox(height: 20),

            // Loyalty Card Section
            _buildLoyaltyCard(context),

            const SizedBox(height: 20),
            Divider(thickness: 1.5, color: Colors.grey[700]),
            const SizedBox(height: 10),

            // Profile Options Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ProfileOptionCard(
                    icon: Icons.chat,
                    title: 'Chats',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatListScreen()),
                      );
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.work,
                    title: 'Services',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewServicesScreen()),
                      );
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.wallet,
                    title: 'Wallet',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WalletWithdrawalScreen()),
                      );
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GeneralSettingsScreen()),
                      );
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.settings,
                    title: 'Business page',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BusinessPagesViewScreen()),
                      );
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.reviews,
                    title: 'Reviews',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewsScreen()),
                      );
                      // Handle theme settings action
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.notifications,
                    title: 'Notification Settings',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationSettingsScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Divider(thickness: 1.5, color: Colors.grey[700]),
            const SizedBox(height: 10),

            // Logout and About Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ProfileOptionCard(
                    icon: Icons.policy,
                    title: 'Policies & FAQs',
                    onTap: () {
                      Navigator.push(context,  MaterialPageRoute(builder: (context) => PolicyScreen(),));
                    },
                  ),
                  const SizedBox(height: 10),
                  ProfileOptionCard(
                    icon: Icons.info,
                    title: 'About',
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: 'Provider App',
                        applicationVersion: '1.0.0',
                        applicationIcon: const Icon(Icons.info, color: Color(0xff75140c)),
                        children: const [
                          Text(
                            'This app allows service providers to manage bookings, services, and customer interactions seamlessly.',
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => SigninScreen(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff75140c),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'App Version: 1.0.0',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoyaltyCard(BuildContext context) {
    return Card(
      color: const Color(0xff75140c), // Your custom red color
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Loyalty Points',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'You have 4500 points',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPointsScreen(),));
                // Add functionality for loyalty points
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'View',
                style: TextStyle(
                  color: Color(0xff75140c),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for each profile option card
class ProfileOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOptionCard({
    required this.icon,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900], // Dark background for cards
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xff75140c)), // Your custom red icon color
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white, // White text color
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
