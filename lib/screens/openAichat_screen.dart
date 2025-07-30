// ignore: file_names
import 'dart:convert';

import 'package:authentication_trials/constants/openai_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AIChatPage extends StatefulWidget {
  const AIChatPage({super.key});

  @override
  State<AIChatPage> createState() => _AIChatPageState();
}

class _AIChatPageState extends State<AIChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> messages = [
      // {'role': 'ai', 'content': 'Hello! How can I assist you today?'},
      // {'role': 'user', 'content': 'Can you help me write an email?'},
      // {'role': 'ai', 'content': 'Of course! What is the subject of your email?'},
  ];

  Future<String> fetchOpenAIResponse(String message) async {
    try {
      final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $openaiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'user', 'content': message},
        ],
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'] as String;
          } else {
        print('OpenAI API Error: ${response.statusCode} ${response.body}');
        if (response.statusCode == 401) {
          throw Exception('Invalid API key. Please check your OpenAI API key.');
        } else if (response.statusCode == 429) {
          throw Exception('Rate limit exceeded. Please try again later.');
        } else {
          throw Exception('Failed to load AI response (Status: ${response.statusCode})');
        }
      }
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        throw Exception('Network error: Please check your internet connection.');
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        title: const Text('AI Chat'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                        color: isUser ? Colors.black : const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        msg['content']!,
                        style: TextStyle(
                          color: isUser ? Colors.white : Colors.black87,
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
                    onPressed: () async {
                      final message = _controller.text.trim();
                      if (message.isNotEmpty) {
                        setState(() {
                          messages.add({'role': 'user', 'content': message});
                          _controller.clear();
                        });
                      }
                      try {
                        final response = await fetchOpenAIResponse(message);
                        setState(() {
                          messages.add({'role': 'ai', 'content': response});
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $e')),
                        );
                      }
                    }, // No logic, UI only
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
