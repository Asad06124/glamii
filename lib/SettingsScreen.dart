import 'package:flutter/material.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  _GeneralSettingsScreenState createState() => _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  bool darkMode = true; // Toggle for dark mode
  bool locationAccess = true; // Toggle for location access
  bool dataSaver = false; // Toggle for data saver
  bool autoUpdate = true; // Toggle for auto-updates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'General Settings',
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
              'Customize your general app preferences',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            // General Settings Options
            _buildSettingOption(
              title: 'Dark Mode',
              description: 'Enable or disable dark mode.',
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
            _buildSettingOption(
              title: 'Location Access',
              description: 'Allow the app to access your location.',
              value: locationAccess,
              onChanged: (value) {
                setState(() {
                  locationAccess = value;
                });
              },
            ),
            _buildSettingOption(
              title: 'Data Saver',
              description: 'Reduce data usage by optimizing content.',
              value: dataSaver,
              onChanged: (value) {
                setState(() {
                  dataSaver = value;
                });
              },
            ),
            _buildSettingOption(
              title: 'Auto Updates',
              description: 'Automatically download and install updates.',
              value: autoUpdate,
              onChanged: (value) {
                setState(() {
                  autoUpdate = value;
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
                        'General settings saved successfully!',
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

  Widget _buildSettingOption({
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
