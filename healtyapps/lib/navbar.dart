import 'package:flutter/material.dart';
import 'package:healtyapps/home.dart';
import 'package:healtyapps/slepp_record.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Beranda(username: "Beranda"),
    SleepCalculator(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15)
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/navbar_home.png",
              width: 40,
              height: 40,
            ),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/navbar_run.png",
              width: 40,
              height: 40,
            ),
            label: 'Run',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/navbar_sleep.png",
              width: 40,
              height: 40,
            ),
            label: 'Sleep Record',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/navbar_bmi.png",
              width: 40,
              height: 40,
            ),
            label: 'BMI Checker',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff7F78D2),
        onTap: _onItemTapped,
      ),
    );
  }
}
