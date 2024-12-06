import 'package:flutter/material.dart';

import '../ChatScreen.dart';

class BookingDetailsScreen extends StatefulWidget {
  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  // Static data for demonstration
  final String bookingId = "123456";
  final String customerName = "John Doe";
  final String serviceName = "Haircut";
  final String appointmentTime = "2024-11-25, 3:00 PM";

  String appointmentStatus = "Pending"; // Initial status

  void _startAppointment() {
    setState(() {
      appointmentStatus = "In Progress";
    });
  }

  void _finishAppointment() {
    setState(() {
      appointmentStatus = "Waiting for Customer Confirmation";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Booking Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Booking Details Content
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 80),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Booking Details Header
                    Card(
                      color: Colors.grey[900],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Booking ID: $bookingId",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Customer: $customerName",
                              style: const TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Service: $serviceName",
                              style: const TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Appointment Time: $appointmentTime",
                              style: const TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text(
                                  "Status: ",
                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                ),
                                Text(
                                  appointmentStatus,
                                  style: TextStyle(
                                    color: _getStatusColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'About Customer',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      color: Colors.grey[850],
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Provider Name: Alice Johnson',
                                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Expert Skin Specialist',
                                  style: TextStyle(color: Colors.grey, fontSize: 14),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to chat screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatScreen(providerName: "Alice Johnson",),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff75140c),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                'Chat',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Fixed Buttons at the Bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: appointmentStatus == "Pending"
                    ? _buildActionButton(
                  label: "Start Appointment",
                  color: Colors.green,
                  onPressed: _startAppointment,
                )
                    : appointmentStatus == "In Progress"
                    ? _buildActionButton(
                  label: "Finish Appointment",
                  color: Colors.red,
                  onPressed: _finishAppointment,
                )
                    : const Center(
                  child: Text(
                    "Waiting for Customer Confirmation",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (appointmentStatus) {
      case "Pending":
        return Colors.amber;
      case "In Progress":
        return Colors.blue;
      case "Waiting for Customer Confirmation":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
