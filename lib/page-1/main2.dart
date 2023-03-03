import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/page-1/home-screen-02.dart';
import 'package:myapp/page-1/home-screen-03.dart';

import 'home-screen-01.dart';

class main2 extends StatefulWidget {
  const main2({Key? key}) : super(key: key);

  @override
  State<main2> createState() => _main2State();
}

class _main2State extends State<main2> {

  int _curentIndex=0;
  Color changeColor1=const Color.fromRGBO(23, 155, 255,1);

  final screens=[
    Scene(),
    Scene2(),
    Scene3(),
  ];
  bool check=false;


  @override
  Widget build(BuildContext context) {

    Color navColor=Color.fromRGBO(23, 155, 255,1);
    Color tabColor=Colors.grey.shade800;

    return Scaffold(
      body: screens[_curentIndex],
      bottomNavigationBar: Container(
        // color: const Color.fromRGBO(23, 155, 255,1),
        color: navColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 13),
          child: GNav(
            // onTabChange: (index)=> setState(()=> _curentIndex=index),
            onTabChange: (index){
              setState(() {
                if(index==0){
                  print(index);
                  navColor=Color.fromRGBO(23, 155, 255,1);
                  print(navColor);
                }
                else if(index>0){
                  print(index);
                  navColor=Colors.white;
                  print(navColor);
                }
                _curentIndex=index;
              });
            },
            // backgroundColor: const Color.fromRGBO(23, 155, 255,1),
            backgroundColor: navColor,
            selectedIndex: _curentIndex,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blue.shade800,
            gap: 8,
            iconSize: 28,
            padding: const EdgeInsets.all(12.0),

            tabs: [
              GButton(
                icon: Icons.home,
                // text: 'Home',
              ),
              GButton(
                icon: Icons.bar_chart_outlined,
                // text: 'Progress',
              ),
              GButton(
                icon: Icons.settings,
                // text: 'Settings',
              ),

              GButton(
                icon: Icons.logout,
                text: 'Logout',
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, '/phone_auth');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// onTap: (index)=> setState(()=> _curentIndex=index),
// currentIndex: _curentIndex,
// iconSize: 34,
//
// items: [
// BottomNavigationBarItem(
// icon: Icon(Icons.home_outlined),
// label: 'home'
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.bar_chart_outlined),
// label: 'home',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.settings),
// label: 'home'
// ),
//
// ],


