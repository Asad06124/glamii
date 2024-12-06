import 'package:flutter/material.dart';

class AddServiceScreen extends StatefulWidget {
  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  List<String> _timeSlots = [];
  final TextEditingController _timeSlotController = TextEditingController();

  void _addTimeSlot() {
    if (_timeSlotController.text.isNotEmpty) {
      setState(() {
        _timeSlots.add(_timeSlotController.text);
        _timeSlotController.clear();
      });
    }
  }

  void _removeTimeSlot(int index) {
    setState(() {
      _timeSlots.removeAt(index);
    });
  }

  void _saveService() {
    // Handle service saving logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Service '${_nameController.text}' added successfully!")),
    );
  }

  void _showPromotionOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Promotion Options",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Redeem Points for Promotion!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                child: const Text(
                  "Redeem Points",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pay for Promotion!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff75140c),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                child: const Text(
                  "Pay for Promotion",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Add Service", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.campaign, color: Colors.white,size: 50,),
            onPressed: _showPromotionOptions,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Picker
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Image picker not implemented")),
                );
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "Add Service Image",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Name Field
            _buildTextField(
              controller: _nameController,
              labelText: "Service Name",
              hintText: "Enter service name",
            ),

            // Description Field
            const SizedBox(height: 16),
            _buildTextField(
              controller: _descriptionController,
              labelText: "Description",
              hintText: "Enter service description",
              maxLines: 3,
            ),

            // Price Field
            const SizedBox(height: 16),
            _buildTextField(
              controller: _priceController,
              labelText: "Price",
              hintText: "Enter price (e.g., 50.00)",
              keyboardType: TextInputType.number,
            ),

            // Time Slots
            const SizedBox(height: 16),
            const Text(
              "Time Slots",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _timeSlotController,
                    hintText: "Add time slot (e.g., 9:00 AM - 10:00 AM)",
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTimeSlot,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff75140c),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Add"),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _timeSlots.isEmpty
                ? const Text(
              "No time slots added.",
              style: TextStyle(color: Colors.grey),
            )
                : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _timeSlots.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[900],
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text(
                      _timeSlots[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeTimeSlot(index),
                    ),
                  ),
                );
              },
            ),

            // Save Button
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _saveService,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff75140c),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  "Save Service",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    String? labelText,
    String? hintText,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
