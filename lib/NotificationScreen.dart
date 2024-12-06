import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool promotionalNotifications = true;
  bool appointmentReminders = true;
  bool serviceUpdates = false;
  bool specialOffers = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Notification Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage your notification preferences',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            // Notification Settings Options
            _buildNotificationOption(
              title: 'Promotional Notifications',
              description: 'Get updates on promotions and discounts.',
              value: promotionalNotifications,
              onChanged: (value) {
                setState(() {
                  promotionalNotifications = value;
                });
              },
            ),
            _buildNotificationOption(
              title: 'Appointment Reminders',
              description: 'Receive reminders for upcoming appointments.',
              value: appointmentReminders,
              onChanged: (value) {
                setState(() {
                  appointmentReminders = value;
                });
              },
            ),
            _buildNotificationOption(
              title: 'Service Updates',
              description: 'Stay informed about service changes or delays.',
              value: serviceUpdates,
              onChanged: (value) {
                setState(() {
                  serviceUpdates = value;
                });
              },
            ),
            _buildNotificationOption(
              title: 'Special Offers',
              description: 'Be the first to know about exclusive offers.',
              value: specialOffers,
              onChanged: (value) {
                setState(() {
                  specialOffers = value;
                });
              },
            ),

            const Spacer(),

            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic to save preferences
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Notification settings saved successfully!',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff75140c),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Save Settings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationOption({
    required String title,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        trailing: Switch(
          value: value,
          activeColor: Colors.green,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
