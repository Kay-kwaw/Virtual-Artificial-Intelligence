import 'package:flutter/material.dart';

class StorytellerPage extends StatefulWidget {
  const StorytellerPage({super.key});

  @override
  State<StorytellerPage> createState() => _StorytellerPageState();
}

class _StorytellerPageState extends State<StorytellerPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> messages = [
    {'role': 'ai', 'content': 'Hello! How can I assist you today with storyteller?'},
    // {'role': 'user', 'content': 'Can you help me write an email?'},
    // {'role': 'ai', 'content': 'Of course! What is the subject of your email?'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        title: const Text('Storyteller'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final isUser = msg['role'] == 'user';
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue[100] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        msg['content']!,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.black),
                    onPressed: () {}, // No logic, UI only
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 