import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String providerName;

  const ChatScreen({Key? key, required this.providerName}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.providerName,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // Chat messages list
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isSentByMe = message['isSentByMe'];
                return Align(
                  alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isSentByMe ? const Color(0xff75140c) : Colors.grey[800],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                        bottomLeft: isSentByMe ? const Radius.circular(10) : Radius.zero,
                        bottomRight: isSentByMe ? Radius.zero : const Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      message['text'],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),

          // Input section
          _buildInputSection(),
        ],
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      color: Colors.grey[900],
      child: Row(
        children: [
          // Attach file button
          IconButton(
            icon: const Icon(Icons.attach_file, color: Colors.white),
            onPressed: _attachFile,
          ),

          // Message input field
          Expanded(
            child: TextField(
              controller: _messageController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),

          // Record voice message button
          IconButton(
            icon: Icon(
              _isRecording ? Icons.mic : Icons.mic_none,
              color: _isRecording ? Colors.red : Colors.white,
            ),
            onPressed: _recordVoiceMessage,
          ),

          // Send button
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xff75140c)),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.insert(0, {
        'text': _messageController.text.trim(),
        'isSentByMe': true,
      });
    });
    _messageController.clear();
  }

  void _attachFile() {
    // Logic to attach files goes here
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.image, color: Colors.white),
              title: const Text('Attach Image', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _addSystemMessage('Attached an image.');
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file, color: Colors.white),
              title: const Text('Attach Document', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _addSystemMessage('Attached a document.');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _recordVoiceMessage() {
    setState(() {
      _isRecording = !_isRecording;
    });

    // Simulate a voice message being sent after a few seconds
    if (_isRecording) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isRecording = false;
          _addSystemMessage('Sent a voice message.');
        });
      });
    }
  }

  void _addSystemMessage(String message) {
    setState(() {
      _messages.insert(0, {
        'text': message,
        'isSentByMe': true,
      });
    });
  }
}
