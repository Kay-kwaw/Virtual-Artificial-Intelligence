import 'package:authentication_trials/screens/googlegemini.dart';
import 'package:flutter/material.dart';
import 'package:authentication_trials/constants/reusable_button.dart';
import 'package:authentication_trials/screens/openAichat_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Virtuals', backgroundColor: const Color.fromARGB(255, 255, 255, 255), imagePath: logoPath, fontFamily: 'Figtree-semibold'),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(logoPath, height: 100, width: 100, fit: BoxFit.contain),
          SizedBox(height: 20,),
          ReusebaleText(text: 'Welcome to Virtuals', fontSize: 18, fontFamily: 'Figtree-bold', fontWeight: FontWeight.bold),
          SizedBox(height: 20,),
          ReusableButton(text: 'Chat With OpenAI', onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AIChatPage()));
          }),
          SizedBox(height: 20,),
          ReusableButton(text: 'Chat With GoogleGemini', onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleGeminiAi()));
          }),
          SizedBox(height: 20,),
          ReusableButton(text: 'Generate Image', onPressed: (){}),
        ],
      ),
    );
  }
}