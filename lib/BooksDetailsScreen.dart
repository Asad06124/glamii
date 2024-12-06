import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatefulWidget {
  final String bookingId;
  final String serviceName;
  final String providerName;
  final String date;
  final String time;
  final String status;

  const BookingDetailsScreen({
    Key? key,
    required this.bookingId,
    required this.serviceName,
    required this.providerName,
    required this.date,
    required this.time,
    required this.status,
  }) : super(key: key);

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  String appointmentStatus = "Pending"; // Initial status

  void _completeAppointment() {
    setState(() {
      appointmentStatus = "Completed";
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
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.grey[900],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Service: ${widget.serviceName}",
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Provider: ${widget.providerName}",
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Date: ${widget.date}",
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Time: ${widget.time}",
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                "Status: ",
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                appointmentStatus,
                                style: TextStyle(
                                  color: appointmentStatus == "Pending"
                                      ? Colors.orange
                                      : appointmentStatus == "Completed"
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: appointmentStatus == "Pending" ? _completeAppointment : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: appointmentStatus == "Pending" ? Colors.green : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  fixedSize: Size(300, 70),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  appointmentStatus == "Pending" ? "Complete Appointment" : "Completed",
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
