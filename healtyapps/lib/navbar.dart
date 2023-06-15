import 'package:flutter/material.dart';
import 'package:healtyapps/home.dart';
import 'package:healtyapps/slepp_record.dart';
import 'package:healtyapps/calculator.dart';
import 'package:healtyapps/running.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static List<Widget> body = <Widget>[
    Beranda(),
    RunningTrackerApp(),
    SleepCalculator(),
    Calculator(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
