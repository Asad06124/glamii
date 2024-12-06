import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'WaitingScreen.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  // State variables
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController servicesController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController certificationsController =
  TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController clienteleSizeController =
  TextEditingController();
  final TextEditingController platformGoalsController =
  TextEditingController();
  final TextEditingController referralEmailController = TextEditingController();

  final List<Map<String, String>> schedule = [];
  String? selectedexperinece;
  String? selectclinethandle;
  String? selectLicenses;

  final List<String> experince = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "10+"
  ];
  final List<String> LicenceType = [
    "Licenses",
    "certification",

  ];
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default to current date
      firstDate: DateTime(1900), // Earliest date
      lastDate: DateTime.now(), // Latest date
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: const Color(0xff75140c), // Header background color
              onPrimary: Colors.white, // Header text color
              surface: Colors.black, // Dialog background color
              onSurface: Colors.white, // Text color
            ),
            dialogBackgroundColor: Colors.black,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        dobController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }
  final List<String> clienthadle = [
    "1-10",
    "10-20",
    "20-30",
    "30-40",
    "40-50",
    "50-60",
    "60-70",
    "70-80",
    "80-90",
    "90-100",
    "100+"
  ];
  final List<String> services = [
    "Hair Styling",
    "Skincare",
    "BodyTreatments",
    "Nail care",
    "Waxing and Hair Removal",
    "Lashes and Brows",
    "Makeup Services",
    "Massage Therapy"
    "Medical Aesthetics",
    "Teeth and Smile Care",
    "Tatto and piercing",
    "Wellness Services"
  ];
  final List<String> selectedServices = [];

  bool consentAgreed = false;

  String placeOfWork = "Business";
  String preferredClientBase = "Local Clients";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          width: 150,
          // color: Colors.white,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/6.png"),fit: BoxFit.cover)
          ),
        ),
        centerTitle: true,

        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Membership Application',
                style: TextStyle(color: Colors.white,fontSize: 30),
              ),
              const SizedBox(height: 10),
              sectionHeader("Profile Picture"),
              const SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: 50,
                    // backgroundImage:"",
                    child:  const Icon(Icons.add_a_photo, size: 30, color: Colors.white)

                  ),
                ),
              ),
               SizedBox(height: 40),
              // Profile Information
              sectionHeader("Profile Information"),
               SizedBox(height: 30),
              buildTextField("First Name *", firstNameController),
               SizedBox(height: 10),
              buildTextField("Last Name *", lastNameController),
               SizedBox(height: 10),
              TextField(
                controller: dobController,
                readOnly: true, // Make the TextField read-only
                onTap: () => _selectDate(context),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  hintText: "Select your birth date",
                  hintStyle: const TextStyle(color: Colors.white),
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
              ),
               SizedBox(height: 10),
              buildTextField("City *", cityController),
               SizedBox(height: 10),
              buildTextField("Postal Code *", postalCodeController),
               SizedBox(height: 10),
              buildTextField("Email Address *", emailController),
               SizedBox(height: 10),
              buildTextField("Phone Number *", phoneController),
               SizedBox(height: 50),

              // Professional Information
              sectionHeader("Professional Information"),
              const SizedBox(height: 30),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () => _showMultiSelectDialog(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Text(
                      selectedServices.isNotEmpty
                          ? selectedServices.join(", ")
                          : "Select Services *",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                style: TextStyle(color: Colors.white),
                dropdownColor: Colors.black,
                value: selectedexperinece,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedexperinece = newValue!;
                  });
                },
                items: experince.map<DropdownMenuItem<String>>((String service) {
                  return DropdownMenuItem<String>(
                    value: service,
                    child: Text(service),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Year of Experience *",
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
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                style: TextStyle(color: Colors.white),
                dropdownColor: Colors.black,
                value: selectLicenses,
                onChanged: (String? newValue) {
                  setState(() {
                    selectLicenses = newValue!;
                  });
                },
                items: LicenceType.map<DropdownMenuItem<String>>((String service) {
                  return DropdownMenuItem<String>(
                    value: service,
                    child: Text(service),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Certification or Licenses *",
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
              ),
               SizedBox(height: 10),

              SizedBox(
                height: 55,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Text(

                           "Attch file for Licenses or certification *",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              // const SizedBox(height: 10),
              // buildTextField("Instagram Handle", instagramController),

              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                style: TextStyle(color: Colors.white),
                dropdownColor: Colors.black,
                value: selectclinethandle,
                onChanged: (String? newValue) {
                  setState(() {
                    selectclinethandle = newValue!;
                  });
                },
                items: clienthadle.map<DropdownMenuItem<String>>((String service) {
                  return DropdownMenuItem<String>(
                    value: service,
                    child: Text(service),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Approximate Clientele Size *",
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
              ),
              const SizedBox(height: 50),

              // Place of Work Dropdown
              sectionHeader("Place of Work *"),
              const SizedBox(height: 30),
              buildDropdown(
                label: "Place of Work *",
                value: placeOfWork,
                items: ["Business", "Home", "Both"],
                onChanged: (value) {
                  setState(() {
                    placeOfWork = value!;
                  });
                },
              ),
              const SizedBox(height: 50),

              // Availability and Schedule Section
              sectionHeader("Availability and Schedule"),
              const SizedBox(height: 30),
              ...schedule.map((item) => ListTile(
                title: Text(
                  "Day: ${item['day']}",
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "Hours: ${item['hours']}",
                  style: const TextStyle(color: Colors.white),
                ),
              )),
              ElevatedButton(
                style: elevatedButtonStyle(),
                onPressed: () {
                  _showAddScheduleDialog(context);
                },
                child: const Text(
                  "Add Schedule *",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 50),

              // Why Join Glamii?
              sectionHeader("Why Join Glamii?"),
              const SizedBox(height: 30),
              buildTextField("Goals for Joining the Platform *", platformGoalsController),
              const SizedBox(height: 20),

              // Referrals and References
              sectionHeader("Referrals and References *"),
              const SizedBox(height: 10),
              buildTextField(
                "Referral Email Address (Optional)",
                referralEmailController,
              ),
              const SizedBox(height: 20),

              // Consent and Agreement
              Row(
                children: [
                  Checkbox(
                    value: consentAgreed,
                    onChanged: (value) {
                      setState(() {
                        consentAgreed = value!;
                      });
                    },
                    activeColor: const Color(0xff75140c),
                  ),
                  const Expanded(
                    child: Text(
                      "I agree to the terms and conditions.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: elevatedButtonStyle(),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WaitForApprovalScreen(stylist: true,),));

                    if (_formKey.currentState!.validate() && consentAgreed) {
                    } else if (!consentAgreed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Please agree to the terms and conditions.",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Submit",
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

  // Helper to show dialog for adding schedule
  Future<void> _showAddScheduleDialog(BuildContext context) async {
    final dayController = TextEditingController();
    final hoursController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Add Schedule",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextField("Day", dayController),
              const SizedBox(height: 10),
              buildTextField("Hours (e.g., 9:00 AM - 5:00 PM)", hoursController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: elevatedButtonStyle(),
              onPressed: () {
                if (dayController.text.isNotEmpty &&
                    hoursController.text.isNotEmpty) {
                  setState(() {
                    schedule.add({
                      'day': dayController.text,
                      'hours': hoursController.text,
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
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
      validator: (value) => value!.isEmpty ? "$label is required" : null,
    );
  }

  // Helper to create dropdown menus with a consistent style
  Widget buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return InputDecorator(
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.black,
          value: value,
          isExpanded: true,
          style: const TextStyle(color: Colors.white),
          onChanged: onChanged,
          items: items
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          ))
              .toList(),
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

  void _showMultiSelectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Temporary state for managing checkbox selection
        List<String> tempSelectedServices = List.from(selectedServices);

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter dialogSetState) {
            return AlertDialog(
              title: const Text("Select Services"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: services.map((service) {
                    return CheckboxListTile(
                      title: Text(service),
                      value: tempSelectedServices.contains(service),
                      onChanged: (bool? isChecked) {
                        dialogSetState(() {
                          if (isChecked == true) {
                            tempSelectedServices.add(service);
                          } else {
                            tempSelectedServices.remove(service);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    // Update the main state with the selected items
                    setState(() {
                      selectedServices.clear();
                      selectedServices.addAll(tempSelectedServices);
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text("Confirm"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
