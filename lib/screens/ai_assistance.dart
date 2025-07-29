import 'package:authentication_trials/screens/ai_assistants_screen.dart/business.dart';
import 'package:authentication_trials/screens/ai_assistants_screen.dart/creative.dart';
import 'package:authentication_trials/screens/ai_assistants_screen.dart/social_media.dart';
import 'package:authentication_trials/screens/ai_assistants_screen.dart/writings.dart';
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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Writings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Figtree-semibold'),)
                  ),
                  SizedBox(height: 10,),
                  // First row of grid
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WritingsPage()));
                        },
                        child: CustomBox(icon: Icons.book, title: 'Writing Articles', subtitle: 'General well-written articles on any topic you')),
                      InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => AcadamicWritingsPage()));
                        },
                        child: CustomBox(icon: Icons.school, title: 'Acadamic Writings', subtitle: 'Generate educational writing such as essays,')),
                    ],
                  ),
                  // Text in between rows
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    child: Text(
                      'Creative',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Figtree-normal',
                      ),
                    ),
                  ),
                  // Creative grid
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => IdeasPage()));
                        },
                        child: CustomBox(icon: Icons.lightbulb, title: 'Ideas', subtitle: 'Generate Ideas from any music genre you want.')),
                      InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => StorytellerPage()));
                        },
                        child: CustomBox(icon: Icons.business, title: 'Storyteller', subtitle: 'Generate a story from any topic you want.')),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    child: Text(
                      'Business',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Figtree-bold',
                      ),
                    ),
                  ),
                  // Business grid
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InkWell(
                        onTap: () {},
                        child: CustomBox(icon: Icons.lightbulb, title: 'Email Writer', subtitle: 'Generate a well-written email for any purpose you want.')),
                      InkWell(
                        onTap: () {},
                        child: CustomBox(icon: Icons.business, title: 'Business Plan', subtitle: 'Generate a business plan for any business you want.')),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    child: Text(
                      'Social Media',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Figtree-bold',
                      ),
                    ),
                  ),
                  // Social Media grid
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InkWell(
                        onTap: () {},
                        child: CustomBox(icon: Icons.people, title: 'Networking', subtitle: 'Find and connect with professionals.')),
                      InkWell(
                        onTap: () {},
                        child: CustomBox(icon: Icons.share, title: 'Sharing', subtitle: 'Share your content easily.')),
                    ],
                  ),
                ],
              ),
            ),
            Center(child: WritingsPage()),
            Center(child: CreativePage()),
            Center(child: BusinessPage()),
            Center(child: SocialMedia()),
          ],
        ),
      ),
    );
  }
}