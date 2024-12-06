import 'package:flutter/material.dart';
import 'ServiceDetailScreen.dart';

class CategoryViewScreen extends StatelessWidget {
  const CategoryViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black theme
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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Categories",style: TextStyle(color: Colors.white,fontSize: 30),),
             SizedBox(height: 20,),
             Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                 },
                 child: Column(
                   children: [
                     Container(
                       margin: EdgeInsets.symmetric(horizontal: 10),
                       height: 120,
                       width: 120,
                       decoration: BoxDecoration(
                         image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                         color: Colors.grey[900],
                         borderRadius: BorderRadius.circular(100),
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
                       height: 120,
                       width: 120,
                       decoration: BoxDecoration(
                         image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                         color: Colors.grey[900],
                         borderRadius: BorderRadius.circular(100),
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
             ],),
              SizedBox(height: 10,),
              Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(100),
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
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(100),
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
              ],),
              SizedBox(height: 10,),
              Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(100),
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
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(100),
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
              ],),
              SizedBox(height: 10,),
              Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceListScreen(categoryName: 'Nail Services',),));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(100),
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
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/close-up-manicurist-painting-nails.jpg")),
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(100),
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
              ],),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      color: Colors.white, // White card background
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 40), // Red icon
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Black text
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black), // Black arrow
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceListScreen(categoryName: title),
            ),
          );
        },
      ),
    );
  }
}








class ServiceListScreen extends StatefulWidget {
  final String categoryName;

  const ServiceListScreen({required this.categoryName, super.key});

  @override
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Mock data for subcategories and services
  final Map<String, List<Map<String, dynamic>>> subcategories = {
    "Hair Services": [
      {"name": "Haircut", "rating": 4.5, "price": 20.0},
      {"name": "Hair Coloring", "rating": 4.7, "price": 50.0},
      {"name": "Haircut", "rating": 4.5, "price": 20.0},
      {"name": "Hair Coloring", "rating": 4.7, "price": 50.0},
      {"name": "Haircut", "rating": 4.5, "price": 20.0},
      {"name": "Hair Coloring", "rating": 4.7, "price": 50.0},
      {"name": "Haircut", "rating": 4.5, "price": 20.0},
      {"name": "Hair Coloring", "rating": 4.7, "price": 50.0},
      {"name": "Haircut", "rating": 4.5, "price": 20.0},
      {"name": "Hair Coloring", "rating": 4.7, "price": 50.0},
      {"name": "Haircut", "rating": 4.5, "price": 20.0},
      {"name": "Hair Coloring", "rating": 4.7, "price": 50.0},
      {"name": "Haircut", "rating": 4.5, "price": 20.0},
      {"name": "Hair Coloring", "rating": 4.7, "price": 50.0},
    ],
    "Skin Care": [
      {"name": "Facial", "rating": 4.8, "price": 30.0},
      {"name": "Microdermabrasion", "rating": 4.9, "price": 60.0},
      {"name": "Facial", "rating": 4.8, "price": 30.0},
      {"name": "Microdermabrasion", "rating": 4.9, "price": 60.0},
      {"name": "Facial", "rating": 4.8, "price": 30.0},
      {"name": "Microdermabrasion", "rating": 4.9, "price": 60.0},
      {"name": "Facial", "rating": 4.8, "price": 30.0},
      {"name": "Microdermabrasion", "rating": 4.9, "price": 60.0},
      {"name": "Facial", "rating": 4.8, "price": 30.0},
      {"name": "Microdermabrasion", "rating": 4.9, "price": 60.0},
    ],
    "Massage Therapy": [
      {"name": "Swedish Massage", "rating": 4.6, "price": 40.0},
      {"name": "Deep Tissue Massage", "rating": 4.8, "price": 70.0},
      {"name": "Swedish Massage", "rating": 4.6, "price": 40.0},
      {"name": "Deep Tissue Massage", "rating": 4.8, "price": 70.0},
      {"name": "Swedish Massage", "rating": 4.6, "price": 40.0},
      {"name": "Deep Tissue Massage", "rating": 4.8, "price": 70.0},
      {"name": "Swedish Massage", "rating": 4.6, "price": 40.0},
      {"name": "Deep Tissue Massage", "rating": 4.8, "price": 70.0},
      {"name": "Swedish Massage", "rating": 4.6, "price": 40.0},
      {"name": "Deep Tissue Massage", "rating": 4.8, "price": 70.0},
    ],
    "Nail Services": [
      {"name": "Manicure", "rating": 4.4, "price": 15.0},
      {"name": "Pedicure", "rating": 4.5, "price": 25.0},
      {"name": "Manicure", "rating": 4.4, "price": 15.0},
      {"name": "Pedicure", "rating": 4.5, "price": 25.0},
      {"name": "Manicure", "rating": 4.4, "price": 15.0},
      {"name": "Pedicure", "rating": 4.5, "price": 25.0},
      {"name": "Manicure", "rating": 4.4, "price": 15.0},
      {"name": "Pedicure", "rating": 4.5, "price": 25.0},
    ],
  };

  late List<String> subcategoryNames;
  late List<Map<String, dynamic>> currentItems;
  bool Favourite=false;

  @override
  void initState() {
    super.initState();
    subcategoryNames = subcategories.keys.toList();
    currentItems = subcategories[subcategoryNames.first]!; // Set initial items
    _tabController = TabController(length: subcategoryNames.length, vsync: this);

    _tabController.addListener(() {
      setState(() {
        currentItems = subcategories[subcategoryNames[_tabController.index]]!;
      });
    });
  }
  // filter options

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
      backgroundColor: Colors.black, // Black theme
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: const TextStyle(color: Colors.white),
          // White text
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt, color: Colors.white),
            onPressed: _showFilterModal,
          ),
        ],// Black app bar
        iconTheme: const IconThemeData(color: Colors.white), // White icons
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60), // Adjust height for scrolling
          child: Container(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Make the tab bar scrollable
              child: Row(
                children: subcategoryNames.map((name) {
                  final bool isSelected = _tabController.index == subcategoryNames.indexOf(name);
                  return GestureDetector(
                    onTap: () {
                      _tabController.animateTo(subcategoryNames.indexOf(name));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xff75140c) : Colors.white, // Red for selected
                        borderRadius: BorderRadius.circular(20), // Rounded button style
                      ),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black, // White text for selected
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Show the full name of the selected subcategory
          // Container(
          //   padding: const EdgeInsets.all(8.0),
          //   color: Colors.black,
          //   child: Text(
          //     subcategoryNames[_tabController.index],
          //     style: const TextStyle(
          //       color: Colors.white,
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: currentItems.length, // Dynamic based on selected subcategory
              itemBuilder: (context, index) {
                final item = currentItems[index];
                return _buildServiceCard(
                  context,
                  item['name'],
                  item['rating'].toDouble(),
                  item['price'].toDouble(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String serviceName, double rating, double price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailScreen(),
          ),
        );
      },
      child: Card(
        color: Colors.white, // White card background
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/high-angle-woman-hair-salon.jpg',
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                serviceName,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black), // Black text
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        '$rating',
                        style: const TextStyle(color: Colors.black), // Black rating text
                      ),
                    ],
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black), // Black price text
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(

                  color: Favourite ? Colors.red:Colors.black,
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
    );
  }
}
