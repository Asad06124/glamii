import 'package:flutter/material.dart';

import 'BookingDetailScreen.dart';

class BookingsScreen extends StatelessWidget {
  final List<Map<String, String>> bookings = [
    {
      'service': 'Haircut',
      'provider': 'John\'s Salon',
      'date': '2024-11-20',
      'time': '3:00 PM',
      'status': 'Confirmed',
    },
    {
      'service': 'Facial',
      'provider': 'Glow Spa',
      'date': '2024-11-21',
      'time': '10:00 AM',
      'status': 'Pending',
    },
    {
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
        centerTitle: true,
        title: Column(
          children: [
            Container(
              height: 50,
              width: 150,
              // color: Colors.white,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/6.png"),fit: BoxFit.cover)
              ),
            ),


          ],
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
             Text(
              'My Bookings',
              style: TextStyle(color: Colors.white,fontSize:25 ),
            ),
            Container(
              height: 683,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: bookings.isEmpty
                    ? _buildNoBookingsMessage()
                    : ListView.builder(
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return _buildBookingCard(
                      context,
                      service: booking['service']!,
                      provider: booking['provider']!,
                      date: booking['date']!,
                      time: booking['time']!,
                      status: booking['status']!,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoBookingsMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.event_busy,
            color: Colors.grey,
            size: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            'No Bookings Yet!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Text(
            'Book a service to see it here.',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingCard(
      BuildContext context, {
        required String service,
        required String provider,
        required String date,
        required String time,
        required String status,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookingDetailsScreen(),));
      },
      child: Card(
        color: Colors.grey[900],
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Provider: $provider',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date: $date',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    'Time: $time',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Status: ',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      color: _getStatusColor(status),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add reschedule functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff75140c),
                      padding:
                       EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child:  Text('Reschedule',style: TextStyle(color:Colors.white),),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      // Add cancel functionality here
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red[400]!),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              )
            ],
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
