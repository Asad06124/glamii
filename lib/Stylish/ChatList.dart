import 'package:demo_app/ChatScreen.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  final List<Map<String, String>> _chatUsers = [
    {"name": "John Doe", "lastMessage": "Hey! How are you?", "time": "3:45 PM"},
    {"name": "Jane Smith", "lastMessage": "Let’s catch up soon!", "time": "2:15 PM"},
    {"name": "Alex Brown", "lastMessage": "Can you send the details?", "time": "1:00 PM"},
    {"name": "Emily White", "lastMessage": "Great! See you tomorrow.", "time": "12:30 PM"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Chats",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: _chatUsers.length,
        itemBuilder: (context, index) {
          final user = _chatUsers[index];
          return _buildChatCard(
            context,
            name: user["name"]!,
            lastMessage: user["lastMessage"]!,
            time: user["time"]!,
          );
        },
      ),
    );
  }

  Widget _buildChatCard(
      BuildContext context, {
        required String name,
        required String lastMessage,
        required String time,
      }) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xff75140c), // Custom red color
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          lastMessage,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          time,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        onTap: () {
          // Navigate to the chat detail screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(providerName: name),
            ),
          );
        },
      ),
    );
  }
}


