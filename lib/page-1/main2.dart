import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/page-1/home-screen-01.dart';
import 'package:myapp/page-1/home-screen-02.dart';
import 'package:myapp/page-1/home-screen-03.dart';

class main2 extends StatefulWidget {
  const main2({Key? key}) : super(key: key);

  @override
  State<main2> createState() => _main2State();
}

class _main2State extends State<main2> {

  int _currentIndex=0;
  final screens=[    Scene(),    Scene2(),    Scene3(),  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        // decoration: BoxDecoration(
        //   color: Colors.transparent,
        //   boxShadow: [
        //     BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        //   ],
        // ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 23),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 28,
            padding: EdgeInsets.all(12.0),
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: Colors.blue.shade800,
            backgroundColor: Colors.transparent,
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home
              ),
              GButton(
                icon: Icons.bar_chart_outlined,
              ),
              GButton(
                icon: Icons.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
