import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double walletBalance = 50.00; // Example balance
  final TextEditingController topUpAmountController = TextEditingController();

  final List<Map<String, String>> transactionHistory = [
    {"date": "2024-11-01", "service": "Haircut", "amount": "30.00"},
    {"date": "2024-10-25", "service": "Facial", "amount": "50.00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Wallet",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet Balance Section
            sectionHeader("Wallet Balance"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Current Balance:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "\$${walletBalance.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Top-Up Wallet Section
            sectionHeader("Top-Up Wallet"),
            const SizedBox(height: 10),
            buildTextField("Enter Top-Up Amount", topUpAmountController),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: elevatedButtonStyle(),
                onPressed: () {
                  _processTopUp();
                },
                child: const Text(
                  "Add Funds",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Transaction History Section
            sectionHeader("Transaction History"),
            const SizedBox(height: 10),
            ...transactionHistory.map(
                  (transaction) => ListTile(
                title: Text(
                  transaction["service"]!,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  transaction["date"]!,
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: Text(
                  "\$${transaction["amount"]}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Payment Options Section
            sectionHeader("Payment Options"),
            const SizedBox(height: 10),
            ElevatedButton(
              style: elevatedButtonStyle(),
              onPressed: () {
                _showCardPaymentDialog(context);
              },
              child: const Text(
                "Pay via Credit/Debit Card",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: elevatedButtonStyle(),
              onPressed: () {
                // Logic for using Glamii's wallet for payment
              },
              child: const Text(
                "Pay via Glamii Wallet",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to process top-up
  void _processTopUp() {
    if (topUpAmountController.text.isNotEmpty) {
      double topUpAmount = double.tryParse(topUpAmountController.text) ?? 0;
      if (topUpAmount > 0) {
        setState(() {
          walletBalance += topUpAmount;
          transactionHistory.add({
            "date": DateTime.now().toString().split(" ")[0],
            "service": "Wallet Top-Up",
            "amount": topUpAmount.toStringAsFixed(2),
          });
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Top-up successful! \$${topUpAmount.toStringAsFixed(2)} added to your wallet.",
            ),
          ),
        );
      } else {
        _showErrorSnackBar("Enter a valid amount to top-up.");
      }
    } else {
      _showErrorSnackBar("Please enter an amount to top-up.");
    }
    topUpAmountController.clear();
  }

  // Helper to show error messages
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Helper to show card payment dialog
  Future<void> _showCardPaymentDialog(BuildContext context) async {
    final cardNumberController = TextEditingController();
    final expiryDateController = TextEditingController();
    final cvvController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Pay via Card",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextField("Card Number", cardNumberController),
              const SizedBox(height: 10),
              buildTextField("Expiry Date (MM/YY)", expiryDateController),
              const SizedBox(height: 10),
              buildTextField("CVV", cvvController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: elevatedButtonStyle(),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Payment processed successfully."),
                  ),
                );
              },
              child: const Text(
                "Pay Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
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

  // Helper to create text fields with a consistent style
  Widget buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff75140c)),
        ),
      ),
    );
  }

  // Helper to style elevated buttons
  ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff75140c), // Red background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
