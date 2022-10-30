import 'package:find_your_way/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'connection_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  final screens = <Widget>[
    const HomeScreen(),
    const ConnectionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [Icon(Icons.notification_important),Icon(Icons.share),Icon(Icons.search)],
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        backgroundColor: const Color(0xFFffffff),
        selectedItemColor: Colors.blueAccent,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35.0,
              color: Colors.white,
            ),
            backgroundColor: Color(0xFFffff),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35.0,
              color: Colors.black,
            ),
            backgroundColor: Color(0xFF161616),
            label: "",
          ),
        ],
      ),

    );
  }
}
