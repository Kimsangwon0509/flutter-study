import 'package:flutter/material.dart';

import 'a_scree.dart';
import 'b_screen.dart';
import 'c_screen.dart';
import 'd_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AScreen(),
    BScreen(),
    CScreen(),
    DScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[800],
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.accessibility),
            title: new Text('이준호'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.sentiment_satisfied),
            title: new Text('김찬영'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('김혜인'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('정현식'),
          )
        ],
      ),
    );
  }
}
