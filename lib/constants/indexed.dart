import 'package:flutter/material.dart';

class BottomNavigation2 extends StatefulWidget {
  const BottomNavigation2({super.key, required this.initialIndex, this.onIndexChange});

  final int initialIndex;
  final ValueChanged<int>? onIndexChange;

  @override
  State<BottomNavigation2> createState() => _BottomNavigation2State();
}

class _BottomNavigation2State extends State<BottomNavigation2> {
  late int _selectedIndex = widget.initialIndex;

    void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        widget.onIndexChange?.call(index);
        _selectedIndex = index;
      });
    }
  }

  Widget buildNavIcon(IconData iconData, bool isSelected) {
    return isSelected
        ? Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7), // Shadow color
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Icon(iconData),
          )
        : Icon(iconData);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: buildNavIcon(Icons.chat, _selectedIndex == 0),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: buildNavIcon(Icons.chat, _selectedIndex == 1),
          label: 'AI Assistant',
        ),
        BottomNavigationBarItem(
          icon: buildNavIcon(Icons.history, _selectedIndex == 2),
          label: 'History',
        ),
      ],
    );
  }
}