import 'package:flutter/material.dart';

// class ReusableTabBarScreen extends StatelessWidget {
//   final List<Tab> tabs;
//   final List<Widget> pages;
//   final String? appBarTitle;
//   final Color appBarColor;
//   final Color tabBarColor;
//   final Color indicatorColor;
//   final Color labelColor;
//   final Color unselectedLabelColor;

//   const ReusableTabBarScreen({
//     super.key,
//     required this.tabs,
//     required this.pages,
//     this.appBarTitle,
//     this.appBarColor = Colors.white,
//     this.tabBarColor = Colors.white,
//     this.indicatorColor = Colors.black,
//     this.labelColor = Colors.black,
//     this.unselectedLabelColor = Colors.grey,
//   }) : assert(tabs.length == 5 && pages.length == 5, 'Must provide exactly 5 tabs and 5 pages');

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: appBarColor,
//           title: appBarTitle != null ? Text(appBarTitle!) : null,
//           bottom: TabBar(
//             tabs: tabs,
//             indicatorColor: indicatorColor,
//             labelColor: labelColor,
//             unselectedLabelColor: unselectedLabelColor,
//             // isScrollable: false, // Uncomment if you want fixed tabs
//           ),
//         ),
//         body: TabBarView(
//           children: pages,
//         ),
//       ),
//     );
//   }
// } 