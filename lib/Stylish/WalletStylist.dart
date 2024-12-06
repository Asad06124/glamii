import 'package:flutter/material.dart';

class WalletWithdrawalScreen extends StatefulWidget {
  const WalletWithdrawalScreen({super.key});

  @override
  State<WalletWithdrawalScreen> createState() =>
      _WalletWithdrawalScreenState();
}

class _WalletWithdrawalScreenState extends State<WalletWithdrawalScreen> {
  double walletBalance = 100.00; // Example balance
  final TextEditingController withdrawalAmountController =
  TextEditingController();

  final List<Map<String, String>> transactionHistory = [
    {"date": "2024-11-01", "service": "Withdrawal", "amount": "-50.00"},
    {"date": "2024-10-25", "service": "Haircut Payment", "amount": "+30.00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wallet - Withdraw Funds",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
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

            // Withdraw Funds Section
            sectionHeader("Withdraw Funds"),
            const SizedBox(height: 10),
            buildTextField("Enter Withdrawal Amount", withdrawalAmountController),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: elevatedButtonStyle(),
                onPressed: () {
                  _processWithdrawal();
                },
                child: const Text(
                  "Withdraw Funds",
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
                  "500",
                  style: TextStyle(
                    color: transaction["amount"]!.startsWith('-')
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to process withdrawal
  void _processWithdrawal() {
    if (withdrawalAmountController.text.isNotEmpty) {
      double withdrawalAmount =
          double.tryParse(withdrawalAmountController.text) ?? 0;
      if (withdrawalAmount > 0 && withdrawalAmount <= walletBalance) {
        setState(() {
          walletBalance -= withdrawalAmount;
          transactionHistory.add({
            "date": DateTime.now().toString().split(" ")[0],
            "service": "Withdrawal",
            "amount": "-${withdrawalAmount.toStringAsFixed(2)}",
          });
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Withdrawal successful! \$${withdrawalAmount.toStringAsFixed(2)} withdrawn from your wallet.",
            ),
          ),
        );
      } else if (withdrawalAmount > walletBalance) {
        _showErrorSnackBar("Insufficient balance for this withdrawal.");
      } else {
        _showErrorSnackBar("Enter a valid amount to withdraw.");
      }
    } else {
      _showErrorSnackBar("Please enter an amount to withdraw.");
    }
    withdrawalAmountController.clear();
  }

  // Helper to show error messages
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
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
