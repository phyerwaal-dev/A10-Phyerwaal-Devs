import 'package:busapp/screens/buslist.dart';
import 'package:busapp/screens/widgets/home.dart';
import 'package:busapp/screens/widgets/status.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  final List<Widget> pages = [Home(), BusList(), Status()];

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        onTap: onTabTapped, // new
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              size: 32,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.directions_bus,
              size: 32,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              size: 32,
            ),
            label: "",
          )
        ],
      ),
    );
  }
}
