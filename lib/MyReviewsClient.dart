import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {
      "reviewerName": "John Doe",
      "rating": 5,
      "comment": "Amazing service! Highly recommend.",
      "date": "12 Nov 2024",
    },
    {
      "reviewerName": "Jane Smith",
      "rating": 4,
      "comment": "Good experience, but room for improvement.",
      "date": "10 Nov 2024",
    },
    {
      "reviewerName": "Alice Johnson",
      "rating": 3,
      "comment": "Average service. Not bad but not great.",
      "date": "8 Nov 2024",
    },
    {
      "reviewerName": "Mike Williams",
      "rating": 5,
      "comment": "Best service I’ve ever had!",
      "date": "5 Nov 2024",
    },
  ];

  ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'My Reviews',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return ReviewCard(
            reviewerName: review["reviewerName"],
            rating: review["rating"],
            comment: review["comment"],
            date: review["date"],
          );
        },
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String reviewerName;
  final int rating;
  final String comment;
  final String date;

  const ReviewCard({
    Key? key,
    required this.reviewerName,
    required this.rating,
    required this.comment,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Review Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  reviewerName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Star Ratings
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color:  Colors.amber,
                  size: 16,
                );
              }),
            ),
            const SizedBox(height: 8),

            // Review Comment
            Text(
              comment,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
