import 'package:demo_app/WaitingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClientProfileSetupScreen extends StatefulWidget {
  const ClientProfileSetupScreen({super.key});

  @override
  State<ClientProfileSetupScreen> createState() => _ClientProfileSetupScreenState();
}

class _ClientProfileSetupScreenState extends State<ClientProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  // State variables
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController incomeBracketController = TextEditingController();
  final TextEditingController lifestylePreferencesController =
  TextEditingController();
  final TextEditingController servicesInterestedController =
  TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final TextEditingController preferredProfessionalController =
  TextEditingController();
  final TextEditingController clubGoalsController = TextEditingController();
  final TextEditingController referralEmailController = TextEditingController();

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

  bool consentAgreed = false;
  String? selectedService;
  String? selectedLifestyle;
  final List<String> services = [
    "Hair Styling",
    "Makeup",
    "Massage",
    "Nail Art",
    "Facial",
  ];
  final List<String> lifestylePreferences = [
    "Healthy Eating",
    "Exercise Regularly",
    "Traveling",
    "Reading",
    "Yoga & Meditation",
    "Watching Movies",
    "Socializing",
  ];

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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionHeader("Membership Application"),

              const SizedBox(height: 30),
              // Profile Information
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
              const SizedBox(height: 50),
              sectionHeader("Profile Information"),
              const SizedBox(height: 30),
              buildTextField("First Name *", firstNameController),
              const SizedBox(height: 10),
              buildTextField("Last Name *", lastNameController),
              const SizedBox(height: 10),
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

              const SizedBox(height: 10),
              buildTextField("Email Address *", emailController),
              const SizedBox(height: 10),
              buildTextField("Phone Number *", phoneController),
              const SizedBox(height: 10),
              buildTextField("City *", cityController),
              const SizedBox(height: 10),
              buildTextField("Postal Code *", postalCodeController),
              const SizedBox(height: 60),

              // Professional & Lifestyle Information
              sectionHeader("Professional & Lifestyle Information"),
              const SizedBox(height: 20),

              const SizedBox(height: 10),
              // buildTextField("Annual Income Bracket", incomeBracketController),
              // const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                style: TextStyle(color: Colors.white),
                dropdownColor: Colors.black,
                value: selectedLifestyle,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLifestyle = newValue;
                  });
                },
                items: lifestylePreferences.map<DropdownMenuItem<String>>((String service) {
                  return DropdownMenuItem<String>(
                    value: service,
                    child: Text(service),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Lifestyle preferences *",
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

              // Beauty Service Preferences
              sectionHeader("Beauty Service Preferences"),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                style: TextStyle(color: Colors.white),
                dropdownColor: Colors.black,
                value: selectedService,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedService = newValue;
                  });
                },
                items: services.map<DropdownMenuItem<String>>((String service) {
                  return DropdownMenuItem<String>(
                    value: service,
                    child: Text(service),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Service Interested *",
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

              // Why Join the Club
              sectionHeader("Why Join the Club?"),
              const SizedBox(height: 10),
              buildTextField(
                "What Do You Hope to Gain? *",
                clubGoalsController,
              ),
              const SizedBox(height: 20),

              // Referrals and References
              sectionHeader("Referrals and References"),
              const SizedBox(height: 10),
              buildTextField(
                "Referral Email Address",
                referralEmailController,
              ),
              const SizedBox(height: 50),

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
                      "I agree to the terms and conditions, including the exclusive nature of the club.",
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

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WaitForApprovalScreen(stylist: false,),));
                    if (_formKey.currentState!.validate() && consentAgreed) {
                      // Save Profile Logic
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
