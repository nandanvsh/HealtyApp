import 'package:flutter/material.dart';
import 'package:healtyapps/about.dart';
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
    AboutApp()
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
            icon: Icon(
              Icons.home,
              size: 40,
            ),
            // icon: Image.asset(
            //   "images/navbar_home.png",
            //   width: 40,
            //   height: 40,
            // ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.run_circle,
              size: 40,
            ),
            // icon: Image.asset(
            //   "images/navbar_run.png",
            //   width: 40,
            //   height: 40,
            // ),
            label: 'Run',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airline_seat_flat_rounded,
              size: 50,
            ),
            // icon: Image.asset(
            //   "images/navbar_sleep.png",
            //   width: 40,
            //   height: 40,
            // ),
            label: 'Sleep Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate_rounded,
              size: 40,
            ),
            // icon: Image.asset(
            //   "images/navbar_bmi.png",
            //   width: 40,
            //   height: 40,
            // ),
            label: 'BMI Checker',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info_rounded,
              size: 40,
            ),
            // icon: Image.asset(
            //   "images/i.jpg",
            //   width: 40,
            //   height: 40,
            // ),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        // ignore: prefer_const_constructors
        selectedItemColor: Color(0xff7F78D2),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
