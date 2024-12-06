import 'dart:async';
import 'package:flutter/material.dart';

import 'CatagoryScreen.dart';
import 'ServiceDetailScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  int _currentPage = 0;
  late final Timer _timer;
  bool Favourite=false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Start a periodic timer that will change the page every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = (_currentPage + 1) % 3; // Update the current page index
        });
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  List<Map<String, dynamic>> products = [
    {
      "url": "assets/high-angle-woman-waxing-leg.jpg",
      "name": "Waxing Hair Services",
      "price": "40\$"
    },
    {
      "url": "assets/high-angle-woman-hair-salon.jpg",
      "name": "Hair Cutting Services",
      "price": "20\$"
    },
    {
      "url": "assets/wellness-concept-with-woman-massage-salon.jpg",
      "name": "Massage Services",
      "price": "80\$"
    },
    {
      "url": "assets/close-up-manicurist-painting-nails.jpg",
      "name": "Nail Services",
      "price": "10\$"
    }
  ];

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }
  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, // Make the modal scrollable
      builder: (context) {
        List<String> selectedFilters = [];

        return StatefulBuilder( // Use StatefulBuilder to manage state within the modal
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Filters",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    // Location Filter
                    const Text(
                      "Location",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    _buildFilterChip(
                      ["City Center", "Suburbs", "Rural Area"],
                      selectedFilters,
                      setState,
                    ),

                    const SizedBox(height: 20),

                    // Service Type Filter
                    const Text(
                      "Service Type",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    _buildFilterChip(
                      ["Haircuts", "Massage", "Nail Services", "Facials"],
                      selectedFilters,
                      setState,
                    ),

                    const SizedBox(height: 20),

                    // Ratings Filter
                    const Text(
                      "Ratings",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    _buildFilterChip(
                      ["1 Star", "2 Stars", "3 Stars", "4 Stars", "5 Stars"],
                      selectedFilters,
                      setState,
                    ),

                    const SizedBox(height: 20),

                    // Price Filter
                    const Text(
                      "Price",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    _buildFilterChip(
                      ["\$ - Affordable", "\$\$ - Moderate", "\$\$\$ - Expensive"],
                      selectedFilters,
                      setState,
                    ),

                    const SizedBox(height: 20),

                    // Availability Filter
                    const Text(
                      "Availability",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    _buildFilterChip(
                      ["Now", "Later Today", "Tomorrow", "Weekends"],
                      selectedFilters,
                      setState,
                    ),

                    const SizedBox(height: 20),

                    // Sort Options
                    const Text(
                      "Sort By",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    _buildFilterChip(
                      ["Price", "Distance", "Reviews", "Availability"],
                      selectedFilters,
                      setState,
                    ),

                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff75140c),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          if (selectedFilters.isEmpty) {
                            // Show an alert dialog if no filters are selected
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("No Filters Selected"),
                                content: const Text("Please select at least one filter before applying."),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            // Apply filters logic here if needed
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          "Apply Filters",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFilterChip(List<String> options, List<String> selectedOptions, StateSetter setState) {
    return Wrap(
      spacing: 10,
      children: options.map((option) {
        final isSelected = selectedOptions.contains(option);
        return FilterChip(
          label: Text(
            option,
            style: TextStyle(color: isSelected ? Colors.black : Colors.white),
          ),
          backgroundColor: Colors.grey[700],
          selectedColor: const Color(0xff75140c),
          selected: isSelected,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                selectedOptions.add(option);
              } else {
                selectedOptions.remove(option);
              }
            });
          },
        );
      }).toList(),
    );
  }






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
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Padding from the top
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search for services",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_alt, color: Colors.white),
                    onPressed: _showFilterModal,
                  ),
                ],
              ),
            ),



            const SizedBox(height: 20),
            Text("Categories",style: TextStyle(color: Colors.white,fontSize:25),),
            const SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white,width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                              
                            ],
                          ),
                        
                        ),
                        SizedBox(height: 3,),
                        Text("face servies",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white,width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),

                            ],
                          ),

                        ),
                        SizedBox(height: 3,),
                        Text("Nail servies",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white,width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),

                            ],
                          ),

                        ),
                        SizedBox(height: 3,),
                        Text("Hair servies",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white,width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),

                            ],
                          ),

                        ),
                        SizedBox(height: 3,),
                        Text("message",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white,width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),

                            ],
                          ),

                        ),
                        SizedBox(height: 3,),
                        Text("Face-scrab",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white,width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),

                            ],
                          ),

                        ),
                        SizedBox(height: 3,),
                        Text("face masking",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white,width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),

                            ],
                          ),

                        ),
                        SizedBox(height: 3,),
                        Text("padicure",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white,width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),

                            ],
                          ),

                        ),
                        SizedBox(height: 3,),
                        Text("Manicure",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),



                ],
              ),
            ),
            const SizedBox(height: 20),
            Text("Promotion",style: TextStyle(color: Colors.white,fontSize:25),),
            const SizedBox(height: 20),

            // Banner Section
            SizedBox(
              height: 200,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  BannerCard(imagePath: 'assets/promotions.jpg'),
                  BannerCard(imagePath: 'assets/promotions2.jpg'),
                  BannerCard(imagePath: 'assets/promotions3.jpg'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Featured Services Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Services',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeaturedServicesScreen(products: products)),
                      );
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // Horizontal Featured Services Card Section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailScreen(),));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 250,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/close-up-manicurist-painting-nails.jpg",
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                          SizedBox(height: 5,),
                          Text("Nail Services",style: TextStyle(color: Colors.white,fontSize: 18),),
                          Text("10\$",style: TextStyle(color: Colors.white,fontSize: 18),),
                          Row(
                            children: [
                              IconButton(

                                color: Favourite ? Colors.red:Colors.white,
                                onPressed: () {
                                  if(Favourite==false){
                                    setState(() {
                                      Favourite=true;

                                    });
                                  }else{
                                    setState(() {
                                      Favourite=false;

                                    });
                                  }


                                },
                                icon: Icon(Icons.favorite),
                              ),
                              MaterialButton(
                                shape: StadiumBorder(),
                                color: Colors.red,
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentScreen(),));

                                  },
                                child: Text("Book Now",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailScreen(),));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 250,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/close-up-manicurist-painting-nails.jpg",
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                          SizedBox(height: 5,),
                          Text("Nail Services",style: TextStyle(color: Colors.white,fontSize: 18),),
                          Text("10\$",style: TextStyle(color: Colors.white,fontSize: 18),),
                          Row(
                            children: [
                              IconButton(

                                color: Favourite ? Colors.red:Colors.white,
                                onPressed: () {
                                  if(Favourite==false){
                                    setState(() {
                                      Favourite=true;

                                    });
                                  }else{
                                    setState(() {
                                      Favourite=false;

                                    });
                                  }


                                },
                                icon: Icon(Icons.favorite),
                              ),
                              MaterialButton(
                                shape: StadiumBorder(),
                                color: Colors.red,
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentScreen(),));

                                },
                                child: Text("Book Now",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailScreen(),));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 250,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/close-up-manicurist-painting-nails.jpg",
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                          SizedBox(height: 5,),
                          Text("Nail Services",style: TextStyle(color: Colors.white,fontSize: 18),),
                          Text("10\$",style: TextStyle(color: Colors.white,fontSize: 18),),
                          Row(
                            children: [
                              IconButton(

                                color: Favourite ? Colors.red:Colors.white,
                                onPressed: () {
                                  if(Favourite==false){
                                    setState(() {
                                      Favourite=true;

                                    });
                                  }else{
                                    setState(() {
                                      Favourite=false;

                                    });
                                  }


                                },
                                icon: Icon(Icons.favorite),
                              ),
                              MaterialButton(
                                shape: StadiumBorder(),
                                color: Colors.red,
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentScreen(),));

                                },
                                child: Text("Book Now",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailScreen(),));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 250,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/close-up-manicurist-painting-nails.jpg",
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                          SizedBox(height: 5,),
                          Text("Nail Services",style: TextStyle(color: Colors.white,fontSize: 18),),
                          Text("10\$",style: TextStyle(color: Colors.white,fontSize: 18),),
                          Row(
                            children: [
                              IconButton(

                                color: Favourite ? Colors.red:Colors.white,
                                onPressed: () {
                                  if(Favourite==false){
                                    setState(() {
                                      Favourite=true;

                                    });
                                  }else{
                                    setState(() {
                                      Favourite=false;

                                    });
                                  }


                                },
                                icon: Icon(Icons.favorite),
                              ),
                              MaterialButton(
                                shape: StadiumBorder(),
                                color: Colors.red,
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentScreen(),));

                                },
                                child: Text("Book Now",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20),

            // All Services Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Services',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllServicesScreen(products: products)),
                      );
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Grid of All Services
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: MediaQuery.of(context).size.width / (300 * 2), // Ensure valid ratio
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  imagePath: products[index]["url"],
                  productName: products[index]["name"],
                  price: products[index]["price"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Banner Card Widget
class BannerCard extends StatelessWidget {
  final String imagePath;

  const BannerCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}

// Product Card Widget
class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;

  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailScreen(),));
        // Handle product click
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: MaterialButton(
                shape: StadiumBorder(),
                color: Colors.red,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentScreen(),));

                },
                child: Text("Book Now",style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Featured Services Screen
class FeaturedServicesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const FeaturedServicesScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double childAspectRatio = MediaQuery.of(context).size.width / (250 * 2); // Fix

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Featured Services'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            imagePath: products[index]["url"],
            productName: products[index]["name"],
            price: products[index]["price"],
          );
        },
      ),
    );
  }
}

// All Services Screen
class AllServicesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const AllServicesScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double childAspectRatio = MediaQuery.of(context).size.width / (250 * 2); // Fix

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('All Services'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            imagePath: products[index]["url"],
            productName: products[index]["name"],
            price: products[index]["price"],
          );
        },
      ),
    );
  }
}
