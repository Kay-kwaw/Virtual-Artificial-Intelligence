import 'dart:convert';

import 'package:authentication_trials/constants/openai_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GoogleGeminiAi extends StatefulWidget {
  const GoogleGeminiAi({super.key});

  @override
  State<GoogleGeminiAi> createState() => _GoogleGeminiAiState();
}

class _GoogleGeminiAiState extends State<GoogleGeminiAi> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> messages = [];

  Future<String> fetchGeminiResponse(String message) async {
    final response = await http.post(
      Uri.parse('https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=$geminiApiKey'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {'text': message}
            ]
          }
        ]
      }),
    );
    if (response.statusCode == 200) { 
      final data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'] as String;
    } else {
      print('Gemini API Error: ${response.statusCode} ${response.body}');
      throw Exception('Failed to load AI response: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        title: const Text('Google Gemini'),
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
                        color: isUser ? Colors.black : Colors.grey[200],
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
                        
                        try {
                          final response = await fetchGeminiResponse(message);
                          setState(() {
                            messages.add({'role': 'ai', 'content': response});
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error: $e'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
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