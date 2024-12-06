import 'package:flutter/material.dart';

class EditServiceScreen extends StatefulWidget {
  final Map<String, dynamic> service;

  const EditServiceScreen({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  State<EditServiceScreen> createState() => _EditServiceScreenState();
}

class _EditServiceScreenState extends State<EditServiceScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late List<String> _timeSlots;
  late bool _isPromotionEnabled;
  final TextEditingController _timeSlotController = TextEditingController();
  final TextEditingController _promotionDiscountController = TextEditingController();
  final TextEditingController _promotionPointsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.service['name']);
    _descriptionController = TextEditingController(text: widget.service['description']);
    _priceController = TextEditingController(text: widget.service['price'].toString());
    _timeSlots = List<String>.from(widget.service['timeSlots']);
    _isPromotionEnabled = widget.service['isPromotionEnabled'] ?? false;
    _promotionDiscountController.text = widget.service['promotionDiscount']?.toString() ?? '';
    _promotionPointsController.text = widget.service['promotionPoints']?.toString() ?? '';
  }

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
    final updatedService = {
      "name": _nameController.text,
      "description": _descriptionController.text,
      "price": double.tryParse(_priceController.text) ?? 0.0,
      "timeSlots": _timeSlots,
      "isPromotionEnabled": _isPromotionEnabled,
      "promotionDiscount": double.tryParse(_promotionDiscountController.text) ?? 0.0,
      "promotionPoints": int.tryParse(_promotionPointsController.text) ?? 0,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Service '${_nameController.text}' updated successfully!")),
    );
    Navigator.pop(context, updatedService); // Navigate back after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Edit Service", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
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
                  image: widget.service['image'] != null
                      ? DecorationImage(
                    image: AssetImage(widget.service['image']), // Assuming the image is a local asset
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                child: widget.service['image'] == null
                    ? const Center(
                  child: Text(
                    "Edit Service Image",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
                    : null,
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

            // Promotion Toggle
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Enable Promotion",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _isPromotionEnabled,
                  activeColor: const Color(0xff75140c),
                  onChanged: (value) {
                    setState(() {
                      _isPromotionEnabled = value;
                    });
                  },
                ),
              ],
            ),

            // Promotion Details
            if (_isPromotionEnabled) ...[
              const SizedBox(height: 8),
              _buildTextField(
                controller: _promotionDiscountController,
                labelText: "Discount Percentage",
                hintText: "Enter discount (e.g., 10%)",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _promotionPointsController,
                labelText: "Redeem Points",
                hintText: "Enter points required for redemption",
                keyboardType: TextInputType.number,
              ),
            ],

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
                  "Save Changes",
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
