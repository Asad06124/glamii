import 'package:demo_app/Signin_screen.dart';
import 'package:flutter/material.dart';


class StartingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(




            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10,),

              Container(
                height: 50,
                width: 200,
                // color: Colors.white,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/6.png"),fit: BoxFit.cover)
                ),
              ),
              // Top Images
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height: 350,
                      width: 150,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                          color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(image:AssetImage('assets/newone.jpg'),fit:BoxFit.cover )
                      ),
                    ),

                    Column(
                      children: [
                        Container(
                          height: 200,
                          width: 140,
                          // color: Colors.red,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(image:AssetImage('assets/haircut.jpg'),fit:BoxFit.cover )
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 140,
                          width: 160,
                          margin: EdgeInsets.symmetric(horizontal:5),
                          // color: Colors.red,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(image:AssetImage('assets/masking.jpg'),fit:BoxFit.cover )
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              // Title and Subtitle
              Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "The ",
                          style: TextStyle(
                            color: Colors.white, // White color for "The"
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 150,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/6.png"),fit: BoxFit.cover)
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: " That Connect\nClients with Beauty Professionals",
                          style: TextStyle(
                            color: Colors.white, // White color for the rest of the text
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Glamii is a premier beauty services marketplace designed to celebrate and reward both those seeking beauty and the professionals who create it. By seamlessly connecting clients with highly sought-after beauty experts, Glamii fosters a community where everyone thrives",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),


              // Get Started Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xff75140c),
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SigninScreen()),
                    );
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
