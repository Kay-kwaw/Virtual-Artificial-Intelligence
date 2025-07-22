import 'package:flutter/material.dart';
import '../constants/reusable_button.dart';

class Aiassistance extends StatelessWidget {
  const Aiassistance({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: customAppBar(
          title: 'AI Assistants',
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          imagePath: logoPath,
          fontFamily: 'Figtree-semibold',
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Writing'),
              Tab(text: 'Creative'),
              Tab(text: 'Business'),
              Tab(text: 'Social Media'),
            ],
            labelStyle: TextStyle(fontFamily: 'Figtree-semibold'),
            unselectedLabelStyle: TextStyle(fontFamily: 'Figtree'),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: const TabBarView(
          children: [
            Column(
              children: [
                   ReusebaleText(text: 'Writings', fontSize: 16, textAlign: TextAlign.right, fontWeight: FontWeight.w500, fontFamily: 'Figtree-semibold',),
                   SizedBox(height: 10,),
                   CustomBox(icon: Icons.book, title: 'Writing Articles', subtitle: 'subtitle')
              ],
            ),
            Center(child: Text('Page 2')),
            Center(child: Text('Page 3')),
            Center(child: Text('Page 4')),
            Center(child: Text('Page 5')),
          ],
        ),
      ),
    );
  }
}