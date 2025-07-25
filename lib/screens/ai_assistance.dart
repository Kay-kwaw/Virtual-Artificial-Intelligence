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
        body:  TabBarView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReusebaleText(text: 'Writings', fontSize: 16, textAlign: TextAlign.left, fontWeight: FontWeight.w500, fontFamily: 'Figtree-semibold',),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CustomBox(icon: Icons.book, title: 'Writing Articles', subtitle: 'subtitle'),
                    CustomBox(icon: Icons.edit, title: 'Editing', subtitle: 'subtitle'),
                    CustomBox(icon: Icons.lightbulb, title: 'Ideas', subtitle: 'subtitle'),
                    CustomBox(icon: Icons.business, title: 'Business Plan', subtitle: 'subtitle'),
                    CustomBox(icon: Icons.people, title: 'Networking', subtitle: 'subtitle'),
                    CustomBox(icon: Icons.share, title: 'Sharing', subtitle: 'subtitle'),
                  ],
                            ),
                ),
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