import 'package:flutter/material.dart';

import 'BooksDetailsScreen.dart';


class BookingsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bookings = [
    {
      'id': '1',
      'service': 'Haircut',
      'provider': 'John\'s Salon',
      'date': '2024-11-20',
      'time': '3:00 PM',
      'status': 'Confirmed',
    },
    {
      'id': '2',
      'service': 'Facial',
      'provider': 'Glow Spa',
      'date': '2024-11-21',
      'time': '10:00 AM',
      'status': 'Pending',
    },
    {
      'id': '3',
      'service': 'Massage',
      'provider': 'Relax Center',
      'date': '2024-11-22',
      'time': '5:30 PM',
      'status': 'Cancelled',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "My Bookings",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: bookings.isEmpty
          ? _buildNoBookingsMessage()
          : ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return _buildBookingCard(context, booking);
        },
      ),
    );
  }

  Widget _buildNoBookingsMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.event_busy,
            color: Colors.grey,
            size: 100,
          ),
          SizedBox(height: 20),
          Text(
            'No Bookings Yet!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Book a service to see it here.',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context, Map<String, dynamic> booking) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(
          booking['service'],
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Provider: ${booking['provider']}',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'Date: ${booking['date']} | Time: ${booking['time']}',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'Status: ${booking['status']}',
              style: TextStyle(
                color: _getStatusColor(booking['status']),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingDetailsScreen(
                  bookingId: booking['id'],
                  serviceName: booking['service'],
                  providerName: booking['provider'],
                  date: booking['date'],
                  time: booking['time'],
                  status: booking['status'],
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff75140c),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text(
            "Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
