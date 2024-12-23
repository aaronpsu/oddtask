import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Hello! Is the gig still available?'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Card(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Yes, it is. Are you interested?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Message sending logic
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
