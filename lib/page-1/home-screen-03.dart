import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import '../Services/notifi_service.dart';


class Scene3 extends StatefulWidget {
  @override
  State<Scene3> createState() => _Scene3State();
}

class _Scene3State extends State<Scene3> {

  void initState() {
    super.initState();
    getData();
  }

  late bool switchValue;
  String notificationText="off";
  Future getData() async{
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString()).get().then((value) async{
      setState(() {
        switchValue=value['notification'];
      });
      if(switchValue==true){
        notificationText="on";
        print(switchValue);
      }
      else{
        notificationText="off";
        print(switchValue);
      }
    });
    print("Fetched Data Successfully");

  }

  @override
  Widget build(BuildContext context) {
    NotificationsServices notificationsServices = NotificationsServices();
    final consumption = TextEditingController();


    print(notificationText);

    TextEditingController _consumptionLimitController = TextEditingController();
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // homescreen03d8f (1:167)
            padding: EdgeInsets.fromLTRB(28*fem, 88*fem, 28*fem, 65*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(35*fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // settingsHU7 (1:175)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 57*fem),
                  child: Text(
                    'Settings',
                    style: SafeGoogleFont (
                      'Satoshi',
                      fontSize: 34*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2575*ffem/fem,
                      color: const Color(0xff179bff),
                    ),
                  ),
                ),


                Container(
                  // autogroupfadzxKM (39vfwsCqHNRM4BrjpZfADZ)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 53.58*fem),
                  width: double.infinity,
                  // height: 30*fem,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // remindersSkK (1:177)
                        // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 145*fem, 2*fem),
                        child: Text(
                          'Reminders',
                          style: SafeGoogleFont (
                            'Satoshi',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2575*ffem/fem,
                            color: const Color(0xff0a0f25),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 90.0,
                        height: 40.0,
                        child: LiteRollingSwitch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                              print(value);
                            });
                            if (value) {
                              print(value);
                              // Switch is turned on
                              notificationsServices.initialiseNotificationS();
                              notificationsServices.scheduleNotification("Drink Water","Have you had any water yet?");
                            } else {
                              print(value);
                              // Switch is turned off
                              notificationsServices.initialiseNotificationS();
                              notificationsServices.stopNotification();
                            }
                          },
                          onTap: () {},
                          onDoubleTap: () {},
                          onSwipe: () {},
                          width: 90.0,
                          textOn: "On",
                          textOff: 'Off',
                          colorOn: Colors.green,
                          colorOff: Colors.red,
                          iconOn: Icons.alarm,
                          iconOff: Icons.alarm_off,
                          textSize: 16.0,
                        ),
                      )

                    ],
                  ),
                ),

                //next
                Container(
                  // autogroup1rcbyXH (39vg7cRbV4QDUVTQqE1rcB)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 61*fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        // dailyconsumptionGmH (1:178)
                        // margin: EdgeInsets.fromLTRB(0*fem, 4.42*fem, 151*fem, 0*fem),
                        child: Text(
                          'Daily consumption',
                          style: SafeGoogleFont (
                            'Satoshi',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w400,
                            // height: 1.2575*ffem/fem,
                            color: const Color(0xff0a0f25),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 50,
                        height: 35,
                        child:  Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            final limit = consumption.text;
                            // updateUser(limit: limit);
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  // Future<void> updateUser({required String limit}) {
  //   CollectionReference docUser = FirebaseFirestore.instance.collection('users');
  //
  //   return docUser
  //       .doc('ABC')
  //       .update({'limit': limit})
  //       .then((value) {
  //     print("User Updated");
  //     Navigator.pushNamed(context, '/startPage1');
  //   })
  //       .catchError((error) => print("Failed to update user: $error"));
  // }
}