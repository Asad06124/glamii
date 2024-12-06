import 'package:flutter/material.dart';

class BusinessPagesViewScreen extends StatelessWidget {
  final List<Map<String, dynamic>> businessPages = [
    {
      "name": "Glam Salon",
      "address": "123 Beauty St, New York",
      "logo": "assets/close-up-manicurist-painting-nails.jpg", // Replace with your image assets
      "rating": 4.7,
      "services": ["Haircut", "Facial", "Manicure"],
    },
    {
      "name": "Luxury Spa",
      "address": "456 Relax Ln, California",
      "logo": "assets/close-up-manicurist-painting-nails.jpg",
      "rating": 4.5,
      "services": ["Massage", "Aromatherapy", "Body Scrub"],
    },
    {
      "name": "Nail Heaven",
      "address": "789 Polish Rd, Florida",
      "logo": "assets/close-up-manicurist-painting-nails.jpg",
      "rating": 4.9,
      "services": ["Nail Art", "Pedicure", "Gel Nails"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Business Pages",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: businessPages.length,
        itemBuilder: (context, index) {
          final business = businessPages[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BusinessDetailPage(business: business),
                ),
              );
            },
            child: Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        business["logo"],
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            business["name"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            business["address"],
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                business["rating"].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class BusinessDetailPage extends StatelessWidget {
  final Map<String, dynamic> business;

  const BusinessDetailPage({Key? key, required this.business}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          business["name"],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Business Logo and Address
              Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        business["logo"],
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      business["address"],
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Services Section
              sectionHeader("Services Offered"),
              const SizedBox(height: 10),
              ...business["services"].map((service) => ListTile(
                leading: const Icon(Icons.check, color: Colors.white),
                title: Text(
                  service,
                  style: const TextStyle(color: Colors.white),
                ),
              )),
              const SizedBox(height: 20),

              // Portfolio Section
              sectionHeader("Portfolio"),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    portfolioImage("assets/sample.jpg"),
                    portfolioImage("assets/sample.jpg"),
                    portfolioImage("assets/sample.jpg"),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Call to Action Section
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff75140c),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Booking logic
                  },
                  child: const Text(
                    "Book Now",
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

  // Helper to create portfolio image cards
  Widget portfolioImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
