import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTab = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text("HOME"),
    Text("DESK"),
    Text("NEWS"),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;

    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xff8A8A8A),
          onTap: onSelectTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: "DESK"),
            BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "NEWS"),
          ]),
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
    );
  }
}
