import 'package:authentication_trials/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'indexed.dart';
import 'package:authentication_trials/screens/ai_assistance.dart';

class IndexedScreen extends StatefulWidget {
  const IndexedScreen({super.key});

  @override
  State<IndexedScreen> createState() => _IndexedScreenState();
}

class _IndexedScreenState extends State<IndexedScreen> {
  int _currentIndex = 0;

//Read about IndexedStack and List<Widget>
  static const List<Widget> _pages = <Widget> [
    HomePage(),
    Aiassistance(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigation2(
        initialIndex: _currentIndex,
        onIndexChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}