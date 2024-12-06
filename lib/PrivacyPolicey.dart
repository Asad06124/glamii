import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Policies & FAQs',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Policy Section
            sectionHeader("Company Policy"),
            const SizedBox(height: 10),
            const Text(
              "1. Customers are required to follow appointment guidelines set by the service providers.\n"
                  "2. Glamii holds the right to modify policies at any time.\n"
                  "3. All interactions must remain respectful and professional.\n"
                  "4. Misuse of the platform may result in account suspension or termination.",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Refund Policy Section
            sectionHeader("Refund Policy"),
            const SizedBox(height: 10),
            const Text(
              "1. Refunds are applicable only for cancellations made 24 hours before the appointment.\n"
                  "2. Glamii is not responsible for refunds for incomplete or unsatisfactory services.\n"
                  "3. Refunds may take 7-10 business days to process.\n"
                  "4. Contact support@glamii.com for refund-related queries.",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 20),

            // FAQ Section
            sectionHeader("Frequently Asked Questions"),
            const SizedBox(height: 10),
            faqItem(
              question: "How do I book an appointment?",
              answer:
              "You can book an appointment by selecting your desired service and clicking the 'Book Now' button.",
            ),
            const SizedBox(height: 10),
            faqItem(
              question: "What if I need to reschedule my appointment?",
              answer:
              "To reschedule, visit the 'My Appointments' section and select the reschedule option. Ensure you reschedule at least 12 hours before the appointment.",
            ),
            const SizedBox(height: 10),
            faqItem(
              question: "How do I contact customer support?",
              answer:
              "You can reach us at support@glamii.com or call our helpline at +1-800-123-4567.",
            ),
            const SizedBox(height: 10),
            faqItem(
              question: "Are there any additional service charges?",
              answer:
              "Service charges are included in the price displayed. Additional charges may apply for custom requests or add-ons.",
            ),
          ],
        ),
      ),
    );
  }

  // Helper for section headers
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

  // Helper for FAQ items
  Widget faqItem({required String question, required String answer}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          answer,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
