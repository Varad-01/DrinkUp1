import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  DateTime savedDate = DateTime.now();
  bool loading = false;
  DateTime? savedDate1;
  String time0 = "";

  @override
  void initState() {
    super.initState();
    startTimer();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller!);
    setTime();
    getData();
    print(savedDate.day);
    // print(time0);
    print(DateTime.now().day);
    if(loading)
    {
      if (DateTime
          .now()
          .day != savedDate.day)
      {
        updateUser();
      }
    }
  }


  Future getData() async{
    print("getData() func is called");
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString()).get().then((value) async{
      setState(() {
        time0=value['Time1'];
        savedDate = DateTime.parse(time0);
      });
    }).catchError((error) => print("Failed to load users data: $error"));
    if(savedDate!=DateTime.now())
    {
      loading = true;
      setState(() {

      });
    }
  }

    Future<void> setTime() {
      CollectionReference docUser = FirebaseFirestore.instance.collection('users');
      String time0 = DateTime.now().add(Duration(days: 12)).toString();

      return docUser
          .doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString())
          .update({'Time1': time0})
          .then((value) {
            setState(() {

            });
      })
          .catchError((error) => print("Failed to update user: $error"));
    }

  startTimer() {
    var duration = const Duration(milliseconds: 2600);
    return Timer(duration, () {
      _controller!.forward().whenComplete(() {
        Navigator.pushReplacementNamed(context, '/snapshott');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: FadeTransition(
        opacity: _opacityAnimation!,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/page-1/images/water-meter-fill.gif',
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Future<void> updateUser() {
    CollectionReference docUser = FirebaseFirestore.instance.collection('users');

    return docUser
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString())
        .update({'consumed': 0})
        .then((value) {
      print("User Updated");
    })
        .catchError((error) => print("Failed to update user: $error"));
  }
}

